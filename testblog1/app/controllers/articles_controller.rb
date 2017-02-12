class ArticlesController < ApplicationController

	def index
		@articles = Article.all # I think that we need to define the objects here for the veiws to work...
	end

	def show # attatched to the "read" method in crud
		@article = Article.find(params[:id])
	end

	def new # this is attatched to a post method
		@article = Article.new
	end

	def edit
		@article = Article.find(params[:id])
	end

	def create #this is to do with the database - H.C.
		@article = Article.new(article_params)
 
  		if @article.save
  			redirect_to @article
  		else
  			render 'new' #The render method is used so that the @article object is passed back to the new template when it is rendered.
  		end
	end

	def update
		@article = Article.find(params[:id])
		if @article.update(article_params) # we can get away with only updating the title, if we wanted to.
			redirect_to @article
		else 
			render 'edit'
		end
	end

	def destroy
			@article = Article.find(params[:id])
			@article.destroy
			redirect_to @article
	end


	private
	def article_params
		params.require(:article).permit(:title,:text)
	end

end
