//
//  UIView+OSConstraints.m
//  Pods
//
//  Created by Chris Birch on 24/07/2014.
//
//

#import "UIView+OSConstraints.h"

@implementation UIView (OSConstraints)


-(void)addSubviewWithAutoSizeConstraints:(UIView *)view
{
 
    view.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:view];
    
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:view.superview attribute:NSLayoutAttributeTop multiplier:1 constant:0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:view.superview attribute:NSLayoutAttributeBottom multiplier:1 constant:0]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:view.superview attribute:NSLayoutAttributeLeading multiplier:1 constant:0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:view.superview attribute:NSLayoutAttributeTrailing multiplier:1 constant:0]];
    

}

@end
