require 'minitest/autorun'
require 'social_link'

describe SocialLink::LinkedIn do

  describe "numeric company URL" do

    it "parses beta format" do
      result = {
        type:   "LinkedIn",
        id:     "529750",
        format: "company-numeric",
      }
      assert_equal result, SocialLink::LinkedIn.parse("https://www.linkedin.com/company-beta/529750")
    end

    it "parses beta format with trailing slash" do
      result = {
        type:   "LinkedIn",
        id:     "529750",
        format: "company-numeric",
      }
      assert_equal result, SocialLink::LinkedIn.parse("https://www.linkedin.com/company-beta/529750/")
    end

    it "parses beta format with trailing pages" do
      result = {
        type:   "LinkedIn",
        id:     "529750",
        format: "company-numeric",
      }
      assert_equal result, SocialLink::LinkedIn.parse("https://www.linkedin.com/company-beta/529750/admin")
    end

    it "parses default format" do
      result = {
        type:   "LinkedIn",
        id:     "18312366",
        format: "company-numeric",
      }
      assert_equal result, SocialLink::LinkedIn.parse("https://www.linkedin.com/company/18312366")
    end

    it "strips trailing spaces" do
      result = {
        type:   "LinkedIn",
        id:     "18312366",
        format: "company-numeric",
      }
      assert_equal result, SocialLink::LinkedIn.parse("https://www.linkedin.com/company/18312366%20%20")
    end

    it "parses default format with trailing slash" do
      result = {
        type:   "LinkedIn",
        id:     "18312366",
        format: "company-numeric",
      }
      assert_equal result, SocialLink::LinkedIn.parse("https://www.linkedin.com/company/18312366/")
    end

    it "parses default format with trailing pages" do
      result = {
        type:   "LinkedIn",
        id:     "18312366",
        format: "company-numeric",
      }
      assert_equal result, SocialLink::LinkedIn.parse("https://www.linkedin.com/company/18312366/admin")
    end

    it "parses default format with query params" do
      result = {
        type:   "LinkedIn",
        id:     "471613",
        format: "company-numeric",
      }
      assert_equal result, SocialLink::LinkedIn.parse("https://www.linkedin.com/company/471613?trk=tyah&trkInfo=clickedVertical:company,idx:1-2-2,tarId:1428403335184,tas:Murphy+Realty+Group+")
    end

  end

  describe "slug-based company URL" do

    it "parses IDs that start with numbers" do
      result = {
        type:   "LinkedIn",
        id:     "3imedia-gmbh",
        format: "company-slug",
      }
      assert_equal result, SocialLink::LinkedIn.parse("https://in.linkedin.com/company/3imedia-gmbh")
    end

    it "parses about pages" do
      result = {
        type:   "LinkedIn",
        id:     "3imedia-gmbh",
        format: "company-slug",
      }
      assert_equal result, SocialLink::LinkedIn.parse("https://in.linkedin.com/company/3imedia-gmbh/about")
    end

    it "parses admin pages" do
      result = {
        type:   "LinkedIn",
        id:     "3imedia-gmbh",
        format: "company-slug",
      }
      assert_equal result, SocialLink::LinkedIn.parse("https://in.linkedin.com/company/3imedia-gmbh/admin/")
    end

    it "parses non-latin characters" do
      result = {
        type:   "LinkedIn",
        id:     "hongo-aerospace-inc-本郷飛行機株式会社",
        format: "company-slug",
      }
      assert_equal result, SocialLink::LinkedIn.parse("https://www.linkedin.com/company/hongo-aerospace-inc-本郷飛行機株式会社/about/")
    end

    it "decodes non-latin characters" do
      result = {
        type:   "LinkedIn",
        id:     "ökobit-gmbh",
        format: "company-slug",
      }
      assert_equal result, SocialLink::LinkedIn.parse("https://www.linkedin.com/company/%C3%B6kobit-gmbh")
    end

  end

  describe "slug-based personal URL" do

    it "parses default format" do
      result = {
        type:   "LinkedIn",
        id:     "satyadas",
        format: "personal-slug",
      }
      assert_equal result, SocialLink::LinkedIn.parse("https://www.linkedin.com/in/satyadas")
    end

    it "parses sub pages" do
      result = {
        type:   "LinkedIn",
        id:     "pedro-da-cunha-15692b2",
        format: "personal-slug",
      }
      assert_equal result, SocialLink::LinkedIn.parse("https://www.linkedin.com/in/pedro-da-cunha-15692b2/detail/photo/")
    end

  end

  describe "numeric personal URL" do

    it "parses default format" do
      result = {
        type:   "LinkedIn",
        id:     "8324788",
        format: "personal-numeric",
      }
      assert_equal result, SocialLink::LinkedIn.parse("http://www.linkedin.com/profile/view?id=8324788")
    end

  end

  describe "alphanumeric personal URL" do

    it "parses default format" do
      result = {
        type:   "LinkedIn",
        id:     "AAMAAAFi4FsBpLyzJYzdWbF5iBXKdjYKpKaC_xU",
        format: "personal-alphanumeric",
      }
      assert_equal result, SocialLink::LinkedIn.parse("https://www.linkedin.com/profile/view?id=AAMAAAFi4FsBpLyzJYzdWbF5iBXKdjYKpKaC_xU")
    end

    it "parses ID that does not start with AA" do
      result = {
        type:   "LinkedIn",
        id:     "ADEAAACyO-IB6V3Dp5YzA0UWvt3-yBrjxjZ_THo",
        format: "personal-alphanumeric",
      }
      assert_equal result, SocialLink::LinkedIn.parse("https://www.linkedin.com/profile/view?id=ADEAAACyO-IB6V3Dp5YzA0UWvt3-yBrjxjZ_THo&authType=NAME_SEARCH&authToken=p4tC&locale=en_US&srchid=2532768931448858380759&srchindex=1&srchtotal=5&trk=vsrp_people_res_name&trkInfo=VSRPsearchId:2532768931448858380759,VSRPtargetId:11680738,VSRPcmpt:primary,VSRPnm:true,authType:NAME_SEARCH")
    end

    it "drops other params" do
      result = {
        type:   "LinkedIn",
        id:     "AAkAAAAB0SIB-dUsEu1Zv6043t-xyi8EpOYHYAM",
        format: "personal-alphanumeric",
      }
      assert_equal result, SocialLink::LinkedIn.parse("https://www.linkedin.com/profile/view?id=AAkAAAAB0SIB-dUsEu1Zv6043t-xyi8EpOYHYAM&authType=NAME_SEARCH&authToken=Tkhu&locale=en_US&trk=tyah&trkInfo=clickedVertical:mynetwork,clickedEntityId:119074,authType:NAME_SEARCH,idx:2-1-3,tarId:1446686688308,tas:shiraz")
    end

  end

  describe "old style personal URL" do

    it "parses default format" do
      result = {
        type:   "LinkedIn",
        id:     "nick-chonich/104/2bb/a28",
        format: "personal-old",
      }
      assert_equal result, SocialLink::LinkedIn.parse("https://www.linkedin.com/pub/nick-chonich/104/2bb/a28")
    end

  end

  describe "educational URL" do

    it "fails for school URLs" do
      assert_nil SocialLink::LinkedIn.parse("https://www.linkedin.com/school/universidad-etac/")
    end

  end

  describe "invalid" do

    it "fails for showcase URLs" do
      assert_nil SocialLink::LinkedIn.parse("https://www.linkedin.com/showcase/datasurfhouse/")
    end

    it "fails when other domain is specified" do
      assert_nil SocialLink::Facebook.parse("https://www.example.org/pub/nick-chonich/104/2bb/a28")
    end

  end

end

