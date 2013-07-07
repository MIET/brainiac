class MainController < ApplicationController
  #require 'vk-ruby'
  include MainHelper

  before_filter :check_user

  def index
    params.symbolize_keys!

    if session[:session_id]
      user_session = Session.find_by_vc_session_key(session[:session_id])
      if user_session
        puts user_session[:n_user_id]
      else
        if params[:viewer_id]
          new_session = Session.new(vc_session_key: session[:session_id],n_user_id: params[:viewer_id],vc_access_token: params[:access_token], d_time_start: Time.now)
          new_session.save
        end
      end
    else
      @reload = true
    end
    render :index
  end
end