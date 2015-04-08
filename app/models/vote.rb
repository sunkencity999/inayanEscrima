class Vote < ActiveRecord::Base
	belongs_to :post
	belongs_to :user

	after_save :update_post

	private

	def update_post
		post.update_rank
	end
	
end
