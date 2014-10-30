class RenameTopicId < ActiveRecord::Migration
  def change
    rename_column :topics, :topic_id, :board_id
  end
end
