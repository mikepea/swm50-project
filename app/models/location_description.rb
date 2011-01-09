class LocationDescription < ActiveRecord::Base
  belongs_to :location
  validates :location_id, :presence => true, :numericality => { :only_integer => true }
end
