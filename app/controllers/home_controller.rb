class HomeController < ApplicationController
  def index
  	if user_signed_in?
  		redirect_to profile_show_path
  	end
  end
end
