class PostsController < ApplicationController
  
  
  def index
    @posts = Post.all
  end
  
  before_action :find_id, only: [:edit, :update, :show, :destory, :unpublish, :publish]

  def show
    #@post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to @post
    else
      render :new
    end
  end

  def edit
    #@post = Post.find(params[:id])
  end

  def update
    #@post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to @post
    else
      render :edit
    end
  end

  def publish
    #@post = Post.find(params[:id])
    @post.update(ispublished: true)
    redirect_to root_path
  end

  def unpublish
    #@post = Post.find(params[:id])
    @post.update(ispublished: false)
    redirect_to root_path
  end

  def destroy
    #@post = Post.find(params[:id])
    @post.destroy

    redirect_to root_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end

  def find_id
    @post = Post.find(params[:id])
  end
end
