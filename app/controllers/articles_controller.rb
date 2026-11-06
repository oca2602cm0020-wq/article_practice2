class ArticlesController < ApplicationController
  # 新規投稿画面
  def new
    @article = Article.new
  end

  # 新規投稿
  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to articles_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  # 投稿一覧画面
  def index
    @articles = Article.all
  end

  # 投稿詳細
  def show
    @article = Article.find(params[:id])
  end

  # 投稿編集
  def edit
    @article = Article.find(params[:id])
  end

  # 投稿更新
  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to article_path
    else
      render :edit
    end
  end

  # 投稿削除
  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :content)
  end
end
