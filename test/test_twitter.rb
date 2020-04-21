require 'minitest/autorun'
require 'social_link'

describe SocialLink::Twitter do

  it "parses default format" do
    result = {
      type:   "Twitter",
      id:     "abcd",
      format: "default",
    }
    assert_equal result, SocialLink::Twitter.parse("https://twitter.com/ABCD")
  end

  it "guesses common error" do
    result = {
      type:   "Twitter",
      id:     "abcd",
      format: "default",
    }
    assert_equal result, SocialLink::Twitter.parse("https://twitter.com/@ABCD")
  end

end
