class SessionsController < ApplicationController

  def create
    user = User.find_by_credentials(session_params[:username], session_params[:password])
    if user
      sign_in(user)
      redirect_to checklists_path
    else
      flash.now[:errors] = 'Incorrect username/password combination'
      render :new
    end
  end

  def new
  end

  def destroy
    sign_out
    redirect_to new_sessions_url
  end

  def session_params
    params.require(:session).permit(:username, :password)
  end
end
