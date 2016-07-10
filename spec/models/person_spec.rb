require 'rails_helper'

RSpec.describe Person, type: :model do
	
  it 'not be valid without names' do 
  	person = build(:person, names:nil)
  	expect(person.valid?).to be false 
  end

  it 'not be valid without last_names' do 
  	person = build(:person, last_names:nil)
  	expect(person.valid?).to be false 
  end

  it 'not be valid without ci' do 
  	person = build(:person, ci:nil)
  	expect(person.valid?).to be false 
  end

  it 'not be valid without place_birth' do 
  	person = build(:person, place_birth:nil)
  	expect(person.valid?).to be false 
  end

  it 'not be valid without birth' do 
  	person = build(:person, birth:nil)
  	expect(person.valid?).to be false 
  end

  it 'not be valid without address' do 
  	person = build(:person, address:nil)
  	expect(person.valid?).to be false 
  end

  it 'not be valid without sex' do 
  	person = build(:person, sex:nil)
  	expect(person.valid?).to be false 
  end

  

end
