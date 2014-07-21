//
//  UIView+Alignment.h
//  Ocasta Studios
//
//  Created by chris birch on 02/05/2012.
//  Copyright (c) 2012 Ocasta Studios. All rights reserved.
//

/**
 * Category on UIView to make relative positioning views easy.
 * Contains properties that provide direct access to view frame properties such as x & y, etc
 * Provides methods that allows the current view to be aligned with another view.
 */

#import <UIKit/UIKit.h>

/**
 * Contains flags that specify the way in which the current view should be aligned with the source view.
 * Some flags are mutualy exclusive and cannot be used together. These flags are grouped in sections together.
 */
typedef enum
{
    /**
     * Specifies that only fine tuning offsets are applied to size and location.
     */
    ViewRepositioningNone = 0,
    
    //######################################################
    // Horizontal sizing: One of these only at a time ######
    //######################################################
    
    /**
     * Specifies that the target view will be resized to have the same width as the source view
     */
    ViewRepositioningMatchWidth = 1 << 0,
    /**
     * Specifies that the target view will be resized to have half the width of the source view
     */
    ViewRepositioningHalfWidth = 1 << 1,
    /**
     * Specifies that the target view's width will be resized to the value specified by the fineTuningSizeOffset param
     */
    ViewRepositioningTreatSizeOffsetAsAbsoluteWidth = 1 << 2,

    
    
    //######################################################
    // Vertical sizing: One of these only at a time ########
    //######################################################
    
    /**
     * Specifies that the target view will be resized to have the same height as the source view
     */
    ViewRepositioningMatchHeight = 1 << 3,
    /**
     * Specifies that the target view will be resized to have half the height of the source view
     */
    ViewRepositioningHalfHeight = 1 << 4,
    /**
     * Specifies that the target view's height will be resized to the value specified by the fineTuningSizeOffset param
     */
    ViewRepositioningTreatSizeOffsetAsAbsoluteHeight = 1 << 5,
    
    
    
    //########################################################
    // Horizontal positioning: One of these only at a time ###
    //########################################################
    
    /**
     * Specifies that the target view's right edge will be aligned with the source view's left edge
     *
     * i.e:
     *           ###
     *           #S#
     *           ###
     *
     *      #####
     *      ##T##
     *      #####
     */
    ViewRepositioningAlignLeft = 1 << 6,
    /**
     * Specifies that the target view's left edge will be aligned with the source view's left edge
     *
     * i.e:
     *      ###
     *      #S#
     *      ###
     *
     *      #####
     *      ##T##
     *      #####
     */
    ViewRepositioningAlignLeftEdges = 1 << 7,
    
    /**
     * Specifies that the target view's left edge will be aligned with the source view's right edge
     *
     * i.e:
     *      ###
     *      #S#
     *      ###
     *
     *         #####
     *         ##T##
     *         #####
     */
    ViewRepositioningAlignRight = 1 << 8,
    
    /**
     * Specifies that the target view's right edge will be aligned with the source view's right edge
     *
     * i.e:
     *        ###
     *        #S#
     *        ###
     *
     *      #####
     *      ##T##
     *      #####
     */
    ViewRepositioningAlignRightEdges = 1 << 9,
    
    /**
     * Specifies that the target view's centre will be aligned with the source view's centre 
     *
     * i.e:
     *       ###
     *       #S#
     *       ###
     *
     *      #####
     *      ##T##
     *      #####
     */
    ViewRepositioningAlignCentreX = 1 << 10,

    
    
    //######################################################
    // Vertical positioning: One of these only at a time ###
    //######################################################
    
    /**
     * Specifies that the target view's top edge will be aligned with the source view's bottom edge 
     *
     * i.e:
     *      ###
     *      ###
     *      #S#
     *      ###
     *      ###
     *         ###
     *         #T#
     *         ###
     */
    ViewRepositioningAlignBelow = 1 << 11,
    
    /**
     * Specifies that the target view's bottom edge will be aligned with the source view's top edge 
     *
     * i.e:
     *         ###
     *         #T#
     *         ###
     *      ###
     *      ###
     *      #S#
     *      ###
     *      ###
     */
    ViewRepositioningAlignAbove = 1 << 12,
    

    /**
     * Specifies that the target view's top edge will be aligned with the source view's top edge 
     *
     * i.e:
     *         
     *      ### ###
     *      ### #T#
     *      #S# ###
     *      ###
     *      ###
     */
    ViewRepositioningAlignTopEdges = 1 << 13,

    /**
     * Specifies that the target view's bottom edge will be aligned with the source view's bottom edge 
     *
     * i.e:
     *         
     *      ### 
     *      ### 
     *      #S# ###
     *      ### #T#
     *      ### ###
     *
     */
    ViewRepositioningAlignBottomEdges = 1 << 14,
    
    /**
     * Specifies that the target view's centre will be aligned with the source view's centre 
     *
     * i.e:
     *         
     *      ### 
     *      ### ###
     *      #S# #T#
     *      ### ###
     *      ###
     */
    ViewRepositioningAlignCentreY = 1 << 15,
    
  
    //###################################################################################
    // Convenience flags: Must take into account the mutaly exclusive component flags ###
    //###################################################################################
    
    
    /**
     * Specifies that the target view's size (both width and height) will be resized to the value specified by the fineTuningSizeOffset param
     */
    ViewRepositioningTreatSizeOffsetAsAbsoluteWidthAndHeight = ViewRepositioningTreatSizeOffsetAsAbsoluteHeight | ViewRepositioningTreatSizeOffsetAsAbsoluteWidth,
    
    /**
     * Specifies that this views centre position will be aligned with the target centre
     */
    ViewRepositioningAlignCentres = ViewRepositioningAlignCentreX | ViewRepositioningAlignCentreY,
    
    /**
     * Specifies that this view will be resized to match the size of the target view
     */
    ViewRepositioningMatchSize = ViewRepositioningMatchHeight | ViewRepositioningMatchWidth,
    
    /**
     * Specifies that this view will be resized to half the size of the target view
     */
    ViewRepositioningHalfSize = ViewRepositioningHalfWidth | ViewRepositioningHalfHeight
    
    

    
} ViewRepositioning;

