require_dependency 'polls_hook_listener'

Redmine::Plugin.register :polls do
  name 'Polls plugin'
  author 'VormJS'
  description 'This is a test plugin for Redmine'
  version '0.0.1'
  url 'url will be later'
  author_url 'https://github.com/VormJS'

  project_module :polls do
    permission :view_polls, polls: :index
    permission :vote_polls, polls: :vote
  end

  menu :project_menu, :polls, { controller: 'polls', action: 'index' }, caption: 'Polls', after: :activity, param: :project_id

  settings default: {'empty' => true}, partial: 'settings/poll_settings'

  delete_menu_item :top_menu, :my_page
  delete_menu_item :top_menu, :help
  delete_menu_item :project_menu, :overview
  delete_menu_item :project_menu, :activity
  delete_menu_item :project_menu, :news
end
