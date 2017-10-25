class PairsController < ApplicationController
  def index
    @users = User.all
    @user = User.find(current_user[:id])
    @pairs = Pair.pair_students
  end
end
