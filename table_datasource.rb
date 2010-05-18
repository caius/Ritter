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
    get_tweet index, column.identifier
  end
  
  def tableView view, heightOfRow:index
    tweet_column = view.tableColumnWithIdentifier("text")
    string = get_tweet index, "text"

    return view.rowHeight unless string

    cell = tweet_column.dataCell
    cell.stringValue = string

    tallRect = NSRect.new([0, 0], [view.frame.size.width, 10000])
    cell.cellSizeForBounds(tallRect).height
  end

protected

  # Delegate to the app
  def tweets
    NSApp.delegate.tweets
  end

  def get_tweet index, field
    tweets[index][field]
  end

end
