class UsersController < ApplicationController
  before_filter :authenticate_user, :only => [:edit]
  
  def show
    @user = User.find(params[:id]) if current_user
  end

  def edit
    @user = current_user if current_user
  end

end
