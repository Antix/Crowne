class Business < ActiveRecord::Base
  belongs_to :owner
  belongs_to :day
end
