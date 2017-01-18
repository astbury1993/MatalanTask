class User < ActiveRecord::Base
    extend FriendlyId
    friendly_id :name, use: [:slugged, :history]
    
    has_many :articles
    has_many :subscribers
    
    has_secure_password
    
    # User Name Validation
    validates :name, presence: true, length: { minimum: 3 }, uniqueness: { case_sensitive: false }
    
    # Email Validation including definition of allowed format
    EMAIL_REG = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
    validates :email, presence: true, uniqueness: {case_sensitive: false }, format: { with: EMAIL_REG }
    
    # Password Validation
    validates :password, length: { minimum: 6 }, allow_nil: true
    
end
