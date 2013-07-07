class MainController < ApplicationController
  #require 'vk-ruby'
  include MainHelper

  before_filter :check_user
  skip_before_filter  :verify_authenticity_token

  def index
    cookies.signed[:test] = 1
    params.symbolize_keys!

    unless @current_user
      @reload = true
    end

    if @authorized && !@reload
      render :index
    else
      render :access_denied
    end
  end
end