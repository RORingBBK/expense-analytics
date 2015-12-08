require 'test_helper'

class MembersSignupTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  test "invalid signup information" do 
  	get signup_path
  	assert_no_difference 'Member.count' do 
  		post members_path, member: { member_name: "",
  															member_email: "user@invalid",
  															password: "foo",
  															password_confirmation: "bar" }
  	end
  	assert_template 'members/new'
  end

 end
