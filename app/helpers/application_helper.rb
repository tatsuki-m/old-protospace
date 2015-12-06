module ApplicationHelper
  def change_date_format(date)
    date.strftime('%b %d %a')
  end

  def setting_position(user)
    postion = if user.position.present?
      user.position
    else
      "- No Data - "
    end
  end
end
