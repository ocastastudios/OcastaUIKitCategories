//
//  UIView+OcastaStudios.m
//  Ocasta Studios
//
//  Created by chris birch on 02/05/2012.
//  Copyright (c) 2012 Ocasta Studios. All rights reserved.
//

#import "UIView+Alignment.h"

@implementation UIView (Alignment)

#pragma mark -
#pragma mark Location & Dimension Easy access properties

-(CGFloat)x
{
    return self.frame.origin.x;
}

-(CGFloat)y
{
    return self.frame.origin.y;    
}


-(CGFloat)right
{
    return self.x + self.width;
}

-(CGFloat)bottom
{
    return self.y + self.height;
}

-(void)setRight:(CGFloat)right
{
    self.x = right - self.width;
}

-(void)setBottom:(CGFloat)bottom
{
    self.y = bottom - self.height;
}

-(void)setX:(CGFloat)x
{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

-(void)setY:(CGFloat)y
{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;    
}


-(CGFloat)width
{
    return self.frame.size.width;
}

-(CGFloat)height
{
    return self.frame.size.height;
}



-(void)setHeight:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;    
}

-(void)setWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;    
}

-(CGSize)size
{
    return self.frame.size;
}

-(CGPoint)location
{
    return self.frame.origin;
}

-(void)setSize:(CGSize)size
{
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;   
}

-(void)setLocation:(CGPoint)location
{
    CGRect frame = self.frame;
    frame.origin = location;
    self.frame = frame;  
}


#pragma mark -
#pragma mark Public methods


-(void) alignWithView:(UIView*) sourceView usingFlags: (ViewRepositioning) techniques
{
    [self alignWithView:sourceView usingFlags:techniques andFineTuningOffset:CGPointZero andFineTuningSizeOffset:CGSizeZero];
}


-(void) alignWithView:(UIView*) sourceView usingFlags: (ViewRepositioning) techniques andFineTuningOffset: (CGPoint) offset andFineTuningSizeOffset:(CGSize) sizeOffset
{
    CGRect rect = self.frame;
    CGRect srcRect = sourceView.frame;
  
    if (self.superview == sourceView)
    {
        //dont need to do anything as this view is continaed within the target view
    }
    if (sourceView.superview != self.superview)
        //Make sure src rect is described in the same coordinate system as target
        srcRect = [sourceView.superview convertRect:srcRect toView:self.superview];

    //Vertical Resizing
    if ((techniques & ViewRepositioningMatchHeight) == ViewRepositioningMatchHeight)
    {
        rect.size.height = srcRect.size.height;
    }
    else if ((techniques & ViewRepositioningHalfHeight) == ViewRepositioningHalfHeight)
    {
        rect.size.height = (srcRect.size.height/2.0f);        
    }
    else if ((techniques & ViewRepositioningTreatSizeOffsetAsAbsoluteHeight) == ViewRepositioningTreatSizeOffsetAsAbsoluteHeight)
    {
        rect.size.height = sizeOffset.height;
    }

    
    //Horizontal resizing
    if ((techniques & ViewRepositioningMatchWidth) == ViewRepositioningMatchWidth)
    {
        rect.size.width = srcRect.size.width;        
    }
    else if ((techniques & ViewRepositioningHalfWidth) == ViewRepositioningHalfWidth)
    {
        rect.size.width = (srcRect.size.width /2.0f);        
    }
    else if ((techniques & ViewRepositioningTreatSizeOffsetAsAbsoluteWidth) == ViewRepositioningTreatSizeOffsetAsAbsoluteWidth)
    {
        rect.size.width = sizeOffset.width;
    }

    
    //Now that we have finished resizing, fine tune the size if needed
    //We only do this if we are treating  the sizeOffset param as an offset rather than an absolute value (in which case it is applied above)
    if ((techniques & ViewRepositioningTreatSizeOffsetAsAbsoluteWidth) != ViewRepositioningTreatSizeOffsetAsAbsoluteWidth)
    {
        //we are treating the sizeOffset param as an offset
        rect.size.width += sizeOffset.width;
    }
    
    if ((techniques & ViewRepositioningTreatSizeOffsetAsAbsoluteHeight) != ViewRepositioningTreatSizeOffsetAsAbsoluteHeight)
    {
        //we are treating the sizeOffset as an offset 
        rect.size.height += sizeOffset.height;
    }
    
    //Repositioning top and bottom
    if ((techniques & ViewRepositioningAlignBelow) == ViewRepositioningAlignBelow)
    {
        rect.origin.y = CGRectGetMaxY(srcRect);
    }
    else if ((techniques & ViewRepositioningAlignAbove) == ViewRepositioningAlignAbove)
    {
        rect.origin.y = srcRect.origin.y - rect.size.height;
    }
    else if ((techniques & ViewRepositioningAlignTopEdges) == ViewRepositioningAlignTopEdges)
    {
        rect.origin.y = srcRect.origin.y;        
    }
    else if ((techniques & ViewRepositioningAlignCentreY) == ViewRepositioningAlignCentreY)
    {
        rect.origin.y = srcRect.origin.y + (srcRect.size.height - rect.size.height) / 2;        
    }
    else if ((techniques & ViewRepositioningAlignBottomEdges) == ViewRepositioningAlignBottomEdges)
    {
        float srcMaxY = CGRectGetMaxY(srcRect);        
        float srcHeight = srcRect.size.height;
        float targetHeight = self.frame.size.height;
        float difference = srcHeight - targetHeight;
        
        if (difference>0)
        {
            //source rect is bigger than target rect
            rect.origin.y = srcMaxY - rect.size.height;
        }
        else
        {
            //Source rect is smaller than target rect
            rect.origin.y = srcRect.origin.y + difference;
            
        }    
    }
    
    //repositiong left and right
    if ((techniques & ViewRepositioningAlignLeft) == ViewRepositioningAlignLeft)
    {
        rect.origin.x = srcRect.origin.x - rect.size.width;
    }
    else if ((techniques & ViewRepositioningAlignRight) == ViewRepositioningAlignRight)
    {
        rect.origin.x = CGRectGetMaxX(srcRect);        
    }
    else if ((techniques & ViewRepositioningAlignRightEdges) == ViewRepositioningAlignRightEdges)
    {
        float srcMaxX = CGRectGetMaxX(srcRect);        
        float srcWidth = srcRect.size.width;
        float targetWidth = self.frame.size.width;
        float difference = srcWidth - targetWidth;
        
        if (difference>0)
        {
            //source rect is bigger than target rect
            rect.origin.x = srcMaxX - rect.size.width;
        }
        else
        {
            //Source rect is smaller than target rect
            rect.origin.x = srcRect.origin.x + difference;
            
        }
    }
    else if ((techniques & ViewRepositioningAlignLeftEdges) == ViewRepositioningAlignLeftEdges)
    {
        rect.origin.x = srcRect.origin.x;   
    }
    else if ((techniques & ViewRepositioningAlignCentreX) == ViewRepositioningAlignCentreX)
    {
        rect.origin.x = srcRect.origin.x - (rect.size.width - srcRect.size.width) / 2;        
    }
    
    
    //Now perform fine tuning of the location
    rect.origin.x += offset.x;
    rect.origin.y += offset.y;

    self.frame = rect;
    
}


