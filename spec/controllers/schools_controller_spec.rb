require 'rails_helper'

RSpec.describe SchoolsController, type: :controller do
	describe 'when is logged in' do 
		describe "index" do
			it 'returns current user school' do
				create_environment
				login_with @user
				get :index
				response = parse_json_response
				expect(response[:id]).to eq @school.id
			end
		end
	end
end
