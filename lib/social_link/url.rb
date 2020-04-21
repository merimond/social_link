module SocialLink
  module URL

    Result = Struct.new(:host, :path, :query)

    # https://github.com/sporkmonger/addressable/blob/master/lib/addressable/uri.rb

    URIREGEX = /^(([^:\/?#]+):)?(\/\/([^\/?#]*))?([^?#]*)(\?([^#]*))?(#(.*))?$/

    def self.parse(uri)
      begin
        uri = uri.to_str.strip
      rescue TypeError, NoMethodError
        return Result.new(nil, nil, nil)
      end

      unless uri =~ /^http/i
        uri.prepend("http://") 
      end

      uri       = CGI::unescape(uri).scrub
      scan      = uri.scan(URIREGEX)
      fragments = scan[0]
      authority = fragments[3]
      path      = fragments[4]
      query     = fragments[6]
      host      = nil

      if authority != nil
        host = authority.sub(
          /^([^\[\]]*)@/, ''
        ).sub(
          /:([^:@\[\]]*?)$/, ''
        )
      end

      Result.new(host, path, query)
    end

  end
end
