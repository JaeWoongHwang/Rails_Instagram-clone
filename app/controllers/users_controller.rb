class UsersController < ApplicationController

  def signup
  
  end

  def register
    User.create(
      email: params[:email],
      password: params[:password]
    )
    flash[:notice] = "Sign-up Success"
    redirect_to '/'
  end

  def login
  end

  def logout
    session.clear
    flash[:notice] = "Log-out Success"
    redirect_to '/'
  end

  def login_session
    user = User.find_by(email: params[:email])
    if user
      if user.password == params[:password]
        session[:user_id] = user.id
        flash[:notice] = "Log-in Success"
        redirect_to '/'
      elsif
        flash[:alert] = "Password is not correct"
        redirect_to '/users/login'
      end
    else
      flash[:alert] = "Your E-mail is not exist"
      redirect_to '/users/signup'
    end
  end

end
