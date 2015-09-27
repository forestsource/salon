class Member < ActiveRecord::Base
  has_many :reserves, dependent: :destroy
  has_one :staff,class_name:"Staff", foreign_key: "member_id"
  belongs_to :reserve ,class_name:"Reserves",foreign_key: "member_id"

   attr_accessible :id, :name, :birthday, :sex, :tel, :adress, :mail,
     :magazine, :user_name, :password, :administrator, :clerk, :password_confirmation
   validates_uniqueness_of :user_name
   
   attr_accessor  :password_confirmation, :password
   
   validates :password, presence: { on: :create},
     confirmation: { allow_blank: true}
     
  def password=(val)
    if val.present?
      self.hashed_password = BCrypt::Password.create(val)
    end
    @password = val
  end

  class << self
    def search(query)
      rel = order("id")
      if query.present?
        rel = rel.where("name LIKE ? OR user_name LIKE ?",
                "%#{query}%", "%#{query}%")
      end
      rel
    end
    
    def authenticate(name, password)
      member = find_by_user_name(name)
      if member && member.hashed_password.present? &&
         BCrypt::Password.new(member.hashed_password) == password
        member
      else
        nil
      end
    end
  end
end