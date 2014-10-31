class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.integer :user_id, null: false
      t.string :title, null: false
      t.text :body, null: false
      t.integer :board_id

      t.timestamps
    end
  end
end