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
    @student1 = Pair.student.find(params[:id])
  end

  def create
    @matches = Pair.generate_pairs
    @matches.each do |pair|
      @student_1_id = pair[0]
      @student_2_id = pair[1]
      @pair = Pair.create(date: Date.today, student_1_id: @student_1_id, student_2_id: @student_2_id)
    end
  end

  private

  def pair_params
    params
    .require(:pair)
    .permit(:date, :student_1_id, :student_1_id)
  end
end
