class Business < ActiveRecord::Base
  belongs_to :owner

  has_many :days
  has_many :votes
  has_many :reviews
  has_one :location
end
