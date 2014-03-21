class CreateHolidays < ActiveRecord::Migration
  def change
    create_table :holidays do |t|
      t.date :startDate
      t.date :endDate
      t.integer :day
      t.time :open
      t.time :close
      t.boolean :closed
      t.references :business, index: true

      t.timestamps
    end
  end
end
