class ArticlesController < ApplicationController
	
	def index
    	@articles = Article.all
  	end

	def show
    	@article = Article.find(params[:id])
    	user_id = @article.user_id
    	user = User.find(user_id)
    	name = user.name.titlecase
    	last_name = user.last_name.titlecase
    	@author = "#{name + " " + last_name}"
  	end

	def edit
    	@article = Article.find(params[:id])
  	end

	def new
		@article = Article.new
  	end

  	def create
	  @article = Article.new(article_params)
	 
	 	if @article.save
    		redirect_to @article
  		else
    		render 'new'
  		end
	end
 
	def update
	    @article = Article.find(params[:id])
	 
	    if @article.update(article_params)
	      redirect_to @article
	    else
	      render 'edit'
	    end
	end
	
 	def destroy
		@article = Article.find(params[:id])
		@article.destroy
 
  		redirect_to articles_path
	end

	private

	  def article_params
	    params.require(:article).permit(:title, :text, :image).merge(user_id: current_user.id)
	  end
end
