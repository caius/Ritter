# tweet_column_cell.rb
# Ritter
#
# Created by Caius Durling on 20/05/2010.
# Copyright 2010 Swedish Campground Software. All rights reserved.

class TweetColumnCellRuby < NSCell

  def self.min_height
    83
  end

  def self.text_width_border
    90
  end

  def self.text_height_border
    30
  end

  # Uses the left 
  def iconFrameForCell cellFrame
    NSRect.new([cellFrame.origin.x + 13, cellFrame.origin.y + 16], [55, 55])
  end

  def authorPointFromCell cellFrame
    NSPoint.new(cellFrame.origin.x + 81, cellFrame.origin.y + 11)
  end

  def textFrameWithCell cellFrame
    width = cellFrame.size.width - TweetColumnCell.text_width_border
    height = cellFrame.size.height - TweetColumnCell.text_height_border
    point = NSPoint.new(cellFrame.origin.x + 81, cellFrame.origin.y + 35)
    NSRect.new(point, [width, height])
  end

  def authorTextAttributes
    {
      NSForegroundColorAttributeName => NSColor.blackColor,
      NSFontAttributeName => NSFont.fontWithName("Verdana", size:14)
    }
  end

  def textAttributes
    {
      NSForegroundColorAttributeName => NSColor.blackColor,
      NSFontAttributeName => NSFont.fontWithName("Helvetica", size:12)
    }
  end

  def drawWithFrame cellFrame, inView:controlView
    tweet     = self.objectValue

    image_url = NSURL.URLWithString(tweet["avatar"])
    author    = tweet["author"]
    text      = tweet["text"]

    # Draw the avatar
    image = NSImage.alloc.initByReferencingURL(image_url)
    image.flipped = true
    image.size = NSSize.new(55, 55)
    iconFrame = iconFrameForCell cellFrame
    image.drawInRect iconFrame, fromRect:NSZeroRect, operation:NSCompositeCopy, fraction:1.0
    
    # Draw the author name
    authorPoint = authorPointFromCell cellFrame
    author.drawAtPoint authorPoint, withAttributes:authorTextAttributes

    # Draw the tweet text
    textFrame = textFrameWithCell cellFrame
    text.drawInRect textFrame, withAttributes:textAttributes
  end

end
