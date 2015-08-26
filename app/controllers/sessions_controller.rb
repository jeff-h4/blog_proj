class SessionsController < ApplicationController

  def new
  end
  def create 
    # Note: there is no session object, unlike most other controllers
    @user = User.find_by_email params[:email]
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to root_path, notice: "Signed in Successfully"
    else
      flash[:alert] = "Wrong credentials!"
      render :new
    end
  end
  def destroy 
    session[:user_id] = nil
    redirect_to root_path, notice: "Signed out successfully"
  end
end
