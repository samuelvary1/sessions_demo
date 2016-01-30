class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(email: params[:email])

    if @user && @user.authenticate(params[:password]) 
			session[:user_id] = @user.id
			redirect_to root_path, notice: "You have successfully logged in bub!"
    else
    	@user = User.new
    	flash[:error] = "Bad Username or Password"
    	render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path
    flash[:notice] = "Logged out!"
  end
end
