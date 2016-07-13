class Api::V1::WelcomeController < ApplicationController

  def index
    Movie.first.destroy
    Movie.create!(c1: rand(10), c2: SecureRandom.uuid, c3: SecureRandom.hex)

    render json: {movies: Movie.all}
  end

end
