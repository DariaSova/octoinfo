class AccountController < ApplicationController
  def show
    @account = get_public_information
  end

  private 
  def get_public_information
    account = { user: user_information, urls: user_urls, avatar: avatar_url, profile_link: profile_link }
  end

  def user_information
    unwanted = [ 'id', 'type', 'site_admin', 'updated_at' ]

    res = params[:account].map { | key, value | [ key, value ] unless key.include? 'url' or key.in? unwanted }
    res.compact.to_h
  end

  def avatar_url
    params[:account][:avatar_url]
  end

  def profile_link
    params[:account][:html_url]
  end
end
