# AppController.rb
# Ritter
#
# Created by Caius Durling on 17/05/2010.
# Copyright 2010 Swedish Campground Software. All rights reserved.

require "twitter_search"

class AppDelegate
  attr_accessor :table, :spinner, :tweet_column

  def tweets
    @tweets ||= []
  end

  def applicationDidFinishLaunching n
    NSLog "Started!"

    NSLog "foo"
    self.refresh_tweets self
    
    cell = self.tweet_column.dataCell
    cell.wraps = true
  end

  # Grab new tweets and store in instance var
  # Pass it a block to run after tweets are collected
  def grab_tweets &block
    self.spinner.startAnimation self
    TwitterSearch.new("macruby") do |tweets|
      @tweets = tweets
      block[]
      self.spinner.stopAnimation self
    end
  end

  # Grabs new tweets, then tells the table to reload
  def refresh_tweets sender
    self.grab_tweets do
      self.table.reloadData
    end
  end

end
