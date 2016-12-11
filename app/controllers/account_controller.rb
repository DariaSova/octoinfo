class AccountController < ApplicationController
  before_filter :authenticate, :set_github

  def show
    @account = get_public_information
  end

  private 
  def set_github
    @user = Octokit::Client.new(access_token: session[:session_token]).user
  end

  def get_public_information
    account = { user: user_information, avatar: user_avatar, profile_link: account_link }
  end

  def user_information
    unwanted = [ 'id', 'type', 'site_admin', 'updated_at' ]
    res = @user.map { | key, value | [ key, value ] unless key.to_s.include? 'url' or key.to_s.in? unwanted }

    res.compact.to_h
  end

  def user_avatar
    @user.avatar_url
  end

  def account_link
    @user.html_url
  end
end
