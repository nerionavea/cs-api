class School < ActiveRecord::Base
	validates :description, :address, :phone, presence: true


	belongs_to :user

	has_many :people
	has_many :periods
end
