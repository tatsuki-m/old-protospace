class Prototypes::NewestController < ApplicationController
  def index
    @prototypes = Prototype.order(created_at: :desc)
    render template: "prototypes/index"
  end
end
