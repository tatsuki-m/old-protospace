class Prototype < ActiveRecord::Base
  belongs_to :user
  has_many :captured_images, dependent: :delete_all

  accepts_nested_attributes_for :captured_images
end
