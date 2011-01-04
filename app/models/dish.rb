class Dish < ActiveRecord::Base

    has_many :reviews, :dependent => :destroy
    belongs_to :location

    validates :name, :presence => true
    validates :name, :format => {
        :with   => %r{\A[-a-zA-Z0-9 \!\']+\z}, 
        :message => 'can only contain a-z, 0-9, space and -, !, \''
    }

end
