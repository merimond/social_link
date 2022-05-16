module SocialLink
  module AngelList

    NAME = "AngelList"

    def self.parse_valid(url, parts = nil)
      parts ||= URL.parse(url)
      unless parts.host =~ /angel\.co$/
        return nil
      end
      case parts.path.strip.downcase
      when /^\/company\/([a-z0-9\._-]+)$/
        { id: $1, format: "company" }
      when /^\/([a-z0-9\._-]+)$/
        { id: $1, format: "person" }
      when /^\/p\/([a-z0-9\._-]+)$/
        { id: $1, format: "person" }
      when /^\/u\/([a-z0-9\._-]+)$/
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
      when "company"
        "https://angel.co/company/#{id}"
      when "person"
        "https://angel.co/#{id}"
      else
        nil
      end
    end

  end
end
