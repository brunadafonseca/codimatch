class PairsController < ApplicationController
  def index
    @users = User.all
    @user = User.find(current_user[:id])
    @pairs = Pair.generate_pairs
  end

  def create
    @matches = Pair.generate_pairs
    @matches.each do |pair|
      @pair = Pair.new
      @pair.day = Date.new
      @pair.student_1_id = pair[0]
      @pair.student_2_id = pair[1]
    end
  end

  private

  def pair_params
    params
    .require(:pair)
    .permit(:date, :student_1_id, :student_1_id)
  end
end
