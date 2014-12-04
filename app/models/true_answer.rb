class TrueAnswer < ActiveRecord::Base
  self.primary_key = 'n_true_answer_id'

  has_one :question
end
