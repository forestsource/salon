class Reserve < ActiveRecord::Base
  belongs_to :menu
  belongs_to :staff
  belongs_to :member
  belongs_to :open
  has_many :reserves
  
  attr_accessible :id, :menu_id, :staff_id, :day, :open_id, :member_id
  
  class << self
    def search(query)
      rel = order("id")
      if query.present?
        rel = rel.where("name LIKE ? OR user_name LIKE ?",
                "%#{query}%", "%#{query}%")
      end
      rel
    end
  end
end
 