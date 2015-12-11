require 'test_helper'

class MembersEditTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  def setup
  	@member = members(:bibek)
  end

  test "unsuccessful edit" do 
  	get edit_member_path(@member)
  	patch member_path(@member), member: { member_name: '',
  																			member_email: 'foo@invalid.com',
  																			password: 'foo',
  																			password_confirmation: 'bar' }
 		assert_template 'members/edit'
  end

  test "successful edit" do 
  	get edit_member_path(@member)
  	member_name = "Foo Bar"
  	member_email = "foo@bar.com"
  	patch member_path(@member), member: { member_name: member_name,
  																				member_email: member_email,
  																				password: "",
  																				password_confirmation: "" }
 		asset_not flash.empty?
 		assert_redirected_to @member
 		@member.reload
 		assert_equal @member.member_name, member_name
 		assert_equal @member.member_email, member_email
  end
end
