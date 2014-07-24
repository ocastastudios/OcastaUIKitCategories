//
//  UIView+OSConstraints.h
//  Pods
//
//  Created by Chris Birch on 24/07/2014.
//
//

#import <UIKit/UIKit.h>

@interface UIView (OSConstraints)

/**
 * Adds the specified subview as a child and adds constraints to size it to fill this view
 */
-(void)addSubviewWithAutoSizeConstraints:(UIView *)view;

@end
