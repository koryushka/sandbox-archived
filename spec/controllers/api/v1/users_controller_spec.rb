require 'spec_helper'

RSpec.describe Api::V1::UsersController, :type => :controller do

  describe "GET index" do
    it 'returns 200 success' do
      get :index, format: :json
      expect(response).to be_success
    end

    it 'returns all users' do
      create_list(:user, 5)

      get :index, format: :json
      parsed_response = JSON.parse response.body
      expect(parsed_response['data'].length).to eq(5)
    end
  end


  # describe "GET destroy" do
  #   it "returns http success" do
  #     delete :destroy
  #     expect(response).to have_http_status(:success)
  #   end
  # end
  #
  # describe "GET update" do
  #   it "returns http success" do
  #     request.accept = "application/json"
  #     put :update,params: { id: 1 }
  #     expect(response).to have_http_status(:success)
  #   end
  # end
  #
  # describe "GET update_self_account" do
  #   it "returns http success" do
  #     put :update_self_account
  #     expect(response).to have_http_status(:success)
  #   end
  # end

end
