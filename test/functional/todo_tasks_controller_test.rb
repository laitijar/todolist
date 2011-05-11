require 'test_helper'

class TodoTasksControllerTest < ActionController::TestCase
  setup do
    @todo_task = todo_tasks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:todo_tasks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create todo_task" do
    assert_difference('TodoTask.count') do
      post :create, :todo_task => @todo_task.attributes
    end

    assert_redirected_to todo_task_path(assigns(:todo_task))
  end

  test "should show todo_task" do
    get :show, :id => @todo_task.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @todo_task.to_param
    assert_response :success
  end

  test "should update todo_task" do
    put :update, :id => @todo_task.to_param, :todo_task => @todo_task.attributes
    assert_redirected_to todo_task_path(assigns(:todo_task))
  end

  test "should destroy todo_task" do
    assert_difference('TodoTask.count', -1) do
      delete :destroy, :id => @todo_task.to_param
    end

    assert_redirected_to todo_tasks_path
  end
end
