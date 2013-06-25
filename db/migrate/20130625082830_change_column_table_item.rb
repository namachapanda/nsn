class ChangeColumnTableItem < ActiveRecord::Migration
  def up
  	rename_column :items , :explain , :explanation
  end

  def down
  end
end
