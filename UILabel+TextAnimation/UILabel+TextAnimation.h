//
//  UILabel+TextAnimation.h
//  Ocasta Studios
//
//  Created by Chris Birch on 15/07/2014.
//  Copyright (c) 2014 Ocasta Studios. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (TextAnimation)

/**
 * Animates the text of the specified label
 */
-(void)updateText:(NSString*)text andColour:(UIColor*)colour andTime:(NSTimeInterval) delay;

/**
 * Animates the text of the specified label
 */
-(void)updateText:(NSString*)text andColour:(UIColor*)colour;


/**
 * Animates the text of the specified label
 */
-(void)updateText:(NSString*)text;

/**
 * Animates the text of the specified label
 */
-(void)updateTextWithLocalString:(NSString*)localStringName;

/**
 * Animates the text of the specified label
 */
-(void)updateTextWithLocalString:(NSString*)localStringName andColour:(UIColor*)colour;
@end
