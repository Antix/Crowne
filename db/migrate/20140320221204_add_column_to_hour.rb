class AddColumnToHour < ActiveRecord::Migration
  def change
    add_column :hours, :closed, :boolean
  end
end
