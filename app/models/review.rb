class Review < ActiveRecord::Base

    validates :review_body, :presence => true
    belongs_to :dish

    def current_description 
        ld = LocationDescription.find_last_by_location_id(self.id)
        puts "current_description: #{self.id}\n"
        if ld 
            ld.description
        else
            ""
        end
    end

    def current_description=(desc)
        ld = LocationDescription.new(:location_id => self.id, :description => desc)
        ld.save
        desc
    end

end
