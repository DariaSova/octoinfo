class SessionController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def create
    user = User.find_or_create_by(provider: auth_hash[:provider], uid: auth_hash[:uid], name: auth_user_name) unless !auth_hash
      if user && user.save
        session[:user_id] = user.id
        session[:session_token] = session_token
        hash = user_info
        redirect_to controller: 'account', action: 'show', account: hash and return
      end

    flash[:error] = 'Ooops something went wrong..try again!'
    redirect_to root_path
  end

  def destroy
    session[:user_id] = nil
    session[:session_token] = nil
    redirect_to root_path
  end

  private
  def auth_hash
    request.env['omniauth.auth']
  end

  def session_token
    auth_hash['credentials']['token']
  end

  def user_info
    auth_hash["extra"]["raw_info"]
  end

  def auth_user_name
    auth_hash['info']['name']
  end
end
