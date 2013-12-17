class InformationController < ApplicationController
  skip_before_filter :require_signin
	
	def about
	end

	def contact
	end
end

