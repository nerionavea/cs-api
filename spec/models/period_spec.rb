require 'rails_helper'

RSpec.describe Period, type: :model do
  it 'not be valid without year' do 
  	period = build(:period, year:nil)
  	expect(period.valid?).to be false 
  end

  it 'not be valid if is more than 2100' do 
  	period = build(:period, year: 2101)
  	expect(period.valid?).to be false
  end

  it 'not be valid if is less than 2000' do 
  	period = build(:period, year: 1999)
  	expect(period.valid?).to be false
  end
end
