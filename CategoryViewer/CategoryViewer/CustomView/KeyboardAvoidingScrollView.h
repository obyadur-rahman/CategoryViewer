//
//  KeyboardAvoidingScrollView.h
//  CategoryViewer
//
//  Created by Obyadur Rahman on 2/11/14.
//  Copyright (c) 2014 IMpulse (BD) Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KeyboardAvoidingScrollView : UIScrollView

/**
 * Returns the currently active view.
 */
@property (nonatomic, readonly) UIView *activeTextView;

@end
