class User < ActiveRecord::Base

    has_many :reviews
    has_many :dishes
    has_many :locations

    belongs_to :role

    validates :username, :presence => true, :uniqueness => true
    validates :name, :presence => true
    validates :email, :presence => true
    validates :password, :confirmation => true 
    validates :role_id, :presence => true, :numericality => { :only_integer => true }

    validates :name, :format => {
        :with   => %r{\A[-a-zA-Z0-9 \']+\z}, 
        :message => 'can only contain a-z, 0-9, space and -, \''
    }

    validates :username, :length => { :minimum => 2, :maximum => 254 }

    validates :email,
        :length => { :minimum => 5, :maximum => 254 }
        #:message => 'must be between 5 and 254 characters long'

    validates :email,
        :format => {
            :with   => %r{^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$}i,
            :message => 'must be a valid email address'
        }

    attr_accessor :password_confirmation 
    attr_reader :password

    validate :password_must_be_present 

    def is_admin?
      [ 'admin' ].include?(self.role.name) ? true : false
    end

    def is_full_moderator?
      [ 'admin', 
          'full_moderator' ].include?(self.role.name) ? true : false
    end

    def is_city_moderator?
      [ 'admin', 
          'full_moderator', 
          'city_moderator' ].include?(self.role.name) ? true : false
    end

    def is_location_moderator?
      [ 'admin', 
          'full_moderator', 
          'city_moderator' , 
          'location_moderator' ].include?(self.role.name) ? true : false
    end

    def is_dish_moderator?
      [ 'admin', 
          'full_moderator', 
          'city_moderator' , 
          'location_moderator' , 
          'dish_moderator' ].include?(self.role.name) ? true : false
    end

    def is_review_moderator?
      [ 'admin', 
          'full_moderator', 
          'city_moderator' , 
          'location_moderator' , 
          'dish_moderator', 
          'review_moderator' ].include?(self.role.name) ? true : false
    end

    def is_moderator?
      [ 'admin', 
          'full_moderator', 
          'city_moderator' , 
          'location_moderator' , 
          'dish_moderator', 
          'review_moderator' ].include?(self.role.name) ? true : false
    end

    def is_general_user?
      [ 'admin', 
          'full_moderator', 
          'city_moderator' , 
          'location_moderator', 
          'dish_moderator', 
          'review_moderator', 
          'general_user' ].include?(self.role.name) ? true : false
    end

    def User.authenticate(username, password) 
      if user = find_by_username(username)
        if user.hashed_password == encrypt_password(password, user.salt) 
            user
        end 
      end
    end

    def User.encrypt_password(password, salt) 
      Digest::SHA2.hexdigest(password + "wuweger" + salt)
    end

    def password=(password) 
      @password = password
      if password.present? 
        generate_salt 
        self.hashed_password = self.class.encrypt_password(password, salt)
      end 
    end

    private

      def password_must_be_present 
        errors.add(:password, "Missing password") unless hashed_password.present?
      end

      def generate_salt 
        self.salt = self.object_id.to_s + rand.to_s
      end

end
