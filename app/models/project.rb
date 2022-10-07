class Project < ActiveRecord::Base
  belongs_to :portfolio
  has_many :photos
  has_many :links
end