class PrototypesController < ApplicationController
  before_action :set_prototype, only: [:show, :edit, :destroy, :update]

  def index
    @prototypes = Prototype.order("RAND()")
  end

  def new
    @prototype = Prototype.new
    @prototype.captured_images.build
  end

  def show
  end

  def edit
  end

  def destroy
    if @prototype.destroy
      redirect_to :root, notice: 'Your prototype was successfully deleted'
    else
      redirect_to prototype_path(@prototype), error: 'Your prototype was unsuccessfully deleted'
    end
  end

  def create
    prototype = Prototype.new(prototype_params)
    if prototype.save
      redirect_to :root, notice: 'The new prototype was successfully created'
    else
      redirect_to new_prototype_path, error: 'The new prototype was unsuccessfully created'
    end
  end

  def update
    if @prototype.update(prototype_params)
      redirect_to prototype_path(@prototype), notice: 'Your prototype was successfully updated'
    else
      redirect_to edit_prototype_path(@prototype), notice: 'Your prototype was unsuccessfully updated'
    end
  end

  private
  def set_prototype
    @prototype = Prototype.find(params[:id])
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
end
