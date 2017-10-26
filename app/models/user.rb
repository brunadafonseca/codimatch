class User < ApplicationRecord
  has_many :pairs
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

   scope :students, -> { where(admin: false) }

   def is_admin?
     admin?
   end

   def self.generate_pairs
     students = User.all.students.pluck(:id)
     number_of_pairs = (students.size) / 2
     number_of_days = (students.size) - 1
     a = students.first(number_of_pairs)
     b = students.last(number_of_pairs)

     @all_pairs = []
     number_of_days.times do

       i = 0
       while i < number_of_pairs
         @all_pairs.push([a[i], b[i]])
         i += 1
       end

       a.insert(1, b.shift)
       b.insert(-1, a.pop);
     end
     @all_pairs
   end
end
