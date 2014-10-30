class RenameTopics < ActiveRecord::Migration
  def change
    rename_table('topics', 'boards')
  end
end
