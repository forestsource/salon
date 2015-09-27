class Category < ActiveRecord::Base
   has_many :menus
   has_many :staffs
   
   attr_accessible :id, :category_name
   
   class << self
    def search(query)
      rel = order("id")
      if query.present?
        rel = rel.where("name LIKE ?", "%#{query}%")
      end
      rel
    end
   end
   
end
