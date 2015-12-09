class Prototypes::PopularController < ApplicationController
  def index
    @prototypes = Prototype.all
    render template: "prototypes/index"
  end
end
