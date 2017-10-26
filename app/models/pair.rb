class Pair < ApplicationRecord
  has_many :users

  @day = Date.today
  @users = User.all
  @students = @users.students.pluck(:id)
  @students.shuffle!
  @test = 1

  def self.generate_pairs

    number_of_pairs = (@students.size) / 2
    number_of_days = (@students.size) - 1
    a = @students.first(number_of_pairs)
    b = @students.last(number_of_pairs)
    @test.times do
      a.insert(1, b.shift)
      b.insert(-1, a.pop);
    end
    @all_pairs = []

    i = 0
    while i < number_of_pairs
      @all_pairs.push([a[i], b[i]])
      i += 1
    end
    puts @day
    puts "#{@all_pairs}"
    @day += 1
    @test += 1
  end


  scope :student, -> (id) { where(:student_1_id => id)}

  scope :students, -> { where(admin: false) }

end
