class People < ActiveRecord::Base
	validates :names, :last_names, :ci, :place_birth, :birth, :address, :sex, presence: true
	validates :ci, uniqueness: {scope: :school_id, message: 'La cedula esta registrada'}
	has_one :representants
	belongs_to :school
end
