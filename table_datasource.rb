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
    tweets[index][column.identifier]
  end

protected

  # Delegate to the app
  def tweets
    NSApp.delegate.tweets
  end

end
