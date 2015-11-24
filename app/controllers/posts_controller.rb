class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_post, only: [:show, :edit, :update, :destroy, :subscribe]
  before_action :check_user, only: [:edit, :update, :destroy]

  # GET /posts
  def index
    @posts = Post.published.moderated.all
  end

  def unpublished
    if current_user.admin?
      @posts = Post.unpublished.all
    else
      @posts = current_user.posts.unpublished.all
    end
  end

  def unmoderated
    if current_user.admin?
      @posts = Post.unmoderated.all
    else
      @posts = current_user.posts.unmoderated.all
    end
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

  def subscribe
    @post.subscribers << current_user
    redirect_to @post, notice: 'Вы подписались на этот пост.'
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def post_params
    params.require(:post).permit(:title, :body, :published, :moderated, category_ids: [])
  end

  def check_user
    unless current_user && (current_user.id == @post.user_id || current_user.admin?)
      redirect_to posts_url, notice: t('.deny')
    end
  end
end
