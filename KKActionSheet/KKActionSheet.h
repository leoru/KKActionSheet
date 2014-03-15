//
//  KKActionSheet.h
//  KKActionSheet
//
//  Created by Kirill Kunst on 15.03.14.
//  Copyright (c) 2014 Kirill Kunst. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  Subclass of UIActionSheet for setting text color in buttons for given indexes
 */
@interface KKActionSheet : UIActionSheet

/**
 *  Set text color for all indexes in actionSheet
 *
 *  @param color Color
 */
- (void)setTitlesTextColor:(UIColor *)color;

/**
 *  Set text color for given button index
 *
 *  @param color Color
 *  @param index Button index
 */
- (void)setTextColor:(UIColor *)color forButtonIndex:(NSInteger)index;

/**
 *  Set array of text color for array of buttons indexes
 *
 *  @param colors  Array of colors
 *  @param indexes Array of buttons indexes
 */
- (void)setTextColors:(NSArray *)colors forButtonIndexes:(NSArray *)indexes;

@end
