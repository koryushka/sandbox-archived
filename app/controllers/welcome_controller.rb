class WelcomeController < ApplicationController
  # before_action :authenticate_user!
  def index
    # http_cache_forever(public: true) {}
    # @users = User.take(100000)
    # @users = []
    # User.find_in_batches(finish: 100000, batch_size: 1000) do |group|
    #   group.each {|person| @users << person}
    # end
    @users = User.limit(10000)
  end
end
