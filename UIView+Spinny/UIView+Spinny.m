//
//  UIView+OSSpinny.m
//  Ocasta Studios
//
//  Created by Chris Birch on 24/04/2014.
//  Copyright (c) 2014 OcastaStudios. All rights reserved.
//

#import "UIView+Spinny.h"

@implementation UIView (Spinny)



-(UIView *)spinnyDisabledView
{
    return [self spinnyDisabledViewWithTag:OS_SPINNY_VIEW_CONTROLLER_TAG_DISABLED_VIEW];
}

-(UIView *)spinnyDisabledViewWithTag:(NSUInteger)tag
{
    UIView* disabledView= [self viewWithTag:tag];
    
    //NSLog(@"Disabled view is %@",disabledView);
    
    return disabledView;
}

-(UIActivityIndicatorView *)spinny
{
    return [self spinnyWithTag:OS_SPINNY_VIEW_CONTROLLER_TAG_DISABLED_VIEW+1];
}

-(UIActivityIndicatorView *)spinnyWithTag:(NSUInteger)tag
{
    return (UIActivityIndicatorView*)[self viewWithTag:tag];
}

-(void)showSpinnyShouldAnimateReveal:(BOOL)animate
{
    [self showSpinnyWithScreenColour:OS_SPINNY_VIEW_CONTROLLER_DEFAULT_COLOUR shouldAnimateReveal:animate];
    

}

-(void)showSpinnyWithScreenColour:(UIColor *)colour shouldAnimateReveal:(BOOL)animate
{
    [self showSpinnyWithScreenColour:colour shouldAnimateReveal:animate withSpinnyConfigBlock:^(UIActivityIndicatorView *activityIndicator, UIView *backgroundDisabledView) {
        
    }];
}

-(void)showSpinnyWithScreenColour:(UIColor *)colour shouldAnimateReveal:(BOOL)animate withSpinnyConfigBlock:(configureSpinny)config
{
    [self showSpinnyWithScreenColour:colour shouldAnimateReveal:animate withUIActivityIndicatorViewStyle:OS_SPINNY_VIEW_CONTROLLER_STYLE withSpinnyConfigBlock:config];
}

-(void)showSpinnyWithScreenColour:(UIColor *)colour shouldAnimateReveal:(BOOL)animate withUIActivityIndicatorViewStyle:(UIActivityIndicatorViewStyle)style withSpinnyConfigBlock:(configureSpinny)config
{
    [self showSpinnyWithScreenColour:colour shouldAnimateReveal:animate withUIActivityIndicatorViewStyle:style andDisabledViewTag:OS_SPINNY_VIEW_CONTROLLER_TAG_DISABLED_VIEW withSpinnyConfigBlock:(configureSpinny)config];
}

-(void)showSpinnyWithScreenColour:(UIColor *)colour shouldAnimateReveal:(BOOL)animate withUIActivityIndicatorViewStyle:(UIActivityIndicatorViewStyle)style andDisabledViewTag:(NSUInteger)tag withSpinnyConfigBlock:(configureSpinny)config
{
    UIView* background = [self spinnyDisabledViewWithTag:tag];
    if (background)
    {
        //just change the colour
        background.backgroundColor = colour;
    }
    else
    {
//        NSLog(@"Showing spinny on view %@",self);
    
        
        CGRect bounds = self.bounds;
        
        //Create the required views
        UIView* backgroundView = [[UIView alloc] initWithFrame:bounds];
//        NSLog(@"Disabled view is %@",backgroundView);
        UIActivityIndicatorView* spinny = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:style];
        backgroundView.tag = tag;
        backgroundView.backgroundColor = colour;
        
        spinny.tag = tag+1;
        
        UIView* contentView = self;
        [backgroundView addSubview:spinny];
        [contentView addSubview:backgroundView];
        
//        NSLog(@"Disabled view parent is %@",backgroundView.superview);
        
        
      //  spinny.center = contentView.center;
//        
//        CGRect frame = spinny.frame;
//       // frame.origin.y -= 64;
//        spinny.frame = frame;
        
        
        
        backgroundView.translatesAutoresizingMaskIntoConstraints = NO;
        
        NSDictionary* viewsDictionary = NSDictionaryOfVariableBindings(backgroundView);
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[backgroundView]|" options:0 metrics: 0 views:viewsDictionary]];
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[backgroundView]|" options:0 metrics: 0 views:viewsDictionary]];
        
        spinny.translatesAutoresizingMaskIntoConstraints = NO;
        
        NSLayoutConstraint *xCenterConstraint = [NSLayoutConstraint constraintWithItem:spinny attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:backgroundView attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0];
        [self addConstraint:xCenterConstraint];
        
        NSLayoutConstraint *yCenterConstraint = [NSLayoutConstraint constraintWithItem:spinny attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:backgroundView attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0];
        [self addConstraint:yCenterConstraint];

        
        //        [spinny alignWithView:self.view usingFlags:ViewRepositioningAlignCentres andFineTuningOffset:CGPointZero andFineTuningSizeOffset:CGSizeZero];
        
        //        OSVisualDebuggingView* debuggingView = [[OSVisualDebuggingView alloc] initWithFrame:self.view.bounds];
        //        [contentView addSubview:debuggingView];
        
        ///        [contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[spinny]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(spinny)]];
        //     [contentView addConstraint:[NSLayoutConstraint constraintWithItem:spinny attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:contentView attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0]];
        
        
        [spinny startAnimating];

        //allow user to config spinny
        config(spinny,backgroundView);
                 
        
    }
    
    
}

-(void)hideSpinnyShouldAnimate:(BOOL)animate
{
    [self hideSpinnyShouldAnimate:animate withCustomSpinnyTag:OS_SPINNY_VIEW_CONTROLLER_TAG_DISABLED_VIEW];
}

-(void)hideSpinnyShouldAnimate:(BOOL)animate withCustomSpinnyTag:(NSUInteger)tag
{
    UIView* spinnyBackgroundView = [self spinnyDisabledViewWithTag:tag];
    
    //NSLog(@"Hiding spinny on view %@",self);
      //      NSLog(@"Disabled view parent is %@",spinnyBackgroundView.superview);
    if (spinnyBackgroundView)
    {
        NSTimeInterval aniTime = 0;
        
        if (animate)
        {
            aniTime = OS_SPINNY_VIEW_CONTROLLER_ANIMATION_TIME;
            
        }
        
        [UIView animateWithDuration:aniTime delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            spinnyBackgroundView.backgroundColor = [UIColor clearColor];
        }
                         completion:^(BOOL finished) {
                             [spinnyBackgroundView removeFromSuperview];
                         }];
    }
    //else nothing to do as we have no spinny visible
    
}


@end
