class PostsController < ApplicationController
  before_action :find_id, only: [:edit, :publish, :destroy]
  skip_before_action :authenticate_user!, only: [:index]

  def index
    if user_signed_in?
      @posts = Post.all
    else
      @posts = Post.where(ispublished: true)
    end
  end

  def show
    @post = Post.friendly.find(params[:id])
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

  def edit; end

  def update
    if @post.update(post_params)
      redirect_to @post
    else
      render :edit
    end
  end

  def publish
    @post.update(ispublished: !@post.ispublished)
    redirect_to post_path(@post)
  end

  def destroy
    @post.destroy
    redirect_to root_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end

  def find_id
    return unless user_signed_in?

    @post = Post.find_by(slug: params[:id])
  end
end
