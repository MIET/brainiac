class MainController < ApplicationController
  #require 'vk-ruby'
  include MainHelper

  before_filter :check_user

  def index
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