class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_one :address
  has_and_belongs_to_many :events
  has_many :enrollments
  has_many :games, through: :enrollments
  has_one :purse
  has_one :payment_history, through: :purse
  has_many :comments, as: :commentable

  attr_accessor :password, :username, :email, :password, :password_confirmation
  EMAIL_REGEX = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i
  validates :username, :presence => true, :uniqueness => true, :length => { :in => 3..20 }
  #validates :email, :presence => true, :uniqueness => true, :format => EMAIL_REGEX,
  validates :password, :confirmation => true #password_confirmation attr
  validates_length_of :password, :in => 6..20, :on => :create

  after_initialize do |user|
    puts "You have initialized an object!"
  end

  after_find do |user|
    puts "You have found an object!"
  end

  after_touch do |user|
   puts "You have touched an object"
  end

  #after_create_commit :log_user_saved_to_db
  after_commit :log_user_saved_to_db, on: [:create, :update]

   private
   def log_user_saved_to_db
     puts 'User was saved to database'
   end



end
