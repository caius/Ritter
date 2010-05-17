# twitter_search.rb
# Ritter
#
# Created by Caius Durling on 17/05/2010.
# Copyright 2010 Swedish Campground Software. All rights reserved.

framework "JSON"

class TwitterSearch

  # Give it a term and a block to run afterwards
  # The block takes one param - an array of tweets
  def initialize term, &block
    self.block = block
    self.data = NSMutableData.new

    url = NSURL.URLWithString "http://search.twitter.com/search.json?q=#{term}"
    req = NSURLRequest.alloc.initWithURL(url)

    NSURLConnection.connectionWithRequest req, delegate:self
  end

protected
  attr_accessor :data, :block

  # More data received
  def connection conn, didReceiveData:d
    self.data.appendData d
  end

  # Our HTTP Call finished, make sure to run the block we were given at creation
  def connectionDidFinishLoading conn
    data_string = NSString.alloc.initWithData self.data, encoding:NSUTF8StringEncoding
    tweets = data_string.JSONValue["results"]
    self.block[tweets]
  end

end
