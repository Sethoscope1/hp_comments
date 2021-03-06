class ArticlesController < ApplicationController
  before_filter :require_current_user!, except: [:show, :index]
  
  def index
    @articles = Article.includes(:comments).all
    respond_to do |format|
      format.html { render json: @articles}
      format.json { render json: @articles}
    end
  end
  
  def show
    @article = Article.find(params[:id])
    @comment = Comment.new
    
    render json: @article
  end
  
  def new
    @article = Article.new
    @comment = Comment.new
  end
  
  def create
    @article = Article.new(params[:article])
    if @article.save
      redirect_to article_url(@article)
      
      flash.notice = "Article '#{@article.title}' created!"
    else
      render json: "Couldn't Save Article"
    end
  end
  
  def update
    @article = Article.find(params[:id])
    @article.update_attributes(params[:article])
    
    flash.notice = "Article '#{@article.title}' updated!"
    
    redirect_to article_url(@article)
  end
  
  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    
    flash.notice = "Article '#{@article.title}' deleted!"
    
    redirect_to articles_url
  end
  
  def edit
    @article = Article.find(params[:id])
  end
end
