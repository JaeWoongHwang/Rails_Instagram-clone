class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception #이 코드를 생략하면 에러를 우회할 수 있음 그러나 좋지 않은 방법

  def current_user
    session.clear
    @user||= User.find(session[:user_id]) if User.exists? && session[:user_id]
  end

  def authorize
    unless current_user
    flash[:notice] = "You must sign-up"
    redirect_to '/users/login'
    end
  end

  helper_method(:current_user)

end
