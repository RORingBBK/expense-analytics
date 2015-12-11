require 'test_helper'

class MembersIndexTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  def setup
  	@member = members(:bibek)
  	@non_admin = members(:kedar)
  end

  # test "index including pagination" do 
  # 	log_in_as(@member)
  # 	get members_path
  # 	assert_select 'div.pagination'
  # 	Member.paginate(page: 1).each do |member|
  # 		assert_select 'a', member.member_name
  # 	end
  # end

  test "index as admin including pagination and delete links" do 
  	log_in_as(@admin)
  	get members_path
  	assert_select 'div.pagination'
  	first_page_of_members = Member.paginate(page: 1)
  	first_page_of_members.each do |member|
  		assert_select 'a', member.member_name
  	end
  	assert_select 'a', text: 'delete'
  	member = first_page_of_members.first 
  	assert_difference 'Member.count', -1 do 
  		delete member_path(member)
  	end
  end

  test "index as non-admin" do
  	log_in_as(@non_admin)
  	get members_path
  	assert_select 'a', text: 'delete', count: 0
  end 
end
