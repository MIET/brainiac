class TrueAnswer < ActiveRecord::Base
  self.primary_key = "n_true_answer_id"

  has_one    :question,
             foreign_key: 'n_question_id'
end
