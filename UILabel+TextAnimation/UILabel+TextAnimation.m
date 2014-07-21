//
//  UILabel+TextAnimation.m
//  Ocasta Studios
//
//  Created by Chris Birch on 15/07/2014.
//  Copyright (c) 2014 Ocasta Studios. All rights reserved.
//

#import "UILabel+TextAnimation.h"

#define DEFAULT_ANI_TIME 0.5


@implementation UILabel (TextAnimation)

-(void)updateText:(NSString*)text andColour:(UIColor*)colour
{
    [self updateText:text andColour:colour andTime:DEFAULT_ANI_TIME];
}

-(void)updateText:(NSString *)text
{
    [self updateText:text andColour:self.textColor];
}

-(void)updateText:(NSString*)text andColour:(UIColor*)colour andTime:(NSTimeInterval) delay
{
    if (![self.text isEqualToString:text])
    {
        NSTimeInterval time=[self.text isEqualToString:@""] ? 0 : delay /2.0f;
        
        [UIView animateWithDuration:time animations:^{
            self.alpha = 0;
        } completion:^(BOOL finished) {
            self.text = text;
            self.textColor = colour;
            [UIView animateWithDuration:time animations:^{
                self.alpha = 1;
            }];
        }];
    }
}

-(void)updateTextWithLocalString:(NSString *)localStringName
{
    [self updateTextWithLocalString:localStringName andColour:self.textColor];
}

-(void)updateTextWithLocalString:(NSString *)localStringName andColour:(UIColor *)colour
{
    NSString* localString = NSLocalizedString(localStringName, @"");
    
    [self updateText:localString andColour:colour];
}

@end
