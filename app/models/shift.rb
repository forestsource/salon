class Shift < ActiveRecord::Base
  attr_accessible :id, :staff_id, :day, :going_time, :leave_time
  belongs_to :staff
  belongs_to :going, :class_name => 'Open', :foreign_key => 'going_time'
  belongs_to :leave, :class_name => 'Open', :foreign_key => 'leave_time'
  
  class << self
    def search_day(query)
      rel = order("id")
      if query.present?
        rel = rel.where("day LIKE ?", "%#{query}%")
      end
      rel
    end
    
    def search_name(query)
      rel = order("id")
      if query.present?
        if @staff.present?
          rel = rel.where(staff_id: query)
        end
        p"*************************************"
        p 
        p"*************************************"
      end
      rel
    end
    
  end
end
 