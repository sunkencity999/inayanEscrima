class FavoritesController < ApplicationController
	def create
		@post = Post.find(params[:post_id])
		favorite = current_user.favorites.build(post: @post)

		if favorite.save
			flash[:notice] = "This has been added to your Favorites."
		else
			flash[:error] = " There was an error, your Favorite failed to save."
		end

		redirect_to :back
	end



	def destroy
		@post = Post.find(params[:post_id])
		favorite = Favorite.find(params[:id])

		if favorite.destroy
			flash[:notice] = "This favorite has been removed."
		else
			flash[:error] = "There was an error removing your favorite"
		end

		redirect_to :back
	end

end
