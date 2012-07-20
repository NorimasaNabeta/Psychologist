//
//  HappinessViewController.m
//  Happiness
//
//  Created by 式正 鍋田 on 12/07/10.
//  Copyright (c) 2012年 Norimasa Nabeta. All rights reserved.
//

#import "HappinessViewController.h"

@interface HappinessViewController() <FaceViewDataSource>
@property (nonatomic, weak) IBOutlet FaceView *faceView;
@property (weak, nonatomic) IBOutlet UIToolbar *toolbar;
@end


@implementation HappinessViewController
@synthesize happiness=_happiness;
@synthesize faceView=_faceView;
@synthesize toolbar = _toolbar;
@synthesize splitViewBarButtonItem=_splitViewBarButtonItem;

- (void)setSplitViewBarButtonItem:(UIBarButtonItem *)splitViewBarButtonItem
{
    if (splitViewBarButtonItem != _splitViewBarButtonItem) {
        NSMutableArray *toolbarItems = [self.toolbar.items mutableCopy];
        if (_splitViewBarButtonItem) [toolbarItems removeObject:_splitViewBarButtonItem];
        if (splitViewBarButtonItem) [toolbarItems insertObject:splitViewBarButtonItem atIndex:0];
        self.toolbar.items = toolbarItems;
        _splitViewBarButtonItem = splitViewBarButtonItem;
    }
}

- (void)setHappiness:(int)happiness
{
    _happiness = happiness;
    [self.faceView setNeedsDisplay]; // any time our Model changes, redraw our View
}

- (void)setFaceView:(FaceView *)faceView
{
    _faceView = faceView;
    // enable pinch gestures in the FaceView using its pinch: handler
    [self.faceView addGestureRecognizer:[[UIPinchGestureRecognizer alloc] initWithTarget:self.faceView action:@selector(pinch:)]];
    [self.faceView addGestureRecognizer:[[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handleHappinessGesture:)]];  // gesture to modify our Model
    self.faceView.dataSource = self;

}
- (void)handleHappinessGesture:(UIPanGestureRecognizer *)gesture
{
    if ((gesture.state == UIGestureRecognizerStateChanged) ||
        (gesture.state == UIGestureRecognizerStateEnded)) {
        CGPoint translation = [gesture translationInView:self.faceView];
        self.happiness -= translation.y / 2;
        [gesture setTranslation:CGPointZero inView:self.faceView];
    }
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    return YES; // support all orientations
}

// 
- (float)smileForFaceView:(FaceView *)sender
{
    return (self.happiness - 50) / 50.0; // translate Model for View
}


- (void)viewDidUnload {
    [self setToolbar:nil];
    [super viewDidUnload];
}
@end
