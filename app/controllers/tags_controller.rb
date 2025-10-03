class TagsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_client, only: [ :create, :destroy ]
  before_action :set_tag, only: [ :destroy ]

  def index
    @tags = current_user.tags.ordered
    render json: @tags
  end

  def create
    # Handle both standalone tag creation and client tag assignment
    if params[:client_id].present?
      # Adding existing tag to client
      @tag = current_user.tags.find(params[:tag_id])
      @client.tags << @tag unless @client.tags.include?(@tag)

      render json: { success: true, tag: @tag }
    else
      # Creating new tag
      @tag = current_user.tags.build(tag_params)

      if @tag.save
        render json: { success: true, tag: @tag }
      else
        render json: { success: false, errors: @tag.errors }
      end
    end
  end

  def destroy
    # Remove tag from client
    @client.tags.delete(@tag)
    render json: { success: true, tag: @tag }
  end

  private

  def set_client
    @client = current_user.clients.find(params[:client_id]) if params[:client_id].present?
  end

  def set_tag
    @tag = current_user.tags.find(params[:id])
  end

  def tag_params
    params.require(:tag).permit(:name, :color)
  end
end
