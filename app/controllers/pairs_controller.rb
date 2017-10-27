class PairsController < ApplicationController
  def index
    @users = User.all
    @user = User.find(current_user[:id])
    @students = @users.students
    @pairs = Pair.today
    @past_pairs = Pair.past_days
  end

  def show
    @users = User.all
    @students = @users.students
    @pair = Pair.find(params[:id])
    @pairs = Pair.last(@students.count/2)
  end

  def create
    if !GeneratedPair.exists?
      @all_pairs = Pair.generate_pairs
      @all_pairs.each do |pairs|
        GeneratedPair.create(pairs: pairs)
      end
    end
    @generated_pairs = GeneratedPair.first.delete
    date = Date.new(pair_params["date(1i)"].to_i,
                    pair_params["date(2i)"].to_i,
                    pair_params["date(3i)"].to_i)

    @generated_pairs.pairs.each do |pair|
      @student_1_id = pair[0]
      @student_2_id = pair[1]
      @pair = Pair.create(date: date, student_1_id: @student_1_id, student_2_id: @student_2_id)
    end
      redirect_to pairs_path
  end

  private

  def pair_params
    params
    .require(:pair)
    .permit(:date, :student_1_id, :student_1_id)
  end
end
