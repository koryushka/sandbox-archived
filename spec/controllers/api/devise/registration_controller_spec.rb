require 'spec_helper'
# include Devise::Test::ControllerHelpers
include Devise::TestHelpers

RSpec.describe Api::Devise::RegistrationsController, :type => :controller do
  before :each do
    request.env['auth.mapping'] = Devise.mappings[:user]
  end

  describe "POST users" do
    it "returns http success" do
      post :create,  {user: {email: 'test@email.com', password: 'password'}}
      expected = {email: 'test@email.com', password: 'password'}.to_json
      expect(response).body.should == expected
    end
  end

end
