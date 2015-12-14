class Prototypes::TagsController < ApplicationController
  def index
    total = ActsAsTaggableOn::Tag.all.count
    @tags = ActsAsTaggableOn::Tag.most_used(total)
  end

  def show
    @tag = ActsAsTaggableOn::Tag.find_by(name: params[:tag_name])
    @prototypes = Prototype.tagged_with(params[:tag_name])
  end
end
