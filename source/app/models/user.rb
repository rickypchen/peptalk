class User < ActiveRecord::Base
  validates_presence_of :username, :first_name, :last_name, :password_hash

  validates :username, uniqueness: true

  include BCrypt

    def password
      @password ||= Password.new(password_hash)
    end

    def password=(new_password)
      @password = Password.create(new_password)
      self.password_hash = @password
    end

end
