class AccountController < ApplicationController
  before_filter :authenticate, :set_github

  def show
    @account = get_public_information
    binding.pry
  end

  private 
  def set_github
    @user = Octokit::Client.new(access_token: session[:session_token]).user
  end

  def get_public_information
    account = { user: user_information, avatar: @user.avatar_url, profile_link: @user.html_url }
  end

  def user_information
    unwanted = [ 'id', 'type', 'site_admin', 'updated_at' ]
    res = @user.map { | key, value | [ key, value ] unless key.to_s.include? 'url' or key.to_s.in? unwanted }

    res.compact.to_h
  end
end
