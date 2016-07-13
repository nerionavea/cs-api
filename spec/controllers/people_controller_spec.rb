require 'rails_helper'

RSpec.describe PeopleController, type: :controller do

	describe 'GET INDEX' do 
		before :each do 
			create_environment
			login_with @user
			get :index
		end

		it 'renders all people' do 
			response = parse_json_response
			expect(response.count).to eq 1
		end
	end

	describe 'POST CREATE' do 
		describe "when creates " do 
			before :each do 
				create_environment
				login_with @user
				@people_attr = attributes_for(:people, ci: '23444619')
				post :create, people: @people_attr
			end

			it 'renders a json representation of created object' do 
				response = parse_json_response 
				expect(response[:ci]).to eq @people_attr[:ci].to_i
			end

			it{should respond_with :ok}
		end
		describe "when inputs a existent ci" do 
			before :each do 
				create_environment
				login_with @user
				@people_attr = attributes_for(:people, ci: @people.ci)
				post :create,{ people: @people_attr }
			end

			it 'renders an json error' do 
				response = parse_json_response
				expect(response[:errors][:ci][0]).to eq "La cedula esta registrada"
			end

			it {should respond_with :forbidden}
		end

		describe "when is missing an attribute " do 
			before :each do 
				create_environment
				login_with @user
				@people_attr = attributes_for(:people, ci: nil)
				post :create, {people: @people_attr}
			end

			it 'renders a json error' do 
				response = parse_json_response
				expect(response[:errors][:ci][0]).to eq "can't be blank"  
			end

			it {should respond_with :forbidden}
		end
	end

	describe "PUT/PATC UPDATE" do 
		describe "when updates" do 
			before :each do 
				create_environment
				login_with @user
				@params = {names: 'leopoldo jose'} 
				patch :update, {id: @people.id, people: @params}
			end

			it 'renders a json representation of edited object' do 
				response = parse_json_response
				expect(response[:names]).to eq @params[:names]
			end

			it {should respond_with :ok}
		end

		describe "when does not updates" do 
			before :each do 
				create_environment
				login_with @user
				patch :update, {id: @people.id, people: {names: nil}} 
			end

			it 'renders a json representation with errors ' do 
				response = parse_json_response
				expect(response[:errors][:names][0]).to eq "can't be blank"  
			end

			it {should respond_with :forbidden}
		end
	end

	describe "Get show" do 

		describe "when finds " do 
			before :each do 
				create_environment
				login_with @user
				get :show, id: @people.id
			end

			it 'shows a json representation of object' do 
				response = parse_json_response
				expect(response[:id]).to eq @people.id
			end

			it {should respond_with :ok}
		end

		describe "when is not found" do 
			before :each do 
				create_environment
				login_with @user
				get :show, id: 4
			end

			it 'shows not found error ' do
				response = parse_json_response 
				expect(response[:error]).to eq "not found"
			end

			it {should respond_with :not_found}
		end
	end
end
