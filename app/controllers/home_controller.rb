class HomeController < ApplicationController
  def index
    if user_signed_in?
      @posts = Post.all
    else
      redirect_to 'user_signed_in'
    end
  end

  def create
  end
 def new
   @post = Post.create(title:params[:stang],content:params[:kimbab],user:[:current_user])
   redirect_to "/home/index"
 end


  def read
    @post = Post.find(params[:post_id])
  end


  def update
    @post = Post.find(params[:post_id])
  end
  
  def edit
    post = Post.find(params[:post_id])
    post.title = params[:stang]
    post.content = params[:kimbab]
    post.save
    redirect_to "/home/index"
  end
  
  def delete
    post = Post.find(params[:post_id])
    post.destroy
    redirect_to "/home/index"
  end
   
  def comment
    comment = Comment.net
    comment.content = params[:comment_id]
    comment.post_id = params[:comment_hidden]
    comment.save
    
    redirect_to "/home/read/#{comment.post.id}"
  end
  
  def comment_delete
    comment = comment.find(params[:comment_id])
    comment.destroy
    redirect_to "/home/read/#{comment.post.id}"
  end
end
