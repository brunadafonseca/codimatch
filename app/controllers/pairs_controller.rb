class PairsController < ApplicationController
  def index
    @users = User.all
    @students = @users.students
    @pairs = Pair.today
    @past_pairs = Pair.past_days
    @all_pairs = Pair.all.order_by_date
    @user = User.find(current_user[:id])
    if !@user.is_admin?
      redirect_to user_path(@user.id)
    end
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
    @taken_days = Pair.taken_days
    @day = Date.new(pair_params["date(1i)"].to_i,
                    pair_params["date(2i)"].to_i,
                    pair_params["date(3i)"].to_i)
    if @taken_days.include?(@day)
      flash[:notice] = "You already have pairs for this day!"
    else
      @generated_pairs = GeneratedPair.first.delete
      @generated_pairs.pairs.each do |pair|
        @student_1_id = pair[0]
        @student_2_id = pair[1]
        @pair = Pair.create(date: @day, student_1_id: @student_1_id, student_2_id: @student_2_id)
      end
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
