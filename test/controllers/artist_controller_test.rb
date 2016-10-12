require 'test_helper'

class ArtistControllerTest < ActionController::TestCase
  test "should get index for artists" do
    get :index
    assert_response :success
    assert_template :index
  end

  test "should get show page for an artist" do
    get :show, {id: artists(:bonjovi).id }
    assert_response :success
    assert_template :show
  end

  test "should get new page for an artist" do
    get :new
    assert_response :success
  end

  test "should get edit page for an artist" do
    get :edit, {id: artists(:bonjovi).id}
    assert_response :success
  end

  test "should be able to create an artist" do
    post :create, { artist: { name: "Taylor Swift" }}
    assert_response :redirect

    post :create, { artist: { name: nil }}
    assert_template :new
  end

  test "Creating an artist changes the number of artists" do
    assert_difference('Artist.count', 1) do
      post :create, { artist: { name: "Cat Stevens" }}
    end
  end

  test "should be able to update an artist" do
    patch :update, {id: artists(:bonjovi).id}
    assert_response :success
  end

  test "should be able to delete an artist" do
    delete :destroy, {id: artists(:bonjovi).id}
    assert_response :redirect

    delete :destroy, {id: -1 }
    assert_template :destroy
  end

  test "Deleting an artist changes the number of artists" do
    assert_difference('Artist.count', -1) do
      delete :destroy, { id: artists(:bonjovi).id}
    end
  end

end
