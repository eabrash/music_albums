require 'test_helper'

class ArtistControllerTest < ActionController::TestCase
  test "should get index for artists" do
    get :index
    assert_response :success
  end

  test "should get show page for an artist" do
    get :show, {id: 1 }
    assert_response :success
  end

  test "should get new page for an artist" do
    get :new
    assert_response :success
  end

  test "should get edit page for an artist" do
    get :edit, {id: 1 }
    assert_response :success
  end

  test "should be able to create an artist" do
    post :create
    assert_response :success
  end

  test "should be able to update an artist" do
    patch :update, {id: 1 }
    assert_response :success
  end

  test "should be able to delete an artist" do
    delete :destroy, {id: 1 }
    assert_response :success
  end

end
