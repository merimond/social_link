require 'minitest/autorun'
require 'social_link'

describe SocialLink do

  it "fails when nil is specified" do
    assert_nil SocialLink.parse(nil)
  end

end
