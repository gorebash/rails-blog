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
      render 'new'
    end
  end
end