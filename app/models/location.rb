class Location < ApplicationRecord
  belongs_to :clinic
  belongs_to :area
  
  validates :clinic, presence: true
end
