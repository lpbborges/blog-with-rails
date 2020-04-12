class ArticlesController < ApplicationController
  http_basic_authenticate_with name: "lp", password: "123456", except: [:index, :show]
  before_action :get_article, only: [ :show, :edit, :update, :destroy ]
  
  def index
    @articles = Article.all
  end

  def show
  end

  def new
    @article = Article.new
  end

  def edit
  end

  def create 
    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end

  def update
    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article.destroy
    
    redirect_to articles_path
  end

  private
    def article_params
      params.require(:article).permit(:title, :text)
    end

    def get_article
      @article = Article.find(params[:id])
    end
end
