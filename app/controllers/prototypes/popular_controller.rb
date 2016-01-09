class Prototypes::PopularController < ApplicationController
  def index
    @prototypes = Prototype.order(likes_count: :desc).page(params[:page])
    render template: "prototypes/index"
  end
end
