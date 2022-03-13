class SessionsController < ApplicationController
  def new
  end

  def create
    entered_email = params["email"]
    entered_password = params["password"]
    @user = User.find_by({email: entered_email})
    if @user
      if BCrypt::Password.new(@user.password) == entered_password
        redirect_to "/places"
      else 
        redirect_to "/sessions/new"
      end
    else
      redirect_to "/sessions/new"
    end
  end

  def destroy
  end
end
  