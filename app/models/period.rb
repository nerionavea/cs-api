class Period < ActiveRecord::Base
	validates :year, presence: true
	validates :year, numericality: {greater_than_or_equal_to: 2000, less_than_or_equal_to: 2100 }
	validates :year, uniqueness: {scope: :school_id, message: 'El año no puede repetirse'}
	belongs_to :school
end
