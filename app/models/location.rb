class Location < ApplicationRecord
  validates :clinic, presence: true
end
