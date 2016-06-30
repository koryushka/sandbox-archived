require 'spec_helper'

describe User do
  # pending "add some examples to (or delete) #{__FILE__}"
  # before(:each) do
  #   @user = User.new(email: 'test@email.com', password: 'password')
  # end
  let(:user) {build(:user)}

  context 'registration' do
    describe 'with valid data' do
      it 'should create user' do
        expect(user).to be_valid
      end
    end

    describe 'email can not be blank' do
      it 'should not be valid' do
        user.email = ''
        expect(user).to_not be_valid
      end
    end

    describe 'email has already been taken' do
      it 'should not allow to create user' do
        duplicate_email_user = create(:user)
        expect(user).to_not be_valid
      end
    end

    describe 'password is too short' do
      it 'should not be valid' do
        user.password = '12345'
        expect(user).to_not be_valid
      end
    end

    describe 'password can not be blank' do
      it 'should not be valid' do
        user.password = ''
        expect(user).to_not be_valid
      end
    end
  end
end
