class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = current_user
    #@item = @user.items.new
    #@items = @user.items
  end
end
