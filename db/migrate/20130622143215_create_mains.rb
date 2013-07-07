class CreateMains < ActiveRecord::Migration
  def change
    create_table :main do |t|

      t.timestamps
    end
  end
end
