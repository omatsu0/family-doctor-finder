class Location < ApplicationRecord
  belongs_to :clinic
  
  validates :clinic, presence: true
end
