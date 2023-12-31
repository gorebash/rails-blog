class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:notice] = 'Successfully logged in'
      redirect_to user
    else
      flash.now[:alert] = 'There was a problem with your login credentials'
      render :new, status: unprocessable_entity
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = 'You have been logged out'
    redirect_to root_path
  end
end
