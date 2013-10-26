require 'rubygems'

require 'test/unit'

PathHere = File.dirname(__FILE__)
$LOAD_PATH.unshift File.join(PathHere, "..", "lib")

require 'fastimage'

LargeImageWithUnderscore = "http://criterion_images.s3.amazonaws.com/current/Repo_Man_Essay_Current.jpg"
LargeImageWithUnderscoreInfo = [:jpeg, [800, 451]]
LargeImageFetchLimit = 2  # seconds

class FastImageUnderscoresTest < Test::Unit::TestCase
  def test_should_fetch_image_with_underscore_in_hostname
    size = FastImage.size(LargeImageWithUnderscore)
    type = FastImage.type(LargeImageWithUnderscore)
    assert_equal LargeImageWithUnderscoreInfo[1], size
    assert_equal LargeImageWithUnderscoreInfo[0], type
  end
end
