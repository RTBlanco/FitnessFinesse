class SessionsController < ApplicationController

  def destroy
    session.clear
    redirect_to root_path
  end

  def create
    user = User.find_by(username: params[:user][:username])
    if user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      flash[:message] = "Incorrect login info, please try again"
      redirect_to "/login"
    end
  end

  def google
    #find_or_create a user using the attributes auth
    @user = User.find_or_create_by(email: auth["info"]["email"]) do |user|
      user.name= auth["info"]["first_name"]
      user.password = SecureRandom.hex(10)
    end
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(user)
    else
      redirect_to '/'
    end
    binding.pry
  end

  private
  
  def auth
    request.env['omniauth.auth']
  end
end