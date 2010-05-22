//
//  TweetColumnClass.m
//  Ritter
//
//  Created by Caius Durling on 22/05/2010.
//  Copyright 2010 Swedish Campground Software. All rights reserved.
//

#import "TweetColumnCell.h"

@interface TweetColumnCell ()

- (NSRect) iconFrameForCell:(NSRect)cellFrame;
- (NSPoint) authorPointFromCell:(NSRect)cellFrame;
- (NSRect) textFrameWithCell:(NSRect)cellFrame;

- (NSDictionary*) authorTextAttributes;
- (NSDictionary*) textAttributes;

@end



@implementation TweetColumnCell

+ (NSInteger) min_height
{
  return (NSInteger)83;
}

+ (NSInteger) text_width_border
{
  return (NSInteger)90;
}

+ (NSInteger) text_height_border
{
  return (NSInteger)30;
}

- (NSRect) iconFrameForCell:(NSRect)cellFrame
{
  return NSMakeRect((cellFrame.origin.x + 13), (cellFrame.origin.y + 16), 55, 55);
}

- (NSPoint) authorPointFromCell:(NSRect)cellFrame
{
  return NSMakePoint(cellFrame.origin.x + 81, cellFrame.origin.y + 11);
}

- (NSRect) textFrameWithCell:(NSRect)cellFrame
{
  NSInteger width = cellFrame.size.width - [TweetColumnCell text_width_border];
  NSInteger height = cellFrame.size.height - [TweetColumnCell text_height_border];
  NSPoint point = NSMakePoint(cellFrame.origin.x + 81, cellFrame.origin.y + 35);
  return NSMakeRect(point.x, point.y, width, height);
}

- (NSDictionary*) authorTextAttributes
{
  return [NSDictionary dictionaryWithObjectsAndKeys:[NSColor blackColor], NSForegroundColorAttributeName, [NSFont fontWithName:@"Verdana" size:14.0], NSFontAttributeName, nil];
}

- (NSDictionary*) textAttributes
{
    return [NSDictionary dictionaryWithObjectsAndKeys:[NSColor blackColor], NSForegroundColorAttributeName, [NSFont fontWithName:@"Helvetica" size:12.0], NSFontAttributeName, nil];
}

- (void) drawWithFrame:(NSRect)cellFrame inView:(NSView *)controlView
{
  NSDictionary *tweet = self.objectValue;
  
  NSURL *image_url = [NSURL URLWithString:[tweet objectForKey:@"avatar"]];
  NSString *author = [tweet objectForKey:@"author"];
  NSString *text   = [tweet objectForKey:@"text"];
  
  // Draw the avatar
  NSImage *image = [[NSImage alloc] initByReferencingURL:image_url];
//  [image setFlipped:YES];
  [image setSize:NSMakeSize(55.0, 55.0)];
  [image drawInRect:[self iconFrameForCell:cellFrame]
           fromRect:NSZeroRect
          operation:NSCompositeCopy
           fraction:1.0];
  [image release];
  
  // Draw the author name
  [author drawAtPoint:[self authorPointFromCell:cellFrame]
       withAttributes:[self authorTextAttributes]];
  
  // Draw the tweet text
  [text drawInRect:[self textFrameWithCell:cellFrame]
    withAttributes:[self textAttributes]];
  
}

@end
