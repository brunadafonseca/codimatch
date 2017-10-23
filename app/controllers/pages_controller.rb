class PagesController < ApplicationController
  def home
    @user = current_user
    if @user.is_admin?
      @users = User.all
    else
      flash[:notice] = "You're not an admin"
    end
  end
end
