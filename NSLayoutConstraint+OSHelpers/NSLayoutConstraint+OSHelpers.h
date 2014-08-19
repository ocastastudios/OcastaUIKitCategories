//
//  NSLayoutConstraint+OSHelpers.h
//  Ocasta Studios
//
//  Created by Chris Birch on 24/07/2014.
//  Copyright (c) 2014 Ocasta Studios. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSLayoutConstraint (OSHelpers)

/**
 * Stores the constant for use later. Useful when using constraints for dynamic UI's.
 */
@property(nonatomic,assign) CGFloat originalConstant;

/**
 * Assists when using constraints for dynamic UI's
 */
-(void)storeConstant;

/**
 * Restores the constant to the value stored in originalConstant
 */
-(void)restoreConstant;

@end
