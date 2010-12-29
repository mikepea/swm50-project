class Dish < ActiveRecord::Base
    validates :name, :presence => true
end
