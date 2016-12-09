class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  protect_from_forgery with: :exception

  def home
    render html: "Hello, World! Welcome!"
  end
end
