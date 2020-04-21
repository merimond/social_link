module SocialLink
  module Twitter

    NAME = "Twitter"

    def self.parse_valid(url, parts = nil)
      # https://help.twitter.com/en/managing-your-account/twitter-username-rules
      parts ||= URL.parse(url)
      unless parts.host =~ /twitter.com$/
        return nil
      end
      case parts.path.strip.downcase
      when /^\/([a-z0-9_]+)\/?$/
        { id: $1, format: "default" }
      else
        nil
      end
    end

    def self.guess_invalid(url)
      unless url.is_a?(String)
        return nil
      end
      case url.strip.downcase
      when /@([a-z0-9_]+)/ # Common error
        { id: $1, format: "default" }
      else
        nil
      end
    end

    def self.parse(url, parts = nil)
      parts ||= URL.parse(url)
      result = parse_valid(url, parts) || guess_invalid(url)
      result.nil? ? nil : result.merge(type: NAME)
    end

    def self.construct(id, format = nil)
      "https://twitter.com/#{id}"
    end

  end
end
