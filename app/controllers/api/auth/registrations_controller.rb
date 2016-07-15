module Api
  module Auth
    class RegistrationsController < Devise::RegistrationsController


      # protect_from_forgery with: :null_session
      # skip_before_action :verify_authenticity_token
      # skip_before_action :require_no_authentication
      # before_action :configure_permitted_parameters

      def create
        build_resource(user_params)

        if resource.save
          # render 'api/v1/registrations/show', status: 200
          # UserMailer.confirmation_instructions(resource).deliver_now!
          render json: {user: resource}, status: 200
        else
          render json: {errors: resource.errors.full_messages}, status: 403
        end
      end

      # def update
      #   resource.skip_confirmation!
      #   super
      # end

      protected
      def user_params
        params.permit(:email, :password)
      end

      # def configure_permitted_parameters
      #   #  devise_parameter_sanitizer.for(:sign_up).push(:name, :second_name)
      #   devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :second_name, :email, :password, :password_confirmation])
      #
      # end
    end
  end
end
