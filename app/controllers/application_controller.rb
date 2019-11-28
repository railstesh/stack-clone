# frozen_string_literal: true

# Application Controller class
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
end
