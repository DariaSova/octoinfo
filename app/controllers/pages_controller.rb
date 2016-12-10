class PagesController < ApplicationController
  before_filter :authenticate, except: [:home]

  def home
    render template: 'home'
  end
end
