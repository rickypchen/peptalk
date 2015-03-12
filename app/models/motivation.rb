class Motivation < ActiveRecord::Base
  belongs_to :follower, :class_name => "User", :foreign_key => "subscribed_to_id"
  belongs_to :motivator, :class_name => "User", :foreign_key => "user_id"
end
