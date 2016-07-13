class Representant < ActiveRecord::Base
	validates :people, presence: true
	belongs_to :people
end
