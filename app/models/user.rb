class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  mount_uploader :avatar, ImageUploader

  has_many :prototypes
  has_many :comments

  validates :name,
            presence: true,
            on: :create
end
