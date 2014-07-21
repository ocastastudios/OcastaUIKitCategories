//
//  UIAlertView+Localised.m
//  Ocasta Studios
//
//  Created by Chris Birch on 23/04/2014.
//  Copyright (c) 2014 OcastaStudios. All rights reserved.
//

#import "UIAlertView+Localised.h"

@implementation UIAlertView (Localised)


+(UIAlertView*)showAlertLocalisedWithTitle:(NSString *)titleLocalisedName message:(NSString *)messageLocalisedName delegate:(id /*<UIAlertViewDelegate>*/)delegate cancelButtonTitle:(NSString *)cancelButtonTitleLocalisedName otherButtonTitleLocalised:(NSString *)otherButtonTitle
{
    return [self showAlertLocalisedWithTitle:titleLocalisedName message:messageLocalisedName delegate:delegate cancelButtonTitle:cancelButtonTitleLocalisedName otherButtonTitleLocalised:otherButtonTitle andTag:0];
}

+(UIAlertView*)showAlertLocalisedWithTitle:(NSString *)titleLocalisedName message:(NSString *)messageLocalisedName delegate:(id /*<UIAlertViewDelegate>*/)delegate cancelButtonTitle:(NSString *)cancelButtonTitleLocalisedName otherButtonTitleLocalised:(NSString *)otherButtonTitle andTag:(NSInteger)tag
{
    NSString* strTitle = NSLocalizedString(titleLocalisedName, @"No description");
    NSString* strMessage = NSLocalizedString(messageLocalisedName, @"No description");
    NSString* strCancel = NSLocalizedString(cancelButtonTitleLocalisedName, @"No description");
    NSString* strOther = NSLocalizedString(otherButtonTitle, @"No Desciprtion");
    
    if ([strOther isEqualToString:@""])
        strOther = nil;
    UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:strTitle message:strMessage delegate:delegate cancelButtonTitle:strCancel otherButtonTitles:strOther, nil];
    alertView.tag = tag;
    [alertView show];
    
    return alertView;
}

+(UIAlertView*)showAlertLocalisedWithTitle:(NSString *)titleLocalisedName message:(NSString *)messageLocalisedName delegate:(id /*<UIAlertViewDelegate>*/)delegate cancelButtonTitle:(NSString *)cancelButtonTitleLocalisedName otherButtonTitleLocalised:(NSString *)otherButtonTitle andLastButtonTitle:(NSString *)otherButtonTitle2
{
    NSString* strTitle = NSLocalizedString(titleLocalisedName, @"No description");
    NSString* strMessage = NSLocalizedString(messageLocalisedName, @"No description");
    NSString* strCancel = NSLocalizedString(cancelButtonTitleLocalisedName, @"No description");
    NSString* strOther = NSLocalizedString(otherButtonTitle, @"No Desciprtion");
    NSString* str2ndOther = NSLocalizedString(otherButtonTitle2, @"No Desciprtion");
    
    if ([strOther isEqualToString:@""])
        strOther = nil;
    
    UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:strTitle message:strMessage delegate:delegate cancelButtonTitle:strCancel otherButtonTitles:strOther, str2ndOther, nil];
    [alertView show];
    
    return alertView;
}



@end
