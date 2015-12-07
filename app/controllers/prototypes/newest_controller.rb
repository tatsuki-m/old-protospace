class Prototypes::NewestController < ApplicationController
  def index
    @prototypes = Prototype.order("id DESC")
    render template: "prototypes/index"
  end
end
