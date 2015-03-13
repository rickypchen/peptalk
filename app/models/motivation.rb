class Motivation < ActiveRecord::Base
  belongs_to :follower, :class_name => "User", :foreign_key => "follower_id"
  belongs_to :motivator, :class_name => "User", :foreign_key => "motivator_id"
end
