module ControllerHelpers

  def create_environment
    @user = FactoryGirl.create(:user)
    @school = FactoryGirl.create(:school, user: @user)
    @period = FactoryGirl.create(:period, year: Date.today.year, school: @school)
  end
	 def login_with(user = double('user'), scope = :user)
    current_user = "current_#{scope}".to_sym
    if user.nil?
      allow(request.env['warden']).to receive(:authenticate!).and_throw(:warden, {:scope => scope})
      allow(controller).to receive(current_user).and_return(nil)
    else
      allow(request.env['warden']).to receive(:authenticate!).and_return(user)
      allow(controller).to receive(current_user).and_return(user)
    end
  end

  def parse_json_response
    JSON.parse(response.body, symbolize_names:true)
  end
end
