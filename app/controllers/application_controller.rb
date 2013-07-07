class ApplicationController < ActionController::Base
  include MainHelper

  before_filter :check_user

  protect_from_forgery
end
