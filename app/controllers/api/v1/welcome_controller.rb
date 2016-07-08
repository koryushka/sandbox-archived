class Api::V1::WelcomeController < ApplicationController

  def index
    render :index, status: :ok
  end
end
