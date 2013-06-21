class CreateManageItems < ActiveRecord::Migration
  def change
    create_table :manage_items do |t|
      t.integer :no

      t.timestamps
    end
  end
end
