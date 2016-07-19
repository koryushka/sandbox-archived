module Api
  module V1
    class ProductsController < BaseController
      def index
        @products = Product.all
        render json: @products,  status: 200
      end
    end
  end
end
