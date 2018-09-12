class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @items = current_user.items
  end
end
