class CreateBoards < ActiveRecord::Migration
  def change
    create_table :boards do |t|
      t.integer :admin_id, null: false
      t.string :title

      t.timestamps
    end
  end
end
