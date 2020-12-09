class ArticlesController < ApplicationController

  # This performs this action before we do anything for any of the methods/actions
  before_action :set_article, only: [:show, :edit, :update, :destroy, :preview]
  before_action :require_user, except: [:show, :index]
  before_action :require_same_user, only: [:edit, :update, :destroy]

  def show
  end

  def index
    # @articles = Article.all
    @articles = Article.paginate(page: params[:page], per_page: 8)
  end

  def new
    @article = Article.new
  end

  def edit
  end

  def create
    byebug
    @article = Article.new(article_params)
    # set article.user to be equal to current user (from session ID)
    @article.user = current_user
      if @article.save
        flash[:notice] = "Article was created successfully."
        redirect_to @article
      else
        render 'new'
      end
  end

  def update
    if @article.update(article_params)
      flash[:notice] = "Article was updated successfully."
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_path
  end

  def preview

  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :description, category_ids: [])
  end

  def require_same_user
    if current_user != @article.user && !current_user.admin?
      flash[:alert] = "You can only edit or delete your own articles"
      redirect_to @article
    end
  end

end