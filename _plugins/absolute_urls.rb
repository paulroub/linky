# frozen_string_literal: true

require 'nokogiri'
require 'uri'

module Jekyll
    # This module provides a Liquid filter for converting relative URLs to absolute URLs.
    #
    # Particularly useful when creating a feed to be used for crossposting when
    # the feed is being consumed by a service that doesn't handle relative URLs,
    # as discussed here: https://roub.net/blahg/2024/11/02/note-to-self-how-to-crosspost-with-images/
    #
    module AbsoluteUrls
        # This filter converts relative URLs in the input to absolute URLs.
        #
        # @param input [String] the input string containing HTML content
        # @return [String] the modified input string with absolute URLs
        #
        # @example
        #   {{ post.content | absolute_urls }}
        #
        #  Given the following input:
        #     <a href="/foo"><img src="/images/image.jpg" /></a>
        #
        #  And a site URL of "https://example.com"
        #
        #  The output will be:
        #    <a href="https://example.com/foo"><img src="https://example.com/images/image.jpg" /></a>
        #
        def absolute_urls(input)
            fragment = Nokogiri::HTML5::DocumentFragment.parse(input)

            site = @context.registers[:site]
            baseurl = site.config['url']

            fragment.css('img').each do |img|
                absolute_item(baseurl, 'src', img)
            end

            fragment.css('a').each do |link|
                absolute_item(baseurl, 'href', link)
            end

            fragment.to_html.strip
        end

        def absolute_item(baseurl, url_attr, item)
            src = item.attr(url_attr)

            uri = URI.parse(src)

            return unless uri.host.nil?

            new_uri = URI.join(baseurl, src)
            item.set_attribute(url_attr, new_uri)
        end
    end
end

Liquid::Template.register_filter(Jekyll::AbsoluteUrls)
