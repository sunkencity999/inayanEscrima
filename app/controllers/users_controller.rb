class UsersController < ApplicationController
	before_action :authenticate_user!



	def edit 
		@user = User.find(params[:id])

		if @user.update_attributes(user_params)
  			flash[:notice] = "User was updated."
  			redirect_to @user
  		else
  			flash[:error] = "There was an error saving the post. Please try again."
  			render :edit
  		end
	end

	def show
		@user = User.find(params[:id])
		@posts = @user.posts
		@comments = @user.comments
	end

	def index
		@users = User.all
	end

	private

	def user_params
		params.require(:user).permit(:name, :avatar, :avatar_cache, :email_favorites, :role)
	end
end