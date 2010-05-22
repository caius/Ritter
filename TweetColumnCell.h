//
//  TweetColumnClass.h
//  Ritter
//
//  Created by Caius Durling on 22/05/2010.
//  Copyright 2010 Swedish Campground Software. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface TweetColumnCell : NSCell {

}

+ (NSInteger) min_height;
+ (NSInteger) text_width_border;
+ (NSInteger) text_height_border;

- (void)drawWithFrame:(NSRect)cellFrame inView:(NSView *)controlView;

@end
