//
//  UIColor+OcastaStudios.m
//  Ocasta Studios
//
//  Created by chris birch on 30/04/2012.
//  Copyright (c) 2012 Ocasta Studios. All rights reserved.
//

#import "UIColor+Random.h"

@implementation UIColor (Random)



/**
 * From: http://compileyouidontevenknowyou.blogspot.co.uk/2010/06/random-colors-in-objective-c.html
 */
+(UIColor *)randomColour 
{
    CGFloat hue = ( arc4random() % 256 / 256.0 );  //  0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;  
    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
}

@end
