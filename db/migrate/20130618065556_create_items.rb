class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer :no
      t.string :name
      t.decimal :price
      t.integer :category_id
      t.integer :color_id
      t.string :img
      t.text :explain

      t.timestamps
    end
  end
end
