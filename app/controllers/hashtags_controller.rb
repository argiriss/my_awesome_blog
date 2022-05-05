class HashtagsController < ApplicationController
  before_action :set_hashtag, only: %i[ show destroy ]

  def index
    @hashtags = Hashtag.all.includes(:taggings)
  end

  def new
    @hashtag = Hashtag.new
  end

  def create
    @hashtag = Hashtag.new(hashtag_params)

    respond_to do |format|
      if @hashtag.save
        format.html { redirect_to hashtag_url(@hashtag), notice: "Hashtag was successfully created." }
        format.json { render :show, status: :created, location: @hashtag }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @hashtag.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @hashtag.destroy

    respond_to do |format|
      format.html { redirect_to hashtags_url, notice: "Hashtag was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hashtag
      @hashtag = Hashtag.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def hashtag_params
      params.require(:hashtag).permit(:title, :post_id)
    end
end
