class User < ApplicationRecord
  has_and_belongs_to_many :pairs, dependent: :destroy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

   def is_admin?
     self.admin?
   end
end
