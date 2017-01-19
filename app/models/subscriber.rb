class Subscriber < ActiveRecord::Base
    before_create :generate_unsubscribe_token
    
    belongs_to :user
    
    # Email Validation including definition of allowed format
    EMAIL_REG = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
    validates :email, presence: true, uniqueness: { scope: :user_id, message: 'is already subscribed to this blogger' }, format: { with: EMAIL_REG }
    
    private
    
        def generate_unsubscribe_token
            self.unsubscribe_token = SecureRandom.urlsafe_base64
        end
end
