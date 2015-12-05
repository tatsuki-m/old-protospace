class Prototype < ActiveRecord::Base
  belongs_to :user
  has_many :captured_images, dependent: :delete_all

  accepts_nested_attributes_for :captured_images, reject_if: :reject_sub_images

  validates :title,
            :catch_copy,
            :concept,
            presence: true,
            on: :create

  def reject_sub_images(attributed)
    attributed['content'].blank?
  end
end
