class StatsController < ApplicationController
  def index
    @answers = Answer.in_stats(cookies.signed[:n_user_id])
  end
end
