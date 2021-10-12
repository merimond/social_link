module SocialLink
  module URL

    Result = Struct.new(:host, :path, :query, :fragment)

    # https://github.com/sporkmonger/addressable/blob/master/lib/addressable/uri.rb

    URIREGEX = /^(([^:\/?#]+):)?(\/\/([^\/?#]*))?([^?#]*)(\?([^#]*))?(#(.*))?$/

    def self.parse(uri)
      begin
        uri = uri.to_str.strip
      rescue TypeError, NoMethodError
        return Result.new(nil, nil, nil, nil)
      end

      unless uri =~ /^http/i
        uri.prepend("http://")
      end

      unless uri.is_a?(String)
        return nil
      end

      uri       = CGI::unescape(uri).scrub
      scan      = uri.scan(URIREGEX)
      fragments = scan[0]
      authority = fragments[3]
      path      = fragments[4]
      query     = fragments[6]
      fragment  = fragments[8]
      host      = nil

      if authority != nil
        host = authority.sub(
          /^([^\[\]]*)@/, ''
        ).sub(
          /:([^:@\[\]]*?)$/, ''
        )
      end

      host = nil if host.is_a?(String) && host.empty?
      Result.new(host, path, query, fragment)
    end

  end
end
