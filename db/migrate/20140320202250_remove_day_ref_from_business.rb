class RemoveDayRefFromBusiness < ActiveRecord::Migration
  def change
  	remove_reference :businesses, :day
  end
end
