class CreateReplies < ActiveRecord::Migration
  def change
    create_table :replies do |t|
      t.integer :topic_id, null: false
      t.integer :user_id, null: false
      t.text :content, null: false

      t.timestamps
    end
  end
end