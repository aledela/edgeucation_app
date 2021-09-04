require 'test_helper'

class CollegesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @college = colleges(:one)
  end

  test "should get index" do
    get colleges_path
    assert_redirected_to root_path
  end

  # test "should get new" do
  #   get new_college_path
  #   assert_response :success
  # end

  # test "should create college" do
  #   assert_difference('College.count') do
  #     post colleges_path, params: { college: { coll_name: @college.coll_name, cost_att: @college.cost_att, zip_code: @college.zip_code } }
  #   end

  #   assert_redirected_to college_path(College.last)
  # end

  test "should show college" do
    get college_path(@college)
    assert_response :success
  end

  # test "should get edit" do
  #   get edit_college_path(@college)
  #   assert_response :success
  # end

  # test "should update college" do
  #   patch college_path(@college), params: { college: { coll_name: @college.coll_name, cost_att: @college.cost_att, zip_code: @college.zip_code } }
  #   assert_redirected_to college_path(@college)
  # end

  # test "should destroy college" do
  #   assert_difference('College.count', -1) do
  #     delete college_path(@college)
  #   end

  #   assert_redirected_to colleges_path
  # end
end
