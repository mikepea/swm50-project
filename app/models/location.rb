class Location < ActiveRecord::Base

    has_many :location_descriptions, :dependent => :destroy
    has_many :dishes, :dependent => :destroy

    belongs_to :user
    belongs_to :city

    validates :user_id, :presence => true, :numericality => { :only_integer => true }
    validates :city_id, :presence => true, :numericality => { :only_integer => true }
    validates :name, :presence => true
    validates :name, :format => {
        :with   => %r{\A[-a-zA-Z0-9 \!\']+\z}, 
        :message => 'can only contain a-z, 0-9, space and -, !, \''
    }

    after_save  :update_location_description

    #validates_length_of :name, 
    #  :minimum   => 1,
    #  :maximum   => 100
    #}

    def current_description
        ld = LocationDescription.find_last_by_location_id(self.id)
        if @current_description
            @current_description
        elsif ld 
            ld.description
        else
            ""
        end
    end

    def current_description=(desc)
        @current_description=desc
    end

    def update_location_description
        ld = LocationDescription.new(:location_id => self.id, :description => self.current_description)
        ld.save
    end

end
