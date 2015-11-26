class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_post, only: [:show, :edit, :update, :destroy, :publish, :unpublish]
  before_action :check_user, only: [:edit, :update, :destroy, :publish, :unpublish]

  # GET /posts
  def index
    @posts = Post.published.approved.all
  end

  def unpublished
      @posts = current_user.posts.unpublished.all
  end

  def disapproved
      @posts = current_user.posts.published.disapproved.all
  end

  # GET /posts/1
  def show
    @comment = Comment.new
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  def create
    @post = current_user.posts.new(post_params)

    if @post.save
      redirect_to @post, notice: t('.success')
    else
      render :new
    end
  end

  # PATCH/PUT /posts/1
  def update
    if @post.update(post_params)
      redirect_to @post, notice: t('.success')
    else
      render :edit
    end
  end

  # DELETE /posts/1
  def destroy
    @post.destroy
    
    redirect_to posts_url, notice: t('.success')
  end

  def publish
    @post.published = true

    if @post.save
      redirect_to @post, notice: t('.success')
    end
  end

  def unpublish
    @post.published = false

    if @post.save
      redirect_to @post, notice: t('.success')
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def post_params
    params.require(:post).permit(:title, :body, :published, :approved, category_ids: [])
  end

  def check_user
    unless current_user && (current_user.id == @post.user_id || current_user.admin?)
      redirect_to posts_url, notice: t('.deny')
    end
  end
end
