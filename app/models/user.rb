class User < ApplicationRecord
       devise :database_authenticatable, :registerable,
              :recoverable, :rememberable, :validatable
     
       validates :name, presence: true, length: { maximum: 50 }
     
       before_save { email.downcase! }
     end
     