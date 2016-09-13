class SessionsController < ApplicationController

  def create
    user = User.find_by_credentials(params[:username], params[:password])
    redirect_to checklists_path if user
    flash.now[:errors] = 'Incorrect username/password combination'
  end

  def new
  end

  def destroy
    sign_out
    redirect_to new_session_url
  end
end
