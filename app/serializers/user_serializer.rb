class UserSerializer < SimpleUserSerializer
  include Rails.application.routes.url_helpers
  attributes :url, :admin, :first_name, :last_name
  has_many :posts

  def url
    api_user_path(object)
  end

end
