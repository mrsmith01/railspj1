class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end
  
  def create
    @post = Post.create(post_params)
    if @post.save
      flash[:success] = "You created a new post!"
      redirect_to @post
    else
      flash[:danger] = " There was an error!"
      render :new
    end
  end  

  def edit
    @post = Post.find(params[:id])
  end
  
  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:success] = "Post Updated"
      redirect_to @post
    else
      flash[:danger] = "There was an error updating the post"
      render :edit
    end
  end

  def show
    @post = Post.find(params[:id])
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    
    redirect_to root_path
  end

private
  
  def post_params
    params.require(:post).permit(:title, :body)
  end
end
