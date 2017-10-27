class UsersController < ApplicationController
   before_action :authenticate_user!

  def index
    @user = User.find(current_user[:id])
    if !@user.is_admin?
      redirect_to user_path(@user.id)
    end
    @users = User.all.order_users
    @pair = Pair.new
  end

  def show
    @user = User.find(current_user[:id])
    @pairs = Pair.student(@user.id).today
    @past_pairs = Pair.student(@user.id).past_days
  end

  def update
    @user = User.find(params[:id])
    @user.toggle!(:admin)
    redirect_to users_path
  end
end
