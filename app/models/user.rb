class User < ApplicationRecord

    has_secure_password

    has_many :goals
    has_many :partner_goals, class_name: 'Goal', as: :partner
    has_one :network
    has_many :network_goals, through: :network, source: :partner, source_type: 'Goal'

    validates :username, uniqueness: { case_sensitive: true }, length: { minimum: 4, maximum: 14 }
    validates :age, numericality: { only_integer: true, message: 'must be an number.' }
    validates :age, numericality: { greater_than: 17, message: 'must be 18 or older to use this application.' }
    validates :email, format: { with: /\S+@[a-z]+.com/i }, uniqueness: { case_sensitive: false }
    validates :bio, length: { maximum: 180 }
    validates :location, format: { with: /[0-9]{5}/, message: 'must be standard 5 digit US zip code' }
    
end
