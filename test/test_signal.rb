require 'minitest/autorun'
require 'social_link'

describe SocialLink::Signal do

  describe "company slug format" do

    it "parses default URLs" do
      result = {
        type:   "Signal",
        id:     "abc-corp",
        format: "company-slug",
      }
      assert_equal result, SocialLink::Signal.parse("https://signal.nfx.com/firms/abc-corp")
    end

  end

  describe "personal slug format" do

    it "parses default URLs" do
      result = {
        type:   "Signal",
        id:     "john-smith",
        format: "person-slug",
      }
      assert_equal result, SocialLink::Signal.parse("https://signal.nfx.com/investors/john-smith")
    end

  end

end
