module SocialLink
  module Facebook

    NAME = "Facebook"

    def self.parse_query_based_formats(query)
      case query
      when /^id=(\d+)/
        { id: $1, format: "numeric" }
      else
        nil
      end
    end

    def self.parse_valid(url, parts = nil)
      # https://www.facebook.com/help/105399436216001
      parts ||= URL.parse(url)
      unless parts.host =~ /facebook.com$/
        return nil
      end
      case parts.path.strip.downcase
      when /profile\.php$/
        parse_query_based_formats(parts.query)
      when /\.php$/
        nil #
      when /-(\d{8,})/
        { id: $1, format: "numeric" }
      when /\/(\d{8,})/
        { id: $1, format: "numeric" }
      when /^\/pg\/([a-z0-9\._-]+)\/?/
        { id: $1, format: "slug" }
      when /^\/([a-z0-9\._-]+)\/?$/
        { id: $1, format: "slug" }
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
      when "slug"
        "https://facebook.com/#{id}"
      when "numeric"
        "https://facebook.com/#{id}"
      else
        nil
      end
    end

  end
end
