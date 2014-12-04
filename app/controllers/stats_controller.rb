class StatsController < ApplicationController
  def index
    @answers = Answer.in_stats(cookies.signed[:user_id])
  end
end
