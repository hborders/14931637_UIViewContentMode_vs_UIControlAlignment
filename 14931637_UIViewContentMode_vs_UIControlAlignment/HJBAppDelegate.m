//
//  HJBAppDelegate.m
//  14931637_UIViewContentMode_vs_UIControlAlignment
//
//  Created by Heath Borders on 9/6/13.
//  Copyright (c) 2013 Heath Borders. All rights reserved.
//

#import "HJBAppDelegate.h"

@interface HJBViewController : UIViewController

@property (nonatomic) UIButton *leftContentModeButton;
@property (nonatomic) UIButton *leftContentHorizontalAlignmentButton;
@property (nonatomic) UIButton *topContentModeButton;
@property (nonatomic) UIButton *topContentVerticalAlignmentButton;

@end

@implementation HJBAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = [HJBViewController new];
    
    [self.window makeKeyAndVisible];
    return YES;
}

@end

@implementation HJBViewController

- (void)loadView {
    [super loadView];
    
    self.leftContentModeButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.leftContentModeButton.backgroundColor = [UIColor redColor];
    self.leftContentModeButton.autoresizingMask =
    UIViewAutoresizingFlexibleBottomMargin |
    UIViewAutoresizingFlexibleWidth;
    self.leftContentModeButton.contentMode = UIViewContentModeLeft;
    self.leftContentModeButton.titleLabel.backgroundColor = [UIColor orangeColor];
    [self.leftContentModeButton setTitle:@"CMLeft"
                                forState:UIControlStateNormal];
    [self.view addSubview:self.leftContentModeButton];
    
    self.leftContentHorizontalAlignmentButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.leftContentHorizontalAlignmentButton.backgroundColor = [UIColor yellowColor];
    self.leftContentHorizontalAlignmentButton.autoresizingMask =
    UIViewAutoresizingFlexibleBottomMargin |
    UIViewAutoresizingFlexibleWidth;
    self.leftContentHorizontalAlignmentButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    self.leftContentHorizontalAlignmentButton.titleLabel.backgroundColor = [UIColor greenColor];
    [self.leftContentHorizontalAlignmentButton setTitle:@"CHALeft"
                                               forState:UIControlStateNormal];
    [self.view addSubview:self.leftContentHorizontalAlignmentButton];
    
    self.topContentModeButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.topContentModeButton.backgroundColor = [UIColor blueColor];
    self.topContentModeButton.contentMode = UIViewContentModeTop;
    self.topContentModeButton.titleLabel.backgroundColor = [UIColor purpleColor];
    [self.topContentModeButton setTitle:@"CMTop"
                               forState:UIControlStateNormal];
    [self.view addSubview:self.topContentModeButton];
    
    self.topContentVerticalAlignmentButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.topContentVerticalAlignmentButton.backgroundColor = [UIColor brownColor];
    self.topContentVerticalAlignmentButton.contentVerticalAlignment = UIControlContentVerticalAlignmentTop;
    self.topContentVerticalAlignmentButton.titleLabel.backgroundColor = [UIColor grayColor];
    [self.topContentVerticalAlignmentButton setTitle:@"CHATop"
                                            forState:UIControlStateNormal];
    [self.view addSubview:self.topContentVerticalAlignmentButton];
    
    [self layoutButtons];
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    [self layoutButtons];
}

- (void)layoutButtons {    
    CGRect horizontalButtonsRect;
    CGRect verticalButtonsRect;
    CGRectDivide(self.view.bounds,
                 &horizontalButtonsRect,
                 &verticalButtonsRect,
                 floor(CGRectGetHeight(self.view.bounds) / 2),
                 CGRectMinYEdge);
    
    CGRect leftContentModeButtonFrame;
    CGRect leftContentHorizontalAlignmentButtonFrame;
    CGRectDivide(horizontalButtonsRect,
                 &leftContentModeButtonFrame,
                 &leftContentHorizontalAlignmentButtonFrame,
                 floor(CGRectGetHeight(horizontalButtonsRect) / 2),
                 CGRectMinYEdge);
    
    CGRect topContentModeButtonFrame;
    CGRect topContentVerticalAlignmentButtonFrame;
    CGRectDivide(verticalButtonsRect,
                 &topContentModeButtonFrame,
                 &topContentVerticalAlignmentButtonFrame,
                 floor(CGRectGetWidth(verticalButtonsRect) / 2),
                 CGRectMinXEdge);
    
    self.leftContentModeButton.frame = leftContentModeButtonFrame;
    self.leftContentHorizontalAlignmentButton.frame = leftContentHorizontalAlignmentButtonFrame;
    self.topContentModeButton.frame = topContentModeButtonFrame;
    self.topContentVerticalAlignmentButton.frame = topContentVerticalAlignmentButtonFrame;
}

@end
