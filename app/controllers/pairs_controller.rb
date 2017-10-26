class PairsController < ApplicationController
  def index
    @users = User.all
    @user = User.find(current_user[:id])
    @pairs = Pair.generate_pairs
  end
end
