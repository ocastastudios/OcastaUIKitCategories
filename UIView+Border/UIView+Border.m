//
//  UIView+Border.m
//  Ocasta Studios
//
//  Created by Chris Birch on 08/04/2014.
//  Copyright (c) 2014 OcastaStudios. All rights reserved.
//

#import "UIView+Border.h"
#import <QuartzCore/QuartzCore.h>

@implementation UIView (Border)

-(void)setBorderColour:(UIColor*)borderColour
{
    self.layer.borderColor = borderColour.CGColor;
}
-(CGFloat)cornerRadius
{
    return self.layer.cornerRadius;
}

-(void)setCornerRadius:(CGFloat)cornerRadius
{
    self.layer.cornerRadius = cornerRadius;
}

-(UIColor*)borderColour
{
    return [UIColor colorWithCGColor:self.layer.borderColor];
}


-(void)setBorderWidth:(CGFloat)borderWidth
{
    self.layer.borderWidth = borderWidth;
    
}

-(CGFloat)borderWidth
{
    return self.layer.borderWidth;
}
@end
