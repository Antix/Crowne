class CreateHours < ActiveRecord::Migration
  def change
    create_table :hours do |t|
      t.integer :day
      t.time :open
      t.time :close
      t.references :business, index: true

      t.timestamps
    end
  end
end
