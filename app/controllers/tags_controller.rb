class TagsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_tag, only: [ :destroy ]

  def index
    @tags = current_user.tags.ordered
    render json: @tags
  end

  def create
    @tag = current_user.tags.build(tag_params)

    if @tag.save
      render json: @tag
    else
      render json: @tag.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @tag.destroy
    head :no_content
  end

  private

  def set_tag
    @tag = current_user.tags.find(params[:id])
  end

  def tag_params
    params.require(:tag).permit(:name, :color)
  end
end
