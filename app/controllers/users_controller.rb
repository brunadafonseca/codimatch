class UsersController < ApplicationController
   before_action :authenticate_user!

  def index
    @users = User.all
    @user = User.find(current_user[:id])
  end

  def show
    @user = User.find(current_user[:id])
    @todays_pair = Pair.student(@user.id).pluck(:student_2_id)
  end

  def update
    @user = User.find(params[:id])
      @user.toggle!(:admin)
    redirect_to users_path
  end

end
