class RenameSubjectId < ActiveRecord::Migration
  def change
    rename_column :replies, :subject_id, :topic_id
  end
end
