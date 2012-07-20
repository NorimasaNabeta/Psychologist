//
//  HappinessViewController.h
//  Happiness
//
//  Created by 式正 鍋田 on 12/07/10.
//  Copyright (c) 2012年 Norimasa Nabeta. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FaceView.h"
#import "SplitViewBarButtonItemPresenter.h"

@interface HappinessViewController : UIViewController <SplitViewBarButtonItemPresenter>

@property (nonatomic) int happiness; // 0 sad, 100 very happy

@end
