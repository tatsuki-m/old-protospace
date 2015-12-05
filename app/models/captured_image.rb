class CapturedImage < ActiveRecord::Base
  mount_uploader :content, ImageUploader

  enum status: %i(main sub)

  belongs_to :prototype

  validates :content,
            :status,
            presence: true,
            on: :create

end
