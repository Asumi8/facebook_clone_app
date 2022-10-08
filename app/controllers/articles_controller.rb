class ArticlesController < ApplicationController

  def index 
    @articles = Article.all
  end

  def new 
    @article = Article.new
  end

  def create 
    @article = current_user.articles.build(article_params)
    render :new and return if params[:back]
    if @article.save
      redirect_to articles_path, notice:"投稿しました！"
    else
      render :new
    end

  end

  def show 
    @article = Article.find(params[:id])
  end

  def edit 
    @article = Article.find(params[:id])
  end

  def update 
    @article = Article.find(params[:id])
    render :new if params[:back]
    if @article.update(article_params)
      redirect_to articles_path, notice:"投稿を編集しました！"
    else
      render :edit
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path, notice:"投稿を削除しました！"
  end

  def confirm
    @article = current_user.articles.build(article_params)
    render :new if @article.invalid?
  end

  private

  def article_params
    params.require(:article).permit(:content, :image, :image_cache) 
  end

end