@interface UIView (Alignment)


//###############################################s###################################
// Properties for making easy changes to dimensions/location of a view ##############
// No more CGRect frame = self.frame; frame.origin.x = 99;self.frame = frame :) #####
//###################################################################################

@property(nonatomic,assign) CGFloat x;
@property(nonatomic,assign) CGFloat y;
@property(nonatomic,assign) CGFloat width;
@property(nonatomic,assign) CGFloat height;
@property(nonatomic,assign) CGSize size;
@property(nonatomic,assign) CGPoint location;
@property(nonatomic,assign) CGFloat right;
@property(nonatomic,assign) CGFloat bottom;

/**
 * Changes the current views frame in relation to the specified view
 */
-(void)alignWithView:(UIView*) sourceView usingFlags: (ViewRepositioning) techniques;

/**
 * Changes the current views frame in relation to the specified view.
 * After techniques have been applied, the frame can be fine tuned using the offset and size params which
 * are summed with the resulting origin and size of the views frame.
 * The size of the view can be set exactly by specifying the ViewRepositioningTreatSizeOffsetAsAbsolute(Width/Height) flag.
 * If this flag is not specified, then the sizeOffset parameter is summed with the view's current size.
 */
-(void)alignWithView:(UIView*) sourceView usingFlags: (ViewRepositioning) techniques andFineTuningOffset: (CGPoint) offset andFineTuningSizeOffset:(CGSize) sizeOffset;



/**
 * Positions and sizes a view to the fit inside the specified rect.
 * Specify values that describe the margins that seperate the frame of the child view from the specified rect
 */
-(void)alignInsideRect:(CGRect)rect withLeftMargin:(CGFloat)leftMargin andTop:(CGFloat)topMargin andRight:(CGFloat)rightMargin andBottom:(CGFloat)bottomMargin;


/**
 * Positions and sizes a view to the position and size of the specified view. Specify values that describe the margins that seperate the inner view from the outer view
 */
-(void)alignInsideView:(UIView*)view withLeftMargin:(CGFloat)leftMargin andTop:(CGFloat)topMargin andRight:(CGFloat)rightMargin andBottom:(CGFloat)bottomMargin;

/**
 * Positions and sizes a view to the position and size of the parent view.
 * Specify values that describe the margins that seperate the frame of the child view from the frame of the parent view
 */
-(void)alignInsideSuperViewWithLeftMargin:(CGFloat)leftMargin andTop:(CGFloat)topMargin andRight:(CGFloat)rightMargin andBottom:(CGFloat)bottomMargin;

/**
 * Offsets the four sides of the view by the specified amounts.
 * If negative values are specified, the view's size will be reduced.
 * If Positive values are specified, the view's size will increased.
 * Can be used to create a margin between views.
 */
-(void)inflateLeft:(CGFloat)left andTop:(CGFloat)top andRight:(CGFloat)right andBottom:(CGFloat)bottom;

/**
 * Offsets the four sides of the view by the same amount.
 * If negative value is specified, the view's size will be reduced.
 * If Positive value is specified, the view's size will increased.
 * Can be used to create a margin between views.
 */
-(void)inflateByAmount:(CGFloat)amount;



@end
