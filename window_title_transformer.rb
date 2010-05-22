# window_title_transformer.rb
# Ritter
#
# Created by Caius Durling on 19/05/2010.
# Copyright 2010 Swedish Campground Software. All rights reserved.

class WindowTitleTransformer < NSValueTransformer

  def self.transformedValueClass
    return NSString
  end

  def self.allowsReverseTransformation
    false
  end

  def transformedValue val
    "Ritter - #{val}"
  end

end
