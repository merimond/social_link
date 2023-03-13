require 'minitest/autorun'
require 'social_link'

describe SocialLink::PitchBook do

  describe "advisor numeric format" do

    it "parses default URLs" do
      result = {
        type:   "PitchBook",
        id:     "10066-42",
        format: "advisor-numeric",
      }
      assert_equal result, SocialLink::PitchBook.parse("https://pitchbook.com/profiles/advisor/10066-42")
    end

  end

  describe "company numeric format" do

    it "parses default URLs" do
      result = {
        type:   "PitchBook",
        id:     "103310-65",
        format: "company-numeric",
      }
      assert_equal result, SocialLink::PitchBook.parse("https://pitchbook.com/profiles/company/103310-65")
    end

  end

  describe "investor numeric format" do

    it "parses default URLs" do
      result = {
        type:   "PitchBook",
        id:     "10331-11",
        format: "investor-numeric",
      }
      assert_equal result, SocialLink::PitchBook.parse("https://pitchbook.com/profiles/investor/10331-11")
    end

  end

  describe "LP numeric format" do

    it "parses default URLs" do
      result = {
        type:   "PitchBook",
        id:     "105997-42",
        format: "limited-partner-numeric",
      }
      assert_equal result, SocialLink::PitchBook.parse("https://pitchbook.com/profiles/limited-partner/105997-42")
    end

  end

  describe "personal numeric format" do

    it "parses default URLs" do
      result = {
        type:   "PitchBook",
        id:     "103311-19P",
        format: "person-numeric",
      }
      assert_equal result, SocialLink::PitchBook.parse("https://pitchbook.com/profiles/person/103311-19P")
    end

  end

end
