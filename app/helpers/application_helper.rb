module ApplicationHelper
  def days_until_event(event)
    difference = (event.date.to_date - Date.today).to_i
    if difference == 7
      'in a week!'
    elsif difference < 7 && difference > 1
      "In #{difference} days!"
    elsif difference == 1
      'Tomorrow'
    else
      event.date.strftime("%b %e, %l:%M %p")
    end
  end
end
