class PagesController < ApplicationController
  before_action :authenticate_user!

  def home
    @user = User.find(current_user[:id])
    if @user.is_admin?
      redirect_to users_path
    else
      redirect_to user_path(:id)
    end
  end
end
