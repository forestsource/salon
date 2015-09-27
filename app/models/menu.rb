class Menu < ActiveRecord::Base
  has_many :reserves
  belongs_to :category
  
  attr_accessible  :menu_name, :menu_time, :price, :category_id
  validates :menu_name,:price, presence: true
  validates_uniqueness_of:menu_name ,:scope =>  :id
  
  
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
