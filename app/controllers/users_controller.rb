class UsersController < ApplicationController
  def show
    id = params[:id].presence || current_user.id
    @user = User.find(id)
  end
end
