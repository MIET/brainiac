class CreateTrueAnswers < ActiveRecord::Migration
  def change
    create_table :true_answers do |t|
      t.string :stats
      t.string :steps

      t.timestamps
    end
  end
end
