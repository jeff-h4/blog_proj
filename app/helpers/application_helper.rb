module ApplicationHelper
# NOTE: All helper functions (in any file) available to ALL views

  # Use this helper function to display all the dates
  def formatted_date(date)
    date.strftime("%Y-%b-%d")
  end
end
