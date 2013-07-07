class TrueAnswer < ActiveRecord::Base
  self.primary_key = "n_true_answer_id"

  belongs_to :question,
             foreign_key: 'n_question_id'
end
