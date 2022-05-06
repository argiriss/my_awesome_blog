class HashtagsController < ApplicationController
  before_action :set_hashtag, only: %i[ destroy ]

  def index
    @hashtags = Hashtag.all.includes(:taggings)
  end

  def new
    @hashtag = Hashtag.new
  end

  def create
    @hashtag = Hashtag.new(hashtag_params)

    @hashtag.save
  end

  def destroy
    @hashtag.destroy
  end

  private
    def set_hashtag
      @hashtag = Hashtag.find(params[:id])
    end

    def hashtag_params
      params.require(:hashtag).permit(:title, :post_id)
    end
end
