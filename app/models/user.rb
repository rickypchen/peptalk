class User < ActiveRecord::Base
  has_many :quotes

  has_many :actively_following, :class_name => "Motivation", :foreign_key => "user_id"
  has_many :being_followed, :class_name => "Motivation", :foreign_key => "subscribed_to_id"

   has_many :motivators, :through => :actively_following
  has_many :followers, :through => :being_followed

  validates_presence_of :username, :first_name, :last_name, :password

  validates :username, uniqueness: true

  include BCrypt

    def password
      @password ||= Password.new(password_hash)
    end

    def password=(new_password)
      @password = Password.create(new_password)
      self.password_hash = @password
    end

    def authenticate(password)
      self.password == password
    end

end
