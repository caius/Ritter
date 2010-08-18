# TableDatasource.rb
# Ritter
#
# Created by Caius Durling on 17/05/2010.
# Copyright 2010 Swedish Campground Software. All rights reserved.

class TableDatasource

  def numberOfRowsInTableView view
    tweets.size
  end

  def tableView view, objectValueForTableColumn:column, row:index
    get_tweet index
  end

  def tableView view, heightOfRow:index
    tweet_column = view.tableColumnWithIdentifier("text")
    string = get_tweet(index)["text"]

    return view.rowHeight unless string

    cell = tweet_column.dataCell
    cell.stringValue = string

    width = view.frame.size.width - TweetColumnCell.text_width_border

    tallRect = NSRect.new([0, 0], [width, 10000])
    height_border = TweetColumnCell.text_height_border
    calculated_size = cell.cellSizeForBounds(tallRect).height + height_border
    min_height = TweetColumnCell.min_height

    calculated_size > min_height ? calculated_size : min_height
  end

protected

  # Delegate to the app
  def tweets
    NSApp.delegate.tweets
  end

  def get_tweet index
    t = tweets[index]
    {
      "id"         => t["id"],
      "created_at" => t["created_at"],
      "text"       => t["text"].gsub("&lt;", "<").gsub("&gt;", ">"),
      "author"     => t["from_user"],
      "avatar"     => t["profile_image_url"]
    }
  end

end
