class RegistrationsController < Devise::RegistrationsController
	private

		def sign_up_params
			params.require(:user).permit(:name, :email, :password, :password_confirmation, :dob, :gender, :college, :avatar)
		end

		def account_update_params
			params.require(:user).permit(:name, :email, :password, :password_confirmation, :current_password, :dob, :gender, :college, :avatar)
		end

		def after_update_path_for(resource)
      		interests_path
    	end
end