module Api
  module Auth
    class ConfirmationsController < Devise::ConfirmationsController
      respond_to :json
      def show
        self.resource = resource_class.confirm_by_token(params[:confirmation_token])
        yield resource if block_given?

        if resource.errors.empty?
          render json: {success: 'Confirmed'}
        else
          render json: {errors: resource.errors.full_messages}
        end
      end
    end
  end
end
