# AppController.rb
# Ritter
#
# Created by Caius Durling on 17/05/2010.
# Copyright 2010 Swedish Campground Software. All rights reserved.

class AppDelegate

  attr_accessor :table, :spinner, :tweet_column, :search_term

  def tweets
    @tweets ||= []
  end

  def applicationDidFinishLaunching n        
    self.search_term ||= "macruby"

    self.refresh_tweets self

    cell = ::TweetColumnCell.alloc.init
    cell.wraps = true
    self.tweet_column.dataCell = cell
  end

  # Reload the table to redraw the content
  def windowDidResize n
    self.table.reloadData
  end

  # Grab new tweets and store in instance var
  # Pass it a block to run after tweets are collected
  def grab_tweets &block
    NSLog "grab_tweets"
    self.spinner.startAnimation self
    TwitterSearch.new(self.search_term) do |tweets|
      @tweets = tweets
      block[]
      self.spinner.stopAnimation self
    end
  end

  # Grabs new tweets, then tells the table to reload
  def refresh_tweets sender
    NSLog "refresh_tweets"
    self.grab_tweets do
      self.table.reloadData
    end
  end

end
