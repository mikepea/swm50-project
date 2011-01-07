class Dish < ActiveRecord::Base

    has_many :reviews, :dependent => :destroy
    belongs_to :location
    belongs_to :user

    validates :user_id, :presence => true, :numericality => { :only_integer => true }
    validates :location_id, :presence => true, :numericality => { :only_integer => true }
    validates :name, :presence => true
    validates :name, :format => {
        :with   => %r{\A[-a-zA-Z0-9 \!\']+\z}, 
        :message => 'can only contain a-z, 0-9, space and -, !, \''
    }

end
