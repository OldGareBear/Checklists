class UsersController < ApplicationController
  before_filter :require_sign_in!, except: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save!
      sign_in(@user)
      redirect_to welcome_index_path
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def show
  end

  def destroy
  end

  def edit
  end

  def update
  end

  def user_params
    params.require(:user).permit(:username, :password)
  end

end
