class UsersController < ApplicationController
  def sign_up
    @user = User.new   
  end

  def sign_in 
    
  end

  def register 
    @user = User.new(user_params)

    if @user.save 
      session[:current_user_id] = @user.id
      redirect_to root_path
    else
      render "sign_up"
    end
  end
  
  def login 
    @user = User.find_by(email: params[:email], password: params[:password])

    if @user 
      session[:current_user_id] = @user.id
      redirect_to root_path
    else
      @error = true
      render "sign_in"
    end
  end

  def logout 
    session[:current_user_id] = nil
    redirect_to root_path
  end

  private 

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end
end
