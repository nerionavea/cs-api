require 'rails_helper'

RSpec.describe People, type: :model do
	
  it 'not be valid without names' do 
  	people = build(:people, names:nil)
  	expect(people.valid?).to be false 
  end

  it 'not be valid without last_names' do 
  	people = build(:people, last_names:nil)
  	expect(people.valid?).to be false 
  end

  it 'not be valid without ci' do 
  	people = build(:people, ci:nil)
  	expect(people.valid?).to be false 
  end

  it 'not be valid without place_birth' do 
  	people = build(:people, place_birth:nil)
  	expect(people.valid?).to be false 
  end

  it 'not be valid without birth' do 
  	people = build(:people, birth:nil)
  	expect(people.valid?).to be false 
  end

  it 'not be valid without address' do 
  	people = build(:people, address:nil)
  	expect(people.valid?).to be false 
  end

  it 'not be valid without sex' do 
  	people = build(:people, sex:nil)
  	expect(people.valid?).to be false 
  end

  

end
