module Api
  module V1
    class UsersController < BaseController
      before_action :fetch_user, except: [:index, :me]
      before_action do
        doorkeeper_authorize! :admin, :user
      end
      before_action only: [:update, :destroy] do
        doorkeeper_authorize! :admin
      end

      def index
        @users = User.all
        render json: @users, each_serializer: SimpleUserSerializer, status: 200
      end

      def show
        render json: @user
      end

      def destroy
        if @user.destroy
          head :no_content
        end
      end

      def update
      end

      def update_self_account
      end

      def me
        render json: current_user, status: 200
      end

      private

      def fetch_user
        @user = User.find(params[:id])
      end

      def user_params
        params.permit(:first_name, :last_name)
      end
    end
  end
end
