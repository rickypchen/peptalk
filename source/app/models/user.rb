class User < ActiveRecord::Base
  has_many :quotes
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
