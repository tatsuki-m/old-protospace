class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  mount_uploader :avatar, AvatarUploader

  has_many :prototypes

  validates :name,
            :profile,
            :position,
            :occupation,
            :avatar,
            presence: true,
            on: :create
end
