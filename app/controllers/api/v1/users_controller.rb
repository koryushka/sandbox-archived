module Api
  module V1
    class UsersController < BaseController
      # include Api::V1::UsersHelper
      before_action :fetch_user, except: [:index, :me]
      before_action except: [:index, :me] do
        doorkeeper_authorize! :admin, :user
      end
      before_action only: [:update, :destroy] do
        doorkeeper_authorize! :admin
      end

      def index
        @users = User.all
        render json: @users, each_serializer: SimpleUserSerializer, status: 200
        # render text: 'Index'
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
        render json: {user: current_user}
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
