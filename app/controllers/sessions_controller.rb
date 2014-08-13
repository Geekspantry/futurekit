class SessionsController < ApplicationController

	def new
	
	end

	

	def create
		user = User.find_by_email(params[:email].downcase)
  		if user && user.authenticate(params[:password]) #&& user.admin
    		sign_in user
    		# redirect_to :admin_root
    		redirect_to :root
  		else
    		# Create an error message and re-render the signin form.
    		flash[:danger] = 'Invalid email/password combination'
      		render 'new'
  		end
	end

	

	def destroy
		sign_out
		redirect_to root_url
	end

end