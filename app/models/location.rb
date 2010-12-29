class Location < ActiveRecord::Base
    validates :name, :presence => true
    validates :name, :format => {
        :with   => %r{\A[-a-zA-Z0-9 \!\']+\z}, 
        :message => 'can only contain a-z, 0-9, space and -, !, \''
    }

    validates_length_of :name, 
      :minimum   => 1,
      :maximum   => 100,

end
