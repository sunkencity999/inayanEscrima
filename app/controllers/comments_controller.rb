class CommentsController < ApplicationController
  
  def show
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
  end

  def new
    @post = Post.find(params[:post_id])
  	@comment = Comment.new 
     
  end

  def create
    @post = Post.find(params[:post_id])
  	@comment = @post.comments.create!(comment_params)
    
      
  	if @comment.save
  		flash[:notice] = "Comment was saved."
  		redirect_to [@post, @comment]
  	else
  		flash[:error] = "There was an error saving the comment. Please try again."
  		render :new
  	end
  end

  def edit
  	@comment = Comment.find(params[:id])
    
  end

  def update
    @post = Post.find(params[:post_id])
  	@comment = Comment.find(params[:id])
    
  	
  	if @comment.update_attributes(comment_params)
  		flash[:notice] = "Comment was updated."
  		redirect_to [@post, @comment] 
  	else
  		flash[:error] = "There was an error saving the comment. Please try again."
  		render :edit
  	end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end


end
