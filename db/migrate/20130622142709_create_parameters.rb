class CreateParameters < ActiveRecord::Migration
  def change
    create_table :parameters do |t|
      t.string :errors
      t.string :prices
      t.string :true_answers
      t.string :stats
      t.string :steps

      t.timestamps
    end
  end
end
