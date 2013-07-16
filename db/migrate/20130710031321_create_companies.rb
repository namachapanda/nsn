class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.integer :schema_code
      t.string :domain_id
      t.string :name
      t.string :code
      t.integer :status_id

      t.timestamps
    end
  end
end
