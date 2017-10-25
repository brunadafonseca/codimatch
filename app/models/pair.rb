class Pair < ApplicationRecord
  has_and_belongs_to_many :users, dependent: :destroy
  belongs_to :day

  def pair_students(students = [])
    students.shuffle!
    number_of_pairs = (students.size) / 2
    number_of_days = (students.size) - 1
    a = students.first(number_of_pairs)
    b = students.last(number_of_pairs)

    number_of_days.times do
      all_pairs = []
      i = 0
      while i < number_of_pairs
        all_pairs.push([a[i], b[i]])
        i += 1
      end

      a.insert(1, b.shift)
      b.insert(-1, a.pop);
    end
  end
end
