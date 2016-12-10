class PagesController < ApplicationController

  def home
    render html: "Hello, World! Welcome!"
  end
end
