class RenameAdminIn < ActiveRecord::Migration
  def change
    rename_column :boards, :admin_in, :admin_id
  end
end
