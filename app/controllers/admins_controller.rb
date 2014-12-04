class AdminsController < ApplicationController
  include AdminHelper
  before_filter :require_auth
  skip_before_filter  :verify_authenticity_token
  def index; end
end
