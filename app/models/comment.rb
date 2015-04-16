class Comment < ActiveRecord::Base
 after_create :send_favorite_emails

  belongs_to :post
  belongs_to :user

  private

  def send_favorite_emails
  	post.favorites.each do |favorite|
  		if user_id != favorite.user_id && favorite.user.email_favorites?
  			FavoriteMailer.new_comment(favorite.user, self.post, self).deliver_now
  		end
  	end
  end

  def should_receive_update_for?(favorite)
  	user_id != favorite.user_id && favorite.user.email_favorites?
  end

end
