require 'test_helper'

class ArtistTest < ActiveSupport::TestCase
  test "the truth" do
    assert true
  end

  test "An Artist must have a name" do
    red_hot_chilli_peppers = Artist.new

    assert_not red_hot_chilli_peppers.valid? "An Artist without a name is invalid."
    red_hot_chilli_peppers.name = "Kanye"
    assert red_hot_chilli_peppers.valid?  "Somehow Kanye is not a valid name."
  end

  test "An Artist has the right number of albums" do
    assert_equal artists(:bonjovi).albums.length, 2
    assert_equal artists(:redhotchillipeppers).albums.length, 1
    assert_equal artists(:beyonce).albums.length, 0

    pattismith = Artist.create(name: "Patti Smith")
    assert_equal pattismith.albums.length, 0
    horses = pattismith.albums.create(name: "Horses")
    assert_equal pattismith.albums.length, 1
    wave = pattismith.albums.create(name: "Wave")
    assert_equal pattismith.albums.length, 2
    wave = pattismith.albums.create(name: "Banga")
    assert_equal pattismith.albums.length, 3
  end

  test "An Artist has the correct albums" do
    assert_includes artists(:bonjovi).albums, albums(:bounce)
    assert_includes artists(:bonjovi).albums, albums(:slippery_when_wet)
  end

end
