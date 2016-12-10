class PagesController < ApplicationController

  def home
    render template: 'home'
  end

  def user_account
    render html: "Hey! this is yor account!"
  end
end
