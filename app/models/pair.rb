class Pair < ApplicationRecord

  def self.generate_pairs
    users = User.all
    students = users.students.pluck(:id)

    students.shuffle!

    number_of_pairs = (students.size) / 2
    number_of_days = (students.size) - 1

    a = students.first(number_of_pairs)
    b = students.last(number_of_pairs)

    @all_pairs = []
    @days = 1
    number_of_days.times do
      @daily_pairs = []
      i = 0
      while i < number_of_pairs
        @daily_pairs.push([a[i], b[i]])
        i += 1
      end

    a.insert(1, b.shift)
    b.insert(-1, a.pop);
    @days += 1
    @all_pairs.push(@daily_pairs)
    end
    @all_pairs
  end

  def students
    student1 = User.find(self.student_1_id)
    student2 = User.find(self.student_2_id)
    students = [student1.email, student2.email]
  end

  def self.student(id)
    Pair.where(:student_1_id => id).
    or(where(:student_2_id => id))
  end

  scope :students, -> { where(admin: false) }
  scope :today, -> { where(:date => Date.today) }
  scope :past_days, -> { where("date < ?", Date.today) }

end
