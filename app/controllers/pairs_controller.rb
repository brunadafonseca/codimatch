class PairsController < ApplicationController
  def index
    @users = User.all
    @user = User.find(current_user[:id])
    @randomshit = ['a', 'b', 'c', 'd']
  end
end
