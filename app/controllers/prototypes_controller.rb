class PrototypesController < ApplicationController
  before_action :set_prototype, only: [:edit, :destroy, :update]
  before_action :set_new_comment, only: [:show, :update]

  def index
    @prototypes = Prototype.order("RAND()")
  end

  def new
    @prototype = Prototype.new
    @prototype.captured_images.build
  end

  def show
    @prototype = Prototype.eager_load(:comments, { comments: :user }).find(params[:id])
    @likes = @prototype.likes
  end

  def edit
  end

  def create
    prototype = Prototype.new(prototype_params)
    prototype.tag_list.add.tags_params.values
    if prototype.save
      redirect_to :root, notice: 'The new prototype was successfully created'
    else
      redirect_to action: :new, notice: 'The new prototype was unsuccessfully created'
    end
  end

  def destroy
    if @prototype.destroy
      redirect_to :root, notice: 'Your prototype was successfully deleted'
    else
      render action: :show, notice: 'Your prototype was unsuccessfully deleted'
    end
  end


  def update
    if @prototype.update(prototype_params)
      render action: :show, notice: 'Your prototype was successfully updated'
    else
      render action: :edit, notice: 'Your prototype was unsuccessfully updated'
    end
  end

  private
  def set_prototype
    @prototype = Prototype.find(params[:id])
  end

  def set_new_comment
    @comment = Comment.new
  end

  def prototype_params
    params.require(:prototype).permit(
      :title,
      :catch_copy,
      :concept,
      :user_id,
      captured_images_attributes: [:content, :status, :id]
    )
  end

  def tags_params
    params.require(:prototype).require(:tags)
  end
end
