require 'rails_helper'

RSpec.describe RepresentantsController, type: :controller do

	# describe 'index #GET' do 
	# 	before :each do 
	# 		create_environment
	# 		login_with @user
	# 		get :index, school_id: @school.id
	# 	end
	# 	it 'should renders all representants' do 
	# 		response = parse_json_response 
	# 		expect(response[0][:id]).to eq @representant.id
	# 	end
	# end

	# describe 'CREATE #POST' do 
	# 	describe "When creates" do 
	# 		before :each do 
	# 			create_environment
	# 			login_with @user
	# 			@people2 = build(:people, school: @school)
	# 			@representant_attr = attributes_for(:representant)
	# 			post :create, {school_id: @school.id, representant: @representant_attr}
	# 		end

	# 		it 'render a representant json ' do
	# 			response = parse_json_response 
	# 			expect(response).to eq 0 
	# 		end

	# 	end
	# end

end
