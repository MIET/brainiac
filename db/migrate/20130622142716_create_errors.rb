class CreateErrors < ActiveRecord::Migration
  def change
    create_table :errors do |t|
      t.string :prices
      t.string :true_answers
      t.string :stats
      t.string :steps

      t.timestamps
    end
  end
end
