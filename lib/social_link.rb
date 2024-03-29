require "cgi"
require "social_link/url"
require "social_link/angel_list"
require "social_link/bloomberg"
require "social_link/capital_iq"
require "social_link/crunchbase"
require "social_link/dealroom"
require "social_link/deal_tinder"
require "social_link/facebook"
require "social_link/linked_in"
require "social_link/pei"
require "social_link/pitch_book"
require "social_link/sociopath"
require "social_link/signal"
require "social_link/twitter"

module SocialLink
  def self.parse(url, type = nil)
    parts  = URL.parse(url)

    result = case parts.host
      when /angel\.co$/
        AngelList.parse(url, parts)
      when /bloomberg\.com$/
        Bloomberg.parse(url, parts)
      when /capitaliq\.com$/
        CapitalIQ.parse(url, parts)
      when /crunchbase\.com$/
        Crunchbase.parse(url, parts)
      when /dealroom\.co$/
        Dealroom.parse(url, parts)
      when /dealtinder\.com$/
        DealTinder.parse(url, parts)
      when /facebook\.com$/
        Facebook.parse(url, parts)
      when /linkedin\.com$/
        LinkedIn.parse(url, parts)
      when /pitchbook\.com/
        PitchBook.parse(url, parts)
      when /privateequityinternational\.com/
        PEI.parse(url, parts)
      when /signal\.nfx\.com$/
        Signal.parse(url, parts)
      when /sociopath\.io$/
        Sociopath.parse(url, parts)
      when /twitter\.com$/
        Twitter.parse(url, parts)
      else nil
    end

    unless result.nil?
      return result
    end

    case type
      when AngelList::NAME  then AngelList.parse(url, parts)
      when Bloomberg::NAME  then Bloomberg.parse(url, parts)
      when CapitalIQ::NAME  then CapitalIQ.parse(url, parts)
      when Crunchbase::NAME then Crunchbase.parse(url, parts)
      when Dealroom::NAME   then Dealroom.parse(url, parts)
      when DealTinder::NAME then DealTinder.parse(url, parts)
      when Facebook::NAME   then Facebook.parse(url, parts)
      when LinkedIn::NAME   then LinkedIn.parse(url, parts)
      when PEI::NAME        then PEI.parse(url, parts)
      when PitchBook::NAME  then PitchBook.parse(url, parts)
      when Sociopath::NAME  then Sociopath.parse(url, parts)
      when Signal::NAME     then Signal.parse(url, parts)
      when Twitter::NAME    then Twitter.parse(url, parts)
      else nil
    end
  end

  def self.construct(id:, type:, format: nil)
    case type
      when AngelList::NAME  then AngelList.construct(id, format)
      when Bloomberg::NAME  then Bloomberg.construct(id, format)
      when CapitalIQ::NAME  then CapitalIQ.construct(id, format)
      when Crunchbase::NAME then Crunchbase.construct(id, format)
      when Dealroom::NAME   then Dealroom.construct(id, format)
      when DealTinder::NAME then DealTinder.construct(id, format)
      when Facebook::NAME   then Facebook.construct(id, format)
      when LinkedIn::NAME   then LinkedIn.construct(id, format)
      when PEI::NAME        then PEI.construct(id, format)
      when PitchBook::NAME  then PitchBook.construct(id, format)
      when Sociopath::NAME  then Sociopath.construct(id, format)
      when Signal::NAME     then Signal.construct(id, format)
      when Twitter::NAME    then Twitter.construct(id, format)
      else nil
    end
  end
end
