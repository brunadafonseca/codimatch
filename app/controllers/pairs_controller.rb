class PairsController < ApplicationController
  def index
    @users = User.all
    @user = User.find(current_user[:id])
    @pairs = Pair.generate_pairs
    @students = @users.students
    @i = 0
  end

  def show
    @users = User.all
    @students = @users.students
    @pair = Pair.find(params[:id])
    @pairs = Pair.first(@students.count/2)
    @student1 = User.students.find(@pair.student_1_id)
    @student2 = User.students.find(@pair.student_2_id)
  end

  def create
    @matches = Pair.generate_pairs
    date = Date.new(pair_params["date(1i)"].to_i,
                    pair_params["date(2i)"].to_i,
                    pair_params["date(3i)"].to_i)
    @matches.each do |pair|
      @student_1_id = pair[0]
      @student_2_id = pair[1]
      @pair = Pair.create(date: date, student_1_id: @student_1_id, student_2_id: @student_2_id)
    end
          redirect_to @pair
  end

  private

  def pair_params
    params
    .require(:pair)
    .permit(:date, :student_1_id, :student_1_id)
  end
end
