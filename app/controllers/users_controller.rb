class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :edit]

  def show
    @prototypes = @user.prototypes
  end

  def update
    @user.update(user_params)
    redirect_to :root, notice: 'The user information was successfully updated'
  end

  def edit
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(
      :name,
      :email,
      :position,
      :profile,
      :occupation,
      :avatar
    )
  end
end
