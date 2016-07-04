require 'rails_helper'

RSpec.describe School, type: :model do
  it 'should be invalid with no description' do 
  	school = build(:school, description: nil)
  	expect(school.valid?).to be false 
  end

  it 'should be invalid with no address' do 
  	school = build(:school, address: nil)
  	expect(school.valid?).to be false 
  end

  it 'should be invalid with no phone' do 
  	school = build(:school, phone: nil)
  	expect(school.valid?).to be false 
  end
end
