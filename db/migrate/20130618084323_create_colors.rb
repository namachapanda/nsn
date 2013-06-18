class CreateColors < ActiveRecord::Migration
  def change
    create_table :colors do |t|
      t.integer :id
      t.string :name

      t.timestamps
    end
  end
end
