module  Api
  module V1
    class BaseController < ::ActionController::API

      private
      def current_user
        User.find(doorkeeper_token.resource_owner_id) if doorkeeper_token
      end
    end
  end
end