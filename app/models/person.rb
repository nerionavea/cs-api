class Person < ActiveRecord::Base
	validates :names, :last_names, :ci, :place_birth, :birth, :address, :sex, presence: true
	belongs_to :user
end
