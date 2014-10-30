class RenameSubjects < ActiveRecord::Migration
  def change
    rename_table('subjects', 'topics')
  end
end
