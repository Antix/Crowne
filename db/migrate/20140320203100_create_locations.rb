class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :street
      t.string :city
      t.string :state
      t.string :zip
      t.references :user, index: true
      t.references :business, index: true

      t.timestamps
    end
  end
end
