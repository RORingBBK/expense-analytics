require 'test_helper'

class MembersLoginTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  test "login with invalid information" do 
  	get login_path
  	assert_template 'sessions/new'
  	post login_path, session: { member_email: "", member_password: "" }
  	assert_template 'sessions/new'
  	assert_not flash.empty?
  	get root_path
  	assert flash.empty?
  end
end
