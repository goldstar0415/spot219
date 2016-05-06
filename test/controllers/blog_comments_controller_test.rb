require 'test_helper'

class BlogCommentsControllerTest < ActionController::TestCase
  setup do
    @blog_comment = blog_comments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:blog_comments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create blog_comment" do
    assert_difference('BlogComment.count') do
      post :create, blog_comment: { description: @blog_comment.description, title: @blog_comment.title }
    end

    assert_redirected_to blog_comment_path(assigns(:blog_comment))
  end

  test "should show blog_comment" do
    get :show, id: @blog_comment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @blog_comment
    assert_response :success
  end

  test "should update blog_comment" do
    patch :update, id: @blog_comment, blog_comment: { description: @blog_comment.description, title: @blog_comment.title }
    assert_redirected_to blog_comment_path(assigns(:blog_comment))
  end

  test "should destroy blog_comment" do
    assert_difference('BlogComment.count', -1) do
      delete :destroy, id: @blog_comment
    end

    assert_redirected_to blog_comments_path
  end
end
