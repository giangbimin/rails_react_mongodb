class UsersController < ApplicationController
	before_filter :authenticate_user!

	def show
	  @user = User.find(params[:id])
	end

	private
	def user_params
		params(:user).permit(:email, :name)
	end
end
