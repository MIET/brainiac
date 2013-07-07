class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :scores
      t.string :parameters
      t.string :errors
      t.string :prices
      t.string :true_answers
      t.string :stats
      t.string :steps

      t.timestamps
    end
  end
end
