class UsersController < ApplicationController
  before_action :authenticate_user!

  layout "admin"

  # GET /users/me
  def me
    @user = current_user
    authorize @user, :show?

    render :show, layout: "admin"
  end

  # GET /users/:id
  def show
    @user = User.find(params[:id])
    authorize @user
  end
end
