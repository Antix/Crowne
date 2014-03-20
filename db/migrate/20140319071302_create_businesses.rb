class CreateBusinesses < ActiveRecord::Migration
  def change
    create_table :businesses do |t|
      t.string :name
      t.string :category
      t.integer :price
      t.references :owner, index: true
      t.references :day, index: true

      t.timestamps
    end
  end
end
