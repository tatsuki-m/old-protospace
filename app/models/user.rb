class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  mount_uploader :avatar, ImageUploader

  has_many :prototypes
  has_many :comments
  has_many :likes

  validates :name,
            presence: true,
            on: :create

  def set_profile_photo
    avatar.present? ? avatar : ActionController::Base.helpers.asset_path('noimage.png')
  end
end
