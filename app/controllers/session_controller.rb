class SessionController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def create
    user = User.find_or_create_by(provider: auth_hash[:provider], uid: auth_hash[:uid], name: auth_user_name)
    session[:user_id] = user.id unless !user.save
    hash =  auth_hash["extra"]["raw_info"] }

    redirect_to controller: 'account', action: 'show', account: hash
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

  private
  def auth_hash
    request.env['omniauth.auth']
  end

  def auth_user_name
    auth_hash['info']['name']
  end
end
