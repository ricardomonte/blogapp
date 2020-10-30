class ArticlesController < ApplicationController
  before_action :find_article, only: [:show, :edit, :update, :destroy]

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
    @article = Article.new(article_param)
    if @article.save
      flash[:notice] = 'Article was saved successfully'
      redirect_to article_path(@article)
    else
      render 'new'
    end 
  end

  def update
    if @article.update(article_param)
      flash[:notice] = 'Article was updated successfully'
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_path
  end

  private

  def find_article
    @article = Article.find(params[:id])
  end

  def article_param
    params.require(:article).permit(:title, :description)
  end
end