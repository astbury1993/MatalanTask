require 'test_helper'

class UseremailsControllerTest < ActionController::TestCase
  setup do
    @useremail = useremails(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:useremails)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create useremail" do
    assert_difference('Useremail.count') do
      post :create, useremail: { email: @useremail.email, login: @useremail.login, name: @useremail.name }
    end

    assert_redirected_to useremail_path(assigns(:useremail))
  end

  test "should show useremail" do
    get :show, id: @useremail
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @useremail
    assert_response :success
  end

  test "should update useremail" do
    patch :update, id: @useremail, useremail: { email: @useremail.email, login: @useremail.login, name: @useremail.name }
    assert_redirected_to useremail_path(assigns(:useremail))
  end

  test "should destroy useremail" do
    assert_difference('Useremail.count', -1) do
      delete :destroy, id: @useremail
    end

    assert_redirected_to useremails_path
  end
end
