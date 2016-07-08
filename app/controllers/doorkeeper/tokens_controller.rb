module Doorkeeper
  class TokensController < Doorkeeper::ApplicationsController
    skip_before_action :verify_authenticity_token
    protect_from_forgery with: :null_session
    before_action :correct_scope?, only: [:create], if: :grant_type_password?
    before_action :email_confirmed?, only: [:create]
    def create
      response = authorize_response
      headers.merge! response.headers
      self.response_body = response.body.to_json
      self.status        = response.status
    rescue Errors::DoorkeeperError => e
      handle_token_exception e
    end

    # OAuth 2.0 Token Revocation - http://tools.ietf.org/html/rfc7009
    def revoke
      # The authorization server first validates the client credentials
      if doorkeeper_token && doorkeeper_token.accessible?
        # Doorkeeper does not use the token_type_hint logic described in the RFC 7009
        # due to the refresh token implementation that is a field in the access token model.
        revoke_token(request.POST['token']) if request.POST['token']
      end
      # The authorization server responds with HTTP status code 200 if the
      # token has been revoked successfully or if the client submitted an invalid token
      render json: {}, status: 200
    end

    private

    def revoke_token(token)
      token = AccessToken.by_token(token) || AccessToken.by_refresh_token(token)
      if token && doorkeeper_token.same_credential?(token)
        token.revoke
        true
      else
        false
      end
    end

    def strategy
      @strategy ||= server.token_request params[:grant_type]
    end

    def authorize_response
      @authorize_response ||= strategy.authorize
    end

    def correct_scope?
      user = User.find_by_email(params[:username])
      render json: {error: 'Invalid scope'}, status: 403 and return if !user&.admin? && params[:scope] == 'admin'
    end

    def grant_type_password?
      params[:grant_type] == 'password'
    end

    def email_confirmed?
      user = User.find_by(email: params[:username])
      if user
        unless user.confirmed_at?
          render json: {error: 'confirm your account'} and return
        end
      end
    end
  end
end
