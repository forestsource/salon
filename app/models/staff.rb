class Staff < ActiveRecord::Base
   belongs_to :category#,class_name:"Categories",foreign_key: "categorie_id"
   belongs_to :member#,class_name:"Member", foreign_key: "member_id"
   has_many :shifts ,dependent: :destroy
   has_many :reserves
   
   attr_accessible :member_id, :category_id, :intro_myself, :interest, :staff_image
   
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

