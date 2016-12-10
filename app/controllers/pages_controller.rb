class PagesController < ApplicationController
  before_filter :authenticate, except: [:home]

  def home
    render template: 'home'
  end

  def user_account
    render html: "Hey! this is yor account!"
  end
end
