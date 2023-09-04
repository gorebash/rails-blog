class ArticlesController < ApplicationController
    def index
        @articles = Article.all
    end

    def show
        @article = Article.find(params[:id])
    end

    def new
        @article = Article.new
    end

    def create
        @article = Article.new(params.require(:article).permit(:title, :description, :author))
        if @article.save
            flash[:notice] = "Article created successfully."
            redirect_to @article
        else 
            render :new, status: :unprocessable_entity
        end
    end

    def edit
        @article = Article.find(params[:id])
    end

    def update
        @article = Article.find(params[:id])
        if @article.update(params.require(:article).permit(:title, :description, :author))
            flash[:notice] = "Article was updated successfully."
            redirect_to @article
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        #byebug
        @article = Article.find(params[:id])
        @article.destroy

        redirect_to(articles_path)
    end

end