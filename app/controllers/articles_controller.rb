class ArticlesController < ApplicationController
  def new
    @article = Article.new
  end
  
  def create
    #render plain: params[:article].inspect
    @article = Article.new(article_params)
    #@article.save
    if @article.save
      flash[:notice] = "Article was successfully created"
      redirect_to article_path(@article)
    else
      render 'new'
    end
    #redirect_to article_path(@article)
  end
  
  def show
    @article = Article.find(params[:id])
    
    
  end
  
  private
    def article_params
      params.require(:article).permit(:title, :description)
    end
    
  
end
  