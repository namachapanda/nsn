class RemakeInformation < ActiveRecord::Migration
  def up
  	create_table :information do |t|
      t.string :info
      t.date :renew

      t.timestamps
    end
  end

  def down
  end
end
