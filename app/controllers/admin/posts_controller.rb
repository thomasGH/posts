class Admin::PostsController < Admin::BaseController
  before_action :set_post, only: [:show, :edit, :update, :destroy, :approve, :disapprove]

  def index
    @posts = Post.all
  end

  def show
    @comment = Comment.new
  end

  def edit
  end

  def update
    if @post.update(params.require(:post).permit(:title, :body, category_ids: []))
      redirect_to @post, notice: t('.success')
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    
    redirect_to posts_url, notice: t('.success')
  end

  def disapproved
    @posts = Post.published.disapproved.all
  end

  def approve
    @post.approved = true
    @post.send_moderate_notification

    if @post.save
      redirect_to disapproved_admin_posts_path, notice: t('.success')
    end
  end

  def disapprove
    @post.approved = false
    @post.published = false
    @post.send_moderate_notification

    if @post.save
      redirect_to @post, notice: t('.success')
    end
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end
end
