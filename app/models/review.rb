class Review < ActiveRecord::Base

    validates :review_body, :presence => true
    validates :dish_id, :presence => true, :numericality => { :only_integer => true }

    belongs_to :dish
    belongs_to :user

end
