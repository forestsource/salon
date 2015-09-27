class Open < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :id, :time
  has_one :reserve
  has_many :shifts, foreign_key: "going_time"
  has_many :shifts, foreign_key: "leave_time"
end
