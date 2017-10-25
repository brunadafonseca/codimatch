class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :pairs
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

   def is_admin?
     self.admin?
   end

   def is_student?
     !self.admin?
   end
end
