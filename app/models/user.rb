class User < ApplicationRecord
  has_many :pairs
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

   scope :students, -> { where(admin: false) }

   def is_admin?
     admin?
   end
end
