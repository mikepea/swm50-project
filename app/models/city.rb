class City < ActiveRecord::Base

    has_many :locations
    belongs_to :user

    validates :user_id, :presence => true, :numericality => { :only_integer => true }
    validates :name, :presence => true
    validates :name, :uniqueness => true
    validates :name, :format => {
        :with   => %r{\A[-a-zA-Z0-9 \!\']+\z}, 
        :message => 'can only contain a-z, 0-9, space and -, !, \''
    }

    validates_length_of :name, 
      :minimum   => 1,
      :maximum   => 100,

end
