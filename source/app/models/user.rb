class User < ActiveRecord::Base
  validates_presence_of :username, :first_name, :last_name
end
