class Prototypes::NewestController < ApplicationController
  def index
    @prototypes = Prototype.order(created_at: :desc).page(params[:page])
    render template: "prototypes/index"
  end
end
