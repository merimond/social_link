module SocialLink
  module Bloomberg

    NAME = "Bloomberg"

    def self.parse_valid(url, parts = nil)
      parts ||= URL.parse(url)
      unless parts.host =~ /bloomberg.com$/
        return nil
      end
      case parts.path.strip
      when /^\/profile\/company\/([a-z0-9]{2,8}:[a-z]{2})$/i
        { id: $1, format: "ticker" }
      when /^\/profile\/company\/([a-z0-9]{2,8}:[a-z]{2})-/i
        { id: $1, format: "ticker" }
      when /^\/profiles\/people\/([\d]+)$/i
        { id: $1, format: "personal-numeric" }
      when /^\/profiles\/people\/([\d]+)-/i
        { id: $1, format: "personal-numeric" }
      when /^\/profile\/person\/([\d]+)$/i
        { id: $1, format: "personal-numeric" }
      when /^\/profile\/person\/([\d]+)-/i
        { id: $1, format: "personal-numeric" }
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
      when "ticker"
        "https://bloomberg.com/profile/company/#{id}"
      when "personal-numeric"
        "https://bloomberg.com/profile/person/#{id}"
      else
        nil
      end
    end

  end
end
