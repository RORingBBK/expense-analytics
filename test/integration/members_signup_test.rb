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

  test "valid signup information" do 
    get signup_path
    member_name = "Example User"
    member_email = "user@example.com"
    password = "password"
    assert_difference 'Member.count', 1 do 
      post_via_redirect members_path, member: { member_name: member_name,
                                                member_email: member_email,
                                                password: password,
                                                password_confirmation: password }
    end
    assert_template 'members/show'
  end

 end
