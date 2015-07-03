//
//  IImageView.h
//  HelloWorld
//
//  Created by Obyadur Rahman on 6/26/15.
//  Copyright (c) 2015 IMpulse BD Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IImageView : UIImageView <UIGestureRecognizerDelegate> {
    
@protected
    UIPinchGestureRecognizer *_pinchRecogniser;
    UIRotationGestureRecognizer *_rotateRecogniser;
    UIPanGestureRecognizer *_panRecogniser;
    UITapGestureRecognizer *_tapRecogniser;
}


- (void) reset;
- (void) resetWithAnimation:(BOOL)animation;

@end
