require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
<<<<<<< HEAD

  def setup
    @base_title = "Expense Analytics"
  end

  test "should get home" do
    get :home
    assert_response :success
    assert_select "title", "Home | #{@base_title}"
=======
  test "should get home" do
    get :home
    assert_response :success
    assert_select "title", "Home | Expense Analytics"
>>>>>>> temp
  end

  test "should get help" do
    get :help
    assert_response :success
<<<<<<< HEAD
    assert_select "title", "Help | #{@base_title}"
=======
    assert_select "title", "Help | Expense Analytics"
>>>>>>> temp
  end

  test "should get about" do
    get :about
    assert_response :success
<<<<<<< HEAD
    assert_select "title", "About | #{@base_title}"
  end

  test "should get contact" do 
    get :contact
    assert_response :success
    assert_select "title", "Contact | #{@base_title}"
=======
    assert_select "title", "About | Expense Analytics"
>>>>>>> temp
  end

end
