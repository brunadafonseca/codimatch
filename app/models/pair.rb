class Pair < ApplicationRecord
  has_and_belongs_to_many :users
  belongs_to :day

  def self.pair_students
    students = User.all.students.pluck(:email)
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

      puts "#{@all_pairs}"
      a.insert(1, b.shift)
      b.insert(-1, a.pop);
    end
    return @all_pairs
  end
end