-(void)alignInsideRect:(CGRect)rect withLeftMargin:(CGFloat)leftMargin andTop:(CGFloat)topMargin andRight:(CGFloat)rightMargin andBottom:(CGFloat)bottomMargin
{
    rect.origin.x += leftMargin;
    rect.origin.y += topMargin;
    
    rect.size.height -= (topMargin+bottomMargin);
    rect.size.width -= (leftMargin+rightMargin);
    
    self.frame = rect;
}


-(void)alignInsideView:(UIView *)view withLeftMargin:(CGFloat)leftMargin andTop:(CGFloat)topMargin andRight:(CGFloat)rightMargin andBottom:(CGFloat)bottomMargin
{
    CGRect srcRect = view.frame;
    
    if (view.superview != self.superview)
        //Make sure src rect is described in the same coordinate system as target
        srcRect = [view.superview convertRect:srcRect toView:self.superview];

    
    [self alignInsideRect:srcRect withLeftMargin:leftMargin andTop:topMargin andRight:rightMargin andBottom:bottomMargin];
}

-(void)alignInsideSuperViewWithLeftMargin:(CGFloat)leftMargin andTop:(CGFloat)topMargin andRight:(CGFloat)rightMargin andBottom:(CGFloat)bottomMargin
{
    [self alignInsideView:self.superview withLeftMargin:leftMargin andTop:topMargin andRight:rightMargin andBottom:bottomMargin];
}


//-(CGPoint)convertPoint:(CGPoint) point InView: (UIView*) view
//{
//    if (view.superview == self.superview)
//    {
//        //We are dealing with a point that uses the same coordinate system as the current view
//        return point;
//    }
//    else
//    {
//        //We are dealing with a view that uses a foreign coordinate system (i.e is not contained by the same superview)
//        return [view convertPoint:point toView:self.superview];
//    }
//}

#pragma mark -
#pragma mark Inflate

-(void)inflateLeft:(CGFloat)left andTop:(CGFloat)top andRight:(CGFloat)right andBottom:(CGFloat)bottom
{
    if (left != 0)
    {
        self.width += left;
        self.x -= left;
        
    }
    
    if (top != 0)
    {
        self.height += top;
        self.y -= top;
    }
    
    if (right != 0)
    {
        self.width += right;

    }
    
    if (bottom != 0)
    {
        self.height += bottom;        
    }
}

-(void)inflateByAmount:(CGFloat)amount
{
    [self inflateLeft:amount andTop:amount andRight:amount andBottom:amount];
}

@end
