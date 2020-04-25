class CreateBoards < ActiveRecord::Migration[5.2]
  def change
    create_table :boards do |t|
      t.integer :width
      t.integer :height
      t.string :field, array: true, default: []
      t.timestamps
    end
  end
end
