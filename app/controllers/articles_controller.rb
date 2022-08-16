class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
# listar, mostrar, crear, actualizar y eliminar un artículo como lo hicimos en el task manager.
  def index
    @articles = Article.all
  end

  def show
    # @task = Task.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.save
    redirect_to articles_path
  end

  def edit
    # @task = Task.find(params[:id])
  end

  def update
    # @task = Task.find(params[:id])
    @article.update(article_params)
    redirect_to article_path(@article)
  end

  def destroy
    @article.destroy
    redirect_to articles_path, status: :see_other
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:task).permit(:title, :content)
  end
end
