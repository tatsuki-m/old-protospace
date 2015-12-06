module ApplicationHelper
  def change_date_format(date)
    date.strftime('%b %d %a')
  end
end
