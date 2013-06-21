class DropTableManage < ActiveRecord::Migration
  def up
    drop_table :manage_items 
  end

  def down
  end
end
