require 'minitest/autorun'
require 'social_link'

describe SocialLink::Bloomberg do

  describe "company ticker format" do

    it "parses default URLs" do
      result = {
        type:   "Bloomberg",
        id:     "214382Z:US",
        format: "company-ticker",
      }
      assert_equal result, SocialLink::Bloomberg.parse("https://www.bloomberg.com/profile/company/214382Z:US")
    end

    it "parses URLs with names" do
      result = {
        type:   "Bloomberg",
        id:     "214382Z:US",
        format: "company-ticker",
      }
      assert_equal result, SocialLink::Bloomberg.parse("https://www.bloomberg.com/profile/company/214382Z:US-MDeverywhere-Inc")
    end

    it "parses URLs with `-U:CN` tickers" do
      result = {
        type:   "Bloomberg",
        id:     "MEW-U:CN",
        format: "company-ticker",
      }
      assert_equal result, SocialLink::Bloomberg.parse("https://www.bloomberg.com/profile/company/MEW-U:CN-menu-foods-income-fund")
    end

    it "parses URLs with `/U:US` tickers" do
      result = {
        type:   "Bloomberg",
        id:     "LCA/U:US",
        format: "company-ticker",
      }
      assert_equal result, SocialLink::Bloomberg.parse("https://www.bloomberg.com/profile/company/LCA/U:US-lambert's-cove-acquisition-corp")
    end

    it "parses URLs with `/A:CN` tickers" do
      result = {
        type:   "Bloomberg",
        id:     "OGI/A:CN",
        format: "company-ticker",
      }
      assert_equal result, SocialLink::Bloomberg.parse("https://www.bloomberg.com/profile/company/OGI/A:CN-optimum-general-inc")
    end

    it "parses URLs with `/P:CN` tickers" do
      result = {
        type:   "Bloomberg",
        id:     "ELE/P:CN",
        format: "company-ticker",
      }
      assert_equal result, SocialLink::Bloomberg.parse("https://www.bloomberg.com/profile/company/ELE/P:CN-elevation-capital-corp")
    end

    it "parses URLs with `/H:CN` tickers" do
      result = {
        type:   "Bloomberg",
        id:     "ALH/H:CN",
        format: "company-ticker",
      }
      assert_equal result, SocialLink::Bloomberg.parse("https://www.bloomberg.com/profile/company/ALH/H:CN-alhambra-resources-ltd")
    end

  end

  describe "personal numeric format in plural" do

    it "parses default URLs" do
      result = {
        type:   "Bloomberg",
        id:     "18019402",
        format: "person-numeric",
      }
      assert_equal result, SocialLink::Bloomberg.parse("https://www.bloomberg.com/profiles/people/18019402")
    end

    it "parses URLs with names" do
      result = {
        type:   "Bloomberg",
        id:     "18019402",
        format: "person-numeric",
      }
      assert_equal result, SocialLink::Bloomberg.parse("https://www.bloomberg.com/profiles/people/18019402-ramesh-rao")
    end

  end

  describe "personal numeric format in singular" do

    it "parses default URLs" do
      result = {
        type:   "Bloomberg",
        id:     "18019402",
        format: "person-numeric",
      }
      assert_equal result, SocialLink::Bloomberg.parse("https://www.bloomberg.com/profile/person/18019402")
    end

    it "parses URLs with names" do
      result = {
        type:   "Bloomberg",
        id:     "18019402",
        format: "person-numeric",
      }
      assert_equal result, SocialLink::Bloomberg.parse("https://www.bloomberg.com/profile/person/18019402-ramesh-rao")
    end

  end

end
