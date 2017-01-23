//
//  UTViewController.m
//  iOS Custom Keyboards
//
//  Created by Kulpreet Chilana on 11/6/12.
//  Copyright (c) 2012 Kulpreet Chilana. All rights reserved.
//

#import "UTViewController.h"
#import "QMCalculateView.h"


@interface UTViewController ()

@end

@implementation UTViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    if ( UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone )
    {
        PMCustomKeyboard *customKeyboard = [[PMCustomKeyboard alloc] init];
        [customKeyboard setTextView:self.textView];
        
    }
    else {
        PKCustomKeyboard *customKeyboard = [[PKCustomKeyboard alloc] init];
        [customKeyboard setTextView:self.textView];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)showMyCustomKeyboard:(id)sender {
//    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    UIWindow *keyWindow = [[[UIApplication sharedApplication] delegate] window];
    QMCalculateView *calculator = [[QMCalculateView alloc] initWithFrame:keyWindow.bounds andProductInfo:@"8.5"];
    [calculator show];
    
    
}

- (IBAction)showKeyBoardOfIphone:(id)sender {
    UIWindow *keyWindow = [[[UIApplication sharedApplication] delegate] window];
    QMCalculateView *calculator = [[QMCalculateView alloc] initWithFrame:keyWindow.bounds andProductInfo:@"8.5"];
    [calculator show];
    
}




@end
