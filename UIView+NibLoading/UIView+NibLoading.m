//
//  UIView+NibLoading.m
//
//  http://stackoverflow.com/a/10934581/1027452
//

#import "UIView+NibLoading.h"

@implementation UIView (NibLoading)

+ (id)loadInstanceFromNib
{
    UIView *result;

    NSArray* elements = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil];
    
    for (id anObject in elements) {
        if ([anObject isKindOfClass:[self class]]) {
            result = anObject;
            break;
        }
    }
    
    return result;
}
@end
