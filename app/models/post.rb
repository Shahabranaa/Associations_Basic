class Post < ApplicationRecord
  belongs_to :user
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'
  has_and_belongs_to_many :posts

  after_destroy :log_destroy_action

  def log_destroy_action
    puts 'Post destroyed'
  end
end
