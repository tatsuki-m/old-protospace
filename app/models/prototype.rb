class Prototype < ActiveRecord::Base
  belongs_to :user
  has_many :captured_images, dependent: :delete_all
  has_many :comments, dependent: :delete_all
  has_many :likes, dependent: :delete_all

  accepts_nested_attributes_for :captured_images, reject_if: :reject_sub_images

  acts_as_taggable
  acts_as_ordered_taggable
  paginates_per 8

  validates :title,
            :catch_copy,
            :concept,
            presence: true,
            on: :create

  def reject_sub_images(attributed)
    attributed['content'].blank?
  end

  def set_main_thumbnail
    captured_images.main.first.content
  end

  def set_sub_thumbnail(i)
    captured_images.sub[i].present? ? captured_images.sub[i].content : ActionController::Base.helpers.asset_path('noimage.png')
  end

  def user_position
    postion = if user.position.present?
      user.position
    else
      "- No Data - "
    end
  end

  def posted_date
    created_at.strftime('%b %d %a')
  end

  def fetch_curret_user_like(user)
    likes.find_by(user_id: user)
  end

  def fetch_tag(i)
    if tag_list[i].present?
      tag_list[i]
    else
      ""
    end
  end
end
