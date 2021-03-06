class RepostsController < ApplicationController
  before_action :set_repost, only: [:show, :edit, :update, :destroy]

  # GET /reposts
  # GET /reposts.json
  def index
    @reposts = Repost.all
  end

  # GET /reposts/1
  # GET /reposts/1.json
  def show
  end

  # POST /reposts
  # POST /reposts.json
  def create
    @repost = Repost.new(repost_params)

    respond_to do |format|
      if @repost.save
        format.html {redirect_to :back}
      end
    end
  end

  # DELETE /reposts/1
  # DELETE /reposts/1.json
  def destroy
    @repost.destroy
    respond_to do |format|
      format.html {redirect_to :back }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_repost
    @repost = Repost.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def repost_params
    params.require(:repost).permit(:post_id, :user_id)
  end
end
