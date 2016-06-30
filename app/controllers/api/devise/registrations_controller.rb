class Api::Devise::RegistrationsController < Devise::RegistrationsController
  # include Parametrable
  # protect_from_forgery with: :null_session
  # skip_before_action :verify_authenticity_token
  # skip_before_action :require_no_authentication
  # before_action :configure_permitted_parameters

  def create
    build_resource(user_params)

    if resource.save
      render 'api/v1/registrations/show', status: 200
    else
      render json: {errors: resource.errors.full_messages}, status: 403
    end
  end

  protected
  def user_params
    params.permit(:email, :password)
  end

end