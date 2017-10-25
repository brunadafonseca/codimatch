class Pair < ApplicationRecord

  belongs_to :user

  def pairstudents(students = [])
    students.shuffle!
    n = (students.size)-1
    a = students.first(3)
    b = students.last(3)

    n.times do
      matches = []
      i = 0
      while i < (students.size)/2
        matches.push([a[i], b[i]])
        i += 1
      end

      a.insert(1, b.shift)
      b.insert(-1, a.pop);
    end
  end
end
