class SessionsController < ApplicationController
  def new; end

  def create
    @user = User.find_by email: params[:session][:email].downcase
    if @user&.authenticate params[:session][:password]
      if @user.activated?
        log_in @user
        remember_checker
        redirect_back_or @user
      else
        not_activated_message
      end
    else
      flash.now[:danger] = t ".invalid"
      render :new
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end

  private
  def remember_checker
    params[:session][:remember_me] == "1" ? remember(@user) : forget(@user)
  end

  def not_activated_message
    message  = t ".not_activated"
    message += t ".check_email"
    flash[:warning] = message
    redirect_to root_url
  end
end
