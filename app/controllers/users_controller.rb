class UsersController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource :except => [:me]
  layout 'admin/application'

  def me
    @user = current_user
    render :show
  end

  def show
  end

end
