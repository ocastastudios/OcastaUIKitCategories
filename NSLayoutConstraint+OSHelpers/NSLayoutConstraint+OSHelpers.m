//
//  NSLayoutConstraint+OSHelpers.m
//  Ocasta Studios
//
//  Created by Chris Birch on 24/07/2014.
//  Copyright (c) 2014 Ocasta Studios. All rights reserved.
//

#import "NSLayoutConstraint+OSHelpers.h"
#import <objc/runtime.h>

@implementation NSLayoutConstraint (OSHelpers)

@dynamic originalConstant;


-(void)setOriginalConstant:(CGFloat)originalConstant
{
    objc_setAssociatedObject(self, @selector(originalConstant), [NSNumber numberWithFloat:originalConstant], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(CGFloat)originalConstant
{
    NSNumber* num = objc_getAssociatedObject(self, @selector(originalConstant));
    return [num floatValue];
}

-(void)storeConstant
{
    self.originalConstant = self.constant;
}

-(void)restoreConstant
{
    self.constant = self.originalConstant;
}
@end
