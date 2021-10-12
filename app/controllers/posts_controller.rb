class PostsController < ApplicationController
  before_action :find_id, except: [:index, :create]
  def find_id
    @post = Post.friendly.find(params[:id])
  end

  def index
    @posts = Post.all
  end

  def show; end

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

  def edit; end

  def update
    if @post.update(post_params)
      redirect_to @post
    else
      render :edit
    end
  end

  def publish
    @post.update(ispublished: true)
    redirect_to root_path
  end

  def unpublish
    @post.update(ispublished: false)
    redirect_to root_path
  end

  def destroy
    @post.destroy
    redirect_to root_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
