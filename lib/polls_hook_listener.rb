class PollsHookListener < Redmine::Hook::ViewListener
  class PollsHookListener < Redmine::Hook::ViewListener
    render_on :view_projects_show_left, partial: "polls/project_overview"
  end

  def view_projects_show_right(context = {})
    return content_tag("p", "Custom content added to the right")
  end
end
