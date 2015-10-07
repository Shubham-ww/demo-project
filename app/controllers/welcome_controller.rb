class WelcomeController < ApplicationController
  layout "application"
  before_action :authenticate_user!

  def index
    @user = current_user
    redirect_to categories_path
  end

  def exit
    sign_out current_user
    redirect_to root_path
  end

end
