json.set! 'users' do
  json.array! @users do |user|
    json.extract! user, :id, :email
  end
end