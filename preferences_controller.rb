# preferences_controller.rb
# Ritter
#
# Created by Caius Durling on 18/05/2010.
# Copyright 2010 Swedish Campground Software. All rights reserved.

class PreferencesController < NSWindowController

  attr_accessor :mainWindow, :configureSheet, :text_field

  def show_preferences sender
    NSApp.beginSheet self.configureSheet,
          modalForWindow:self.mainWindow,
          modalDelegate:self,
          didEndSelector:nil,
          contextInfo:nil
  end

  def hide_preferences sender
    self.configureSheet.orderOut nil
    NSApp.endSheet self.configureSheet
    
    NSApp.delegate.refresh_tweets self
  end

end
