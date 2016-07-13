class Post < ApplicationRecord
  belongs_to :user
  after_create :notify!

  def notify!
    Post.create!(title: "Notify", text: "#{Time.now}")
  end
end
