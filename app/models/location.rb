class Location < ActiveRecord::Base

    has_many :location_descriptions, :dependent => :destroy

    validates :name, :presence => true
    validates :name, :format => {
        :with   => %r{\A[-a-zA-Z0-9 \!\']+\z}, 
        :message => 'can only contain a-z, 0-9, space and -, !, \''
    }

    #validates_length_of :name, 
    #  :minimum   => 1,
    #  :maximum   => 100
    #}

    def current_description 
        LocationDescription.find_last_by_location_id(self.id).description
    end

end
