class User < ApplicationRecord
  # Include default auth modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  has_many :posts, dependent: :destroy
  # around_create :log

  # self.ignored_columns = %w(email)
  #
  # def self.create(*params, confirm: true)
  #   if confirm == true
  #     super(params)
  #   elsif confirm == false
  #     user = new(params)
  #     user.skip_confirmation!
  #     user.save
  #   end
  #   puts params.class
  #   puts 'Created'
  # end

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
    puts "User #{self.id} successfully created!"
  end

end
