class NewsController < ApplicationController
    def new
        @news = News.new
    end

    def create
        @news = News.new(news_params)
        @news.save
        redirect_to news_show(@news)
    end

    private
        def news_params
            params.require(:news).permit(:title, :description)
        end
end