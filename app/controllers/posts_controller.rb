class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy ]
  before_action :create_new_hashtags, only: [:create, :update]

  def index
    @posts = Post.all.includes(:user, :hashtags, :taggings)
    @posts = @posts.where(user_id: params[:user_id]) if params[:user_id].present?
    if params[:hashtag].present?
      @hashtag_id = Hashtag.find_by(title: params[:hashtag]).id
      @tagging_ids = Tagging.where(hashtag_id: @hashtag_id)
      @posts = @tagging_ids.map(&:post)
    end
  end

  def show
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def create
    @post = Post.new(post_params)
    respond_to do |format|
      if @post.save
        format.html { redirect_to post_url(@post), notice: "Post was successfully created." }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to post_url(@post), notice: "Post was successfully updated." }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url, notice: "Post was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_post
      @post = Post.find(params[:id])
    end

    def create_new_hashtags
      if params[:post][:hashtag_ids].present?
        params[:post][:hashtag_ids].each_with_index do |hashtag_id, index|
          if hashtag_id.starts_with?("existing-hashtag-")
            params[:post][:hashtag_ids][index] = hashtag_id.gsub("existing-hashtag-","")
          else
            if Hashtag.find_by(id: hashtag_id).blank?
              new_hashtag = Hashtag.create(title: hashtag_id)
              params[:post][:hashtag_ids][index] = new_hashtag.id.to_s
            end
          end
        end
      end
    end

    def post_params
      params.require(:post).permit(:title, :body, :image, :user_id, { hashtag_ids: [] }, :hashtag_ids)
    end
end
