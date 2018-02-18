class RelationshipsController < ApplicationController

  # GET /relationships
  # GET /relationships.json
  def index
    @relationships = Relationship.all
  end

  def who_to_follow
    @to_follows = current_user.who_to_follow
  end

  def followers
    @followers = current_user.followers
  end

  def followings
    @followings = current_user.followings
  end

  # POST /relationships
  # POST /relationships.json
  def create
    @relationship = Relationship.new(relationship_params)

    respond_to do |format|
      # TODO: Handle relationship creation error
      if @relationship.save
        format.html {redirect_to :back}
        format.json {render :show, status: :created, location: @relationship}
      end
    end
  end

  # DELETE /relationships/1
  # DELETE /relationships/1.json
  def destroy
    # TODO: Handle relationship destroy error

  @relationship = Relationship.find_by!(relationship_params)
    @relationship.destroy

    respond_to do |format|
      format.html {redirect_to :back}
    end
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def relationship_params
    params.require(:relationship).permit(:follower_id, :user_id)
  end
end
