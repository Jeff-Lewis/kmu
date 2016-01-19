require 'test_helper'

class ProjectsControllerTest < ActionController::TestCase
  setup do
    @project = projects(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:projects)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create project" do
    assert_difference('Project.count') do
      post :create, project: { adress1: @project.adress1, adress2: @project.adress2, adress3: @project.adress3, costinfo1: @project.costinfo1, costinfo2: @project.costinfo2, description: @project.description, name: @project.name, phone1: @project.phone1, phone2: @project.phone2, responsibility: @project.responsibility }
    end

    assert_redirected_to project_path(assigns(:project))
  end

  test "should show project" do
    get :show, id: @project
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @project
    assert_response :success
  end

  test "should update project" do
    patch :update, id: @project, project: { adress1: @project.adress1, adress2: @project.adress2, adress3: @project.adress3, costinfo1: @project.costinfo1, costinfo2: @project.costinfo2, description: @project.description, name: @project.name, phone1: @project.phone1, phone2: @project.phone2, responsibility: @project.responsibility }
    assert_redirected_to project_path(assigns(:project))
  end

  test "should destroy project" do
    assert_difference('Project.count', -1) do
      delete :destroy, id: @project
    end

    assert_redirected_to projects_path
  end
end
