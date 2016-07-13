require 'rails_helper'

RSpec.describe Representant, type: :model do
	before :each do 
		@people = create(:people)
	end
  it 'is not vaild without person' do 
  	representant = build(:representant, people: nil)
  	expect(representant.valid?).to be false
  end

  it 'is not vaild without occupation' do 
  	representant = build(:representant, occupation: nil)
  	expect(representant.valid?).to be false
  end

  it 'is not vaild without bussines' do 
  	representant = build(:representant, bussines: nil)
  	expect(representant.valid?).to be false
  end

end
