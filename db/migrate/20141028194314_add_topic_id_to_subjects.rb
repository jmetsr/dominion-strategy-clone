class AddTopicIdToSubjects < ActiveRecord::Migration
  def change
    add_column :subjects, :topic_id, :integer
  end
end
