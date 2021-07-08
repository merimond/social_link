module SocialLink
  module Signal

    NAME = "Signal"

    def self.parse_valid(url, parts = nil)
      parts ||= URL.parse(url)
      unless parts.host =~ /signal\.nfx\.com$/
        return nil
      end
      case parts.path.strip.downcase
      when /^\/firms\/([^\/]+)/
        { id: $1, format: "company-slug" }
      when /^\/investors\/([^\/]+)/
        { id: $1, format: "person-slug" }
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
      when "company-slug"
        "https://signal.nfx.com/firms/#{id}"
      when "person-slug"
        "https://signal.nfx.com/investors/#{id}"
      else
        nil
      end
    end

  end
end
