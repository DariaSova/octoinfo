class PagesController < ApplicationController
  before_filter :authenticate, except: [:home]

  def home
    render template: 'home'
  end

  def user_account
    render template: 'user_account'
  end
end
