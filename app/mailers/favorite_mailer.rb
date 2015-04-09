class FavoriteMailer < ApplicationMailer
	default from: "admin@inayan-escrima.org"

	def new_comment(user, post, comment)
 
     # New Headers
     headers["Message-ID"] = "<comments/#{comment.id}@inayan-escrima.org>"
     headers["In-Reply-To"] = "<post/#{post.id}@inayan-escrima.org>"
     headers["References"] = "<post/#{post.id}@inayan-escrima.org>"
 
     @user = user
     @post = post
     @comment = comment
 
     mail(to: user.email, subject: "New comment on #{post.title}")
   end
end
