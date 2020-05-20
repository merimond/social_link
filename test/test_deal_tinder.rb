require 'minitest/autorun'
require 'social_link'

describe SocialLink::DealTinder do

  describe "company UUID format" do

    it "parses default URLs" do
      result = {
        type:   "DealTinder",
        id:     "fc251f84-4123-450c-890d-cea541e79479",
        format: "company-uuid",
      }
      assert_equal result, SocialLink::DealTinder.parse("https://dealtinder.com/companies/fc251f84-4123-450c-890d-cea541e79479")
    end

  end

  describe "company slug format" do

    it "parses default URLs" do
      result = {
        type:   "DealTinder",
        id:     "abc-corp",
        format: "company-slug",
      }
      assert_equal result, SocialLink::DealTinder.parse("https://dealtinder.com/companies/abc-corp")
    end

  end

  describe "personal UUID format" do

    it "parses default URLs" do
      result = {
        type:   "DealTinder",
        id:     "fc251f84-4123-450c-890d-cea541e79479",
        format: "person-uuid",
      }
      assert_equal result, SocialLink::DealTinder.parse("https://www.dealtinder.com/people/fc251f84-4123-450c-890d-cea541e79479")
    end

  end

  describe "personal slug format" do

    it "parses default URLs" do
      result = {
        type:   "DealTinder",
        id:     "john-smith",
        format: "person-slug",
      }
      assert_equal result, SocialLink::DealTinder.parse("https://dealtinder.com/people/john-smith")
    end

  end

end
