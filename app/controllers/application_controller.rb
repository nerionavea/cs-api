class ApplicationController < ActionController::Base

	after_filter :set_csrf_cookie_for_ng

	def set_csrf_cookie_for_ng
	  cookies['XSRF-TOKEN'] = form_authenticity_token
	end

	protected

	  # In Rails 4.2 and above
	  def verified_request?
	    super || valid_authenticity_token?(session, request.headers['X-XSRF-TOKEN'])
	  end
 
end
