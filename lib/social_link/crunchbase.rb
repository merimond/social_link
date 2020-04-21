module SocialLink
  module Crunchbase

    NAME = "Crunchbase"

    def self.parse_valid(url, parts = nil)
      parts ||= URL.parse(url)
      unless parts.host =~ /crunchbase.com$/
        return nil
      end
      case parts.path.strip.downcase
      when /acquisition\/(.+)/
        { id: $1, format: "acquisition" }
      when /organization\/(.+)/
        { id: $1, format: "organization" }
      when /funding_round\/(.+)/
        { id: $1, format: "funding-round" }
      when /person\/(.+)/
        { id: $1, format: "person" }
      else
        nil
      end
    end

    def self.guess_invalid(url)
      nil
    end

    def self.parse(url, parts = nil)
      parts ||= URL.parse(url)
      result = parse_valid(url, parts) || guess_invalid(url)
      result.nil? ? nil : result.merge(type: NAME)
    end

    def self.construct(id, format)
      case format
      when "organization"
        "https://crunchbase.com/organization/#{id}"
      when "person"
        "https://crunchbase.com/person/#{id}"
      when "acquisition"
        "https://crunchbase.com/acquisition/#{id}"
      when "funding-round"
        "https://crunchbase.com/funding_round/#{id}"
      else
        nil
      end
    end

  end
end
