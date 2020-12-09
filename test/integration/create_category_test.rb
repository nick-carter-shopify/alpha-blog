require 'test_helper'

class CreateCategoryTest < ActionDispatch::IntegrationTest

  setup do
    @admin_user = User.create(username: "johndoe", email: "john@hotmail.com", password: "password", admin: true)
    sign_in_as(@admin_user)
  end

  test "get the new category form and create category" do
    get "/categories/new"
    assert_response :success
    assert_difference 'Category.count', 1 do
      post "/categories", params: { category: {name: "New category" }}
      assert_response :redirect
    end
    follow_redirect!
    assert_response :success
    assert_match "New category", response.body, "Category name not found in HTML body"
  end

  test "get category form and reject invalid submission" do
    get "/categories/new"
    assert_response :success
    assert_no_difference 'Category.count' do
      post "/categories", params: { category: {name: "" }}
    end
    assert_match "errors", response.body, "No errors found in HTML body"
    assert_select "div.alert"
    assert_select "h4.alert-heading"
  end

end
