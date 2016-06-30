class Api::V1::UsersController < ApplicationController
  def index
    @users = User.all
  end

  def destroy
  end

  def update
  end

  def update_self_account
  end
end
