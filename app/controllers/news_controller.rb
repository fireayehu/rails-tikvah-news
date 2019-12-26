class NewsController < ApplicationController
    def index
        @news = News.all
    end
    def new
        @news = News.new
    end
    def edit
        @news = News.find(params[:id])
    end
    
    def update
        @news = News.find(params[:id])
        if @news.update(news_params)
            flash[:notice] = "News Has Been Updated Succesfully"
            redirect_to news_path(@news)
        else
            render 'edit'
        end
    end
    def create
        @news = News.new(news_params)
        if @news.save
            flash[:notice] = "News Has Been Created Succesfully"
            redirect_to news_path(@news)
        else
            render 'new'
        end
    end

    def show 
        @news = News.find(params[:id])
    end

    def destroy
        @news = News.find(params[:id])
        @news.destroy
        flash[:notice] = "News Has Been Deleted Succesfully"
        redirect_to action: "index"
    end
    private
        def news_params
            params.require(:news).permit(:title, :description)
        end
end