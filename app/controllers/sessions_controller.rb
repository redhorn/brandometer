class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      sign_in user
      redirect_back_or root_path
    else
      flash[:error] = I18n.t('controllers.sessions.create.flash.invalid')
      redirect_to signin_path
    end
  end

  def destroy
    sign_out
    redirect_to root_path
  end

end
