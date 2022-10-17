class Portfolio < ActiveRecord::Base
  has_many :projects, -> { order(date_made: :desc, name: :asc) }
end