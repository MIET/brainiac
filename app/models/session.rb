class Session < ActiveRecord::Base
  self.primary_key = "n_session_id"

  belongs_to :user
end
