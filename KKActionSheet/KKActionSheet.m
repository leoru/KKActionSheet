//
//  KKActionSheet.m
//  KKActionSheet
//
//  Created by Kirill Kunst on 15.03.14.
//  Copyright (c) 2014 Kirill Kunst. All rights reserved.
//

#import "KKActionSheet.h"

@interface KKActionSheet()

@property (nonatomic, strong) UIColor *titleTextColor;
@property (nonatomic, strong) NSMutableDictionary *titleTextColors;

@end

@implementation KKActionSheet

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
    }
    return self;
}

/**
 * Overrided show methods
 */

- (void)showInView:(UIView *)view
{
    [super showInView:view];
    [self updateTextColor];
}

-(void)showFromBarButtonItem:(UIBarButtonItem *)item animated:(BOOL)animated
{
    [super showFromBarButtonItem:item animated:animated];
    [self updateTextColor];
}

-(void)showFromRect:(CGRect)rect inView:(UIView *)view animated:(BOOL)animated
{
    [super showFromRect:rect inView:view animated:animated];
    [self updateTextColor];
}

-(void)showFromTabBar:(UITabBar *)view
{
    [super showFromTabBar:view];
    [self updateTextColor];
}

-(void)showFromToolbar:(UIToolbar *)view
{
    [super showFromToolbar:view];
    [self updateTextColor];
}

/**
 *  Set text color for all buttons
 *
 *  @param color Color
 */
- (void)setTitlesTextColor:(UIColor *)color
{
    self.titleTextColor = color;
}

/**
 *  Set text color for single button index
 *
 *  @param color Color
 *  @param index Button index
 */
- (void)setTextColor:(UIColor *)color forButtonIndex:(NSInteger)index
{
    self.titleTextColors[@(index)] = color;
}

/**
 *  Set array of text color for array of buttons indexes
 *
 *  @param colors  Array of colors
 *  @param indexes Array of buttons indexes
 */
- (void)setTextColors:(NSArray *)colors forButtonIndexes:(NSArray *)indexes
{
    if (indexes.count != colors.count) {
        return;
    }
    
    for (int i = 0; i < colors.count; i++) {
        self.titleTextColors[indexes[i]] = colors[i];
    }
}

/**
 *  Get all buttons in actionsheet subviews
 *
 *  @return Buttons array
 */
- (NSArray *)buttonsInActionSheetSubviews
{
    NSMutableArray *buttons = [NSMutableArray array];
    for (id subView in self.subviews) {
        if ([subView isKindOfClass:[UIButton class]]) {
            [buttons addObject:subView];
        }
    }
    return buttons;
}

/**
 *  Update text color for buttons indexes
 */
- (void)updateTextColor
{
    NSArray *buttons = [self buttonsInActionSheetSubviews];
    for (int i = 0; i < buttons.count; i++) {
        UIButton *button = buttons[i];
        UIColor *color = [self colorForIndex:i];
        [button setTitleColor:color forState:UIControlStateNormal];
        [button setTitleColor:color forState:UIControlStateSelected];
        [button setTitleColor:color forState:UIControlStateHighlighted];
    }
}

/**
 *  Color for button index from titlesTextColors or base titleTextColor
 *
 *  @param index Button index
 *
 *  @return Color for button at given index
 */
- (UIColor *)colorForIndex:(NSInteger)index {
    if (self.titleTextColors.count == 0) {
        return self.titleTextColor;
    }
    UIColor *color = self.titleTextColors[@(index)];
    if (color == nil)
        color = self.titleTextColor;
    return color;
}

#pragma mark - Lazy properties
- (UIColor *)titleTextColor
{
    if (!_titleTextColor) {
        _titleTextColor = [UIColor blackColor];
    }
    return _titleTextColor;
}

- (NSMutableDictionary *)titleTextColors
{
    if (!_titleTextColors) {
        _titleTextColors = [NSMutableDictionary dictionary];
    }
    return _titleTextColors;
}


@end
