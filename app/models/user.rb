class User < ApplicationRecord
  # Include default auth modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  has_many :posts, dependent: :destroy
  around_create :log

  def publish_post
    posts.create!(title: "Publish!", text: "#{Time.now}")
  end

  #without notification
  def publush_without_notification
    Post.suppress do
      posts.create!(title: "Publish!", text: "#{Time.now}")
    end
  end

  private

  def log
    puts "Preparing for creation..."
    yield
    puts "User successfully created!"
  end

end
