class Answer < ActiveRecord::Base
  self.primary_key = "n_answer_id"

  belongs_to :user,
             foreign_key: 'n_user_id'
end
