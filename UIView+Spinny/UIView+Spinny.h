//
//  UIView+OSSpinny.h
//  Ocasta Studios
//
//  Created by Chris Birch on 24/04/2014.
//  Copyright (c) 2014 OcastaStudios. All rights reserved.
//

#import <UIKit/UIKit.h>

//The following are used for tags on the various UI elements so they can be retrieved later
#define OS_SPINNY_VIEW_CONTROLLER_TAG_DISABLED_VIEW 988723

#define OS_SPINNY_VIEW_CONTROLLER_STYLE UIActivityIndicatorViewStyleWhiteLarge
#define OS_SPINNY_VIEW_CONTROLLER_ANIMATION_TIME 0.5f

#define OS_SPINNY_VIEW_CONTROLLER_DEFAULT_COLOUR [UIColor colorWithWhite:0 alpha:0.4]

#define OS_SPINNY_COLOUR_GREY [UIColor colorWithWhite:0 alpha:0.4]
#define OS_SPINNY_COLOUR_WHITE [UIColor colorWithWhite:1 alpha:1]

/**
 * Prevents nasty flash if it doesnt take that long
 */
#define OS_SPINNY_VIEW_SHOW_DELAY 2


typedef void (^configureSpinny)(UIActivityIndicatorView* activityIndicator, UIView* backgroundDisabledView);

@interface UIView (Spinny)
/**
 * Represents the view that is placed over the top of the view controllers view to prevent user interaction.This returns the default background view as defined by the default spinny disabled view tag
 */
@property(nonatomic,readonly)UIView* spinnyDisabledView;

/**
 * Represents the spinny used to show the user that activity is happening. This returns the default spinny as defined by the default spinny disabled view tag + 1
 */
@property(nonatomic,readonly)UIActivityIndicatorView* spinny;


/**
 * Represents the view that is placed over the top of the view controllers view to prevent user interaction. . This returns a custom spinny as defined by the specified tag or nil if it doesnt exist
 */
-(UIView*) spinnyDisabledViewWithTag:(NSUInteger)tag;

/**
 * Represents the spinny used to show the user that activity is happening. This returns a custom spinny as defined by the specified tag or nil if it doesnt exist
 */
-(UIActivityIndicatorView*) spinnyWithTag:(NSUInteger)tag;

/**
 * Displays a "disabled" view + spinny over the top of the view controllers view of the default colour.
 */
-(void)showSpinnyShouldAnimateReveal:(BOOL)animate;

/**
 * Displays a "disabled" view + spinny over the top of the view controllers view with the specified colour.
 */
-(void)showSpinnyWithScreenColour:(UIColor*)colour shouldAnimateReveal:(BOOL)animate;

-(void)showSpinnyWithScreenColour:(UIColor *)colour shouldAnimateReveal:(BOOL)animate withSpinnyConfigBlock:(configureSpinny)config;

-(void)showSpinnyWithScreenColour:(UIColor *)colour shouldAnimateReveal:(BOOL)animate withUIActivityIndicatorViewStyle:(UIActivityIndicatorViewStyle)style withSpinnyConfigBlock:(configureSpinny)config;

/**
 * Use this method when you want to be sure no conflict with the default spinny
 */
-(void)showSpinnyWithScreenColour:(UIColor *)colour shouldAnimateReveal:(BOOL)animate withUIActivityIndicatorViewStyle:(UIActivityIndicatorViewStyle)style andDisabledViewTag:(NSUInteger)tag withSpinnyConfigBlock:(configureSpinny)config;
/**
 * Dismisses the default spinny view
 */
-(void)hideSpinnyShouldAnimate:(BOOL)animate;

/**
 * Dismisses a custom tagged spinny view. USe this method when you want to be sure no conflict with the default spinny
 */
-(void)hideSpinnyShouldAnimate:(BOOL)animate withCustomSpinnyTag:(NSUInteger)tag;



@end

