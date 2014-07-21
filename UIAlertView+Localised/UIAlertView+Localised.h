//
//  UIAlertView+Localised.h
//  Ocasta Studios
//
//  Created by Chris Birch on 23/04/2014.
//  Copyright (c) 2014 OcastaStudios. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIAlertView (Localised)

+(UIAlertView*)showAlertLocalisedWithTitle:(NSString *)titleLocalisedName message:(NSString *)messageLocalisedName delegate:(id /*<UIAlertViewDelegate>*/)delegate cancelButtonTitle:(NSString *)cancelButtonTitleLocalisedName otherButtonTitleLocalised:(NSString *)otherButtonTitle;
+(UIAlertView*)showAlertLocalisedWithTitle:(NSString *)titleLocalisedName message:(NSString *)messageLocalisedName delegate:(id /*<UIAlertViewDelegate>*/)delegate cancelButtonTitle:(NSString *)cancelButtonTitleLocalisedName otherButtonTitleLocalised:(NSString *)otherButtonTitle andLastButtonTitle:(NSString *)otherButtonTitle2;

+(UIAlertView*)showAlertLocalisedWithTitle:(NSString *)titleLocalisedName message:(NSString *)messageLocalisedName delegate:(id /*<UIAlertViewDelegate>*/)delegate cancelButtonTitle:(NSString *)cancelButtonTitleLocalisedName otherButtonTitleLocalised:(NSString *)otherButtonTitle andTag:(NSInteger)tag;

@end
