class User < ApplicationRecord
  has_many :pairs
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

   scope :students, -> { where(admin: false) }
   scope :past_days, -> { where("date < ?", Date.today ) }


   def is_admin?
     admin?
   end

   def self.order_users
     order(admin: :desc)
   end
end
