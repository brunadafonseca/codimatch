class PairsController < ApplicationController
  def index
    @users = User.all
    @user = User.find(current_user[:id])
    @pairs = Pair.generate_pairs
  end

  def create
    @pair = Pair.create(date, matches)
    matches.each |pair|
    pair = Pair.new
    pair.day = Date.new
    pair.student1_id = pair[0]
    pair.student2_id = pair[1]

    if @pair.save
      redirect_to pairs_path
    else
      render 'new'
    end
  end

  private

  def pair_params
    params
    .require(:pair)
    .permit(:date, :student_1_id, :student_1_id)
  end
end
