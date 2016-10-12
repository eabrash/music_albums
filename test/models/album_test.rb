require 'test_helper'

class AlbumTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "validates artist presence" do
    album = Album.new
    album.name = "Totoro Soundtrack"
    assert_not album.valid?
    album.artist = artists(:bonjovi)
    assert album.valid?

    assert albums(:slippery_when_wet).valid?
    albums(:slippery_when_wet).artist = nil
    assert_not albums(:slippery_when_wet).valid?
  end

  test "Slippery when wet was by Bon Jovi" do
    assert_equal albums(:slippery_when_wet).artist, artists(:bonjovi)
  end

  test "validates album name presence" do
    album = Album.new
    album.artist = artists(:bonjovi)
    assert_not album.valid?
    album.name = "Totoro Soundtrack"
    assert album.valid?
    assert albums(:slippery_when_wet).valid?
  end
end
