class Prototypes::TagsController < ApplicationController
  def index
    total_number = ActsAsTaggableOn::Tag.all.count
    @tags = ActsAsTaggableOn::Tag.most_used(total_number)
  end

  def show
    @tag = ActsAsTaggableOn::Tag.find_by(name: params[:tag_name])
    @prototypes = Prototype.tagged_with(params[:tag_name])
  end
end
