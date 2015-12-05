class PrototypesController < ApplicationController
  def index
  end

  def new
    @prototype = Prototype.new
    @prototype.captured_images.build
  end

  def create
    prototype =Prototype.new(prototype_params)
    if prototype.save
      redirect_to :root, notice: 'THe new prototype was successfully created'
    else
      redirect_to new_prototype_path, error: 'The new prototype was unsuccessfully created'
    end
  end

  private
  def prototype_params
    params.require(:prototype).permit(
      :title,
      :catch_copy,
      :concept,
      :user_id,
      captured_images_attributes: [:content, :status]
    )
  end

end
