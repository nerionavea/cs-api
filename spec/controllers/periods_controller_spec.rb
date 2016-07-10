require 'rails_helper'

RSpec.describe PeriodsController, type: :controller do
  describe 'GET #index' do 
    it 'shows all years' do 
      create_environment
      login_with @user
      get :index, school_id: @school.id
      response = parse_json_response
      expect(response.count).to eq 1
      expect(response[0][:year]).to eq Date.today.year
    end
  end

  describe "POST #create" do
    describe 'when creates' do 
      before :each do 
        create_environment
        login_with @user
        post :create, {school_id: @school.id, period: {year: 2017}}
      end

      it 'renders the new period' do 
        response = parse_json_response
        expect(response[:year]).to eq 2017
      end

      it {should respond_with :created}
    end

    describe 'when not creates' do 
      before :each do 
        create_environment
        login_with @user
        post :create, {school_id: @school.id, period: {year: 1999}}
      end

      it 'renders errors' do 
        response = parse_json_response
        expect(response).to have_key(:errors)  
      end

      it {should respond_with :unprocessable_entity}
    end

    describe 'must not allow create same years' do 
      before :each do 
        create_environment
        login_with @user
        post :create, {school_id: @school.id, period: {year: @period.year}}
      end

      it 'must return an error' do 
        response = parse_json_response
        expect(response).to have_key(:errors)
      end
    end
  end

  describe 'PUT #Update' do 
    describe 'when updates' do 
      before :each do 
        create_environment
        login_with @user
        patch :update, {school_id: @school.id, id: @period.id, period: {year: 2018}}
      end
      it 'render a json representation of updated period' do 
        response = parse_json_response
        expect(response[:year]).to be 2018 
      end
      it {should respond_with :accepted}
    end
    describe 'when not updates' do 
      before :each do 
        create_environment
        login_with @user 
        patch :update, {school_id: @school.id, id: @period.id, period: {year: 'ab'}}
      end

      it 'render a json with errors' do 
        response = parse_json_response
        expect(response).to have_key(:errors)  
      end

      it {should respond_with :unprocessable_entity}
    end
  end

  describe 'get #show' do 
    before :each do
      create_environment
      login_with @user
      get :show, {school_id: @school.id, id: @period.id}
    end
    it 'renders a json for the period item' do 
      response = parse_json_response
      expect(response[:year]).to eq @period.year   
    end
    it { should respond_with :ok}
  end
end
