module Api
  module V1
    module UsersHelper

      def user_info(user)
        user.email + ' ' + user.created_at.to_s
      end

    end
  end
end
