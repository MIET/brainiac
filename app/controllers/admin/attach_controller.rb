module Admin
  class AttachController < ApplicationController
    include AdminHelper
    before_filter :require_auth
    skip_before_filter  :verify_authenticity_token
    def edit; end

    def new; end

    def show
      if exist?(params[:question_id])
        redirect_to "/admin/questions/#{params[:question_id]}/attach/edit"
      else
        redirect_to "/admin/questions/#{params[:question_id]}/attach/new"
      end
    end

    def create
      File.open("public/attachments/pic_#{params[:question_id]}.jpg", 'wb') do |f|
        f.write params[:file][:data].tempfile.read
      end

      redirect_to "/admin/questions/#{params[:question_id]}/edit"
    end

    private
    def exist?(question_id)
      File.exist?("public/attachments/pic_#{question_id}.jpg")
    end
  end
end