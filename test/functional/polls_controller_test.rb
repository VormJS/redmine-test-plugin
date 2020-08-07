require File.expand_path('../../test_helper', __FILE__)

class PollsControllerTest < ActionController::TestCase
  fixtures :projects, :users, :roles

  def test_index_forbidden_if_not_authed
    get :index, params: {
      project_id: 1
    }

    assert_response :forbidden
  end

  def test_index_works_if_authed
    @request.session[:user_id] = 2
    Role.find(1).add_permission! :view_polls

    get :index, params: {
      project_id: 1
    }

    assert_response :success
    css_select "vote.yes"
  end
end
