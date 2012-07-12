//
//  FaceView.h
//  Happiness
//
//  Created by 式正 鍋田 on 12/07/10.
//  Copyright (c) 2012年 Norimasa Nabeta. All rights reserved.
//

#import <UIKit/UIKit.h>


@class FaceView;  // forward declaration for use in @protocol
@protocol FaceViewDataSource
- (float)smileForFaceView:(FaceView *)sender;
@end



@interface FaceView : UIView

@property (nonatomic) CGFloat scale;

- (void)pinch:(UIPinchGestureRecognizer *)gesture;

// set this property to whatever object will provide this View's data
// usually a Controller using a FaceView in its View
@property (nonatomic, weak) IBOutlet id <FaceViewDataSource> dataSource;

@end
