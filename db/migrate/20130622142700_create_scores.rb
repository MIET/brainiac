class CreateScores < ActiveRecord::Migration
  def change
    create_table :scores do |t|
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
