class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.integer :admin_in, null: false

      t.timestamps
    end
  end
end
