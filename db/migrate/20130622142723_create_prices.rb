class CreatePrices < ActiveRecord::Migration
  def change
    create_table :prices do |t|
      t.string :true_answers
      t.string :stats
      t.string :steps

      t.timestamps
    end
  end
end
