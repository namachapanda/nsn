class CreateInformation < ActiveRecord::Migration
  def change
    create_table :information do |t|
      t.string :info
      t.date :renew

      t.timestamps
    end
  end
end
