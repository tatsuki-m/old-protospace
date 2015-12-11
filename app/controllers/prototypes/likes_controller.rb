class Prototypes::LikesController < ApplicationController
  before_action :set_prototype, only: :create

  def create
    @prototype.likes.create(like_params)
  end

  def destroy
    Like.find(params[:id]).destroy
    @prototype = Prototype.eager_load(:comments, { comments: :user }).find(params[:prototype_id])
  end

  private
  def set_prototype
    @prototype = Prototype.eager_load(:comments, { comments: :user }).find(params[:prototype_id])
  end

  def like_params
    params.permit(:user_id)
  end
end
