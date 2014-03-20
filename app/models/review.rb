class Review < ActiveRecord::Base
  belongs_to :business

  has_many :comments
end
