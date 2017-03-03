//
//  QMCalculateView.m
//  MotherMoney
//
//  Created by WhisperRain on 16/7/6.
//  Copyright © 2016年 WhisperRain. All rights reserved.
//
#define WIDTH [UIScreen mainScreen].bounds.size.width
#define HEIGHT [UIScreen mainScreen].bounds.size.height
#define PingFangFontOfSize(siz) [UIFont fontWithName:@"PingFangSC-Regular" size:siz];
#define UIColorFromHexToRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#import "QMCalculateView.h"

@implementation QMCalculateView
{
    UIView *containerView;
    CGFloat normalTopPadding;
    UITextField *textField;
    MMNumberKeyboard *keyboard;
    
    UILabel * _rewardLabel;
    UILabel * _subrewardLabel;
    UILabel * _tipLabel;
    UIButton *shutBtn;
    UIView *connectView;
    
}


-(id)initWithFrame:(CGRect)frame andProductInfo:(NSString *)info
{
    self = [super initWithFrame:frame];
    if (self) {
        _productInfo=info;
        
        normalTopPadding = 90.0;
        self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.4f];
        
        // container view
        containerView = [[UIView alloc] init];
        containerView.userInteractionEnabled = YES;
        containerView.frame = CGRectMake(0, HEIGHT+45, WIDTH, 416.0f);
        [self addSubview:containerView];
        containerView.backgroundColor=[UIColor whiteColor];
        
        shutBtn=[UIButton  buttonWithType:UIButtonTypeCustom];
        shutBtn.frame=CGRectMake(WIDTH-50, HEIGHT, 28, 28);
        [shutBtn setBackgroundImage:[UIImage imageNamed:@"关闭"] forState:UIControlStateNormal];
        [shutBtn addTarget:self action:@selector(hide) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:shutBtn];
        
        connectView=[[UIView alloc]initWithFrame:CGRectMake(WIDTH-37, HEIGHT+28, 2, 18)];
        connectView.backgroundColor=[UIColor whiteColor];
        [self addSubview:connectView];
        
        // Create and configure the keyboard.
        keyboard = [[MMNumberKeyboard alloc] initWithFrame:CGRectZero];
        keyboard.allowsDecimalPoint = YES;
        keyboard.delegate = self;
        
        UIImageView *backImage=[[UIImageView alloc]initWithFrame:CGRectMake(43, 41, WIDTH-86, 45)];
        backImage.layer.cornerRadius=5;
        backImage.layer.borderColor=UIColorFromHexToRGB(0x999999).CGColor;
        backImage.layer.borderWidth=0.5;
        [containerView addSubview:backImage];
        
        // Configure an example UITextField.
        textField = [[UITextField alloc] initWithFrame:CGRectMake(15, 14.5, WIDTH-86-30, 16)];
        textField.inputView = keyboard;
        textField.placeholder = @"请输入理财金额 (元)";
        textField.font = PingFangFontOfSize(15);
        textField.textColor=UIColorFromHexToRGB(0x999999);
        textField.textAlignment=NSTextAlignmentLeft;
        [backImage addSubview:textField];
        
        _rewardLabel=[[UILabel alloc]initWithFrame:CGRectMake((WIDTH-74)/2.0, 103, 60, 26)];
        _rewardLabel.textAlignment=NSTextAlignmentRight;
        _rewardLabel.text=@"0.00";
        _rewardLabel.font=PingFangFontOfSize(26);
        _rewardLabel.textColor=UIColorFromHexToRGB(0xfdb83c);
        [containerView addSubview:_rewardLabel];
        
        
        _subrewardLabel=[[UILabel alloc]initWithFrame:CGRectMake((WIDTH-74)/2.0+60+2, 113, 12, 12)];
        _subrewardLabel.textAlignment=NSTextAlignmentLeft;
        _subrewardLabel.text=@"元";
        _subrewardLabel.font=PingFangFontOfSize(12);
        _subrewardLabel.textColor=UIColorFromHexToRGB(0x999999);
        [containerView addSubview:_subrewardLabel];


        _tipLabel=[[UILabel alloc]initWithFrame:CGRectMake(0,155, WIDTH, 12)];
        _tipLabel.textAlignment=NSTextAlignmentCenter;
        _tipLabel.text=@"此收益结果仅供参考，不代表实际收益";
        _tipLabel.textColor=UIColorFromHexToRGB(0x999999);
        _tipLabel.font=PingFangFontOfSize(12);
        [containerView addSubview:_tipLabel];
        
    }
    return self;
}

#pragma mark - MMNumberKeyboardDelegate.
- (BOOL)numberKeyboardShouldReturn:(MMNumberKeyboard *)numberKeyboard
{
    // Do something with the done key if neeed. Return YES to dismiss the keyboard.
    return YES;
}

-(BOOL)numberKeyboard:(MMNumberKeyboard *)numberKeyboard shouldInsertText:(NSString *)text{
    
    if ([text isEqualToString:@"."]&&[textField.text containsString:@"."]) {
        return NO;
    }
    else if([textField.text length]>10)
    {
        _tipLabel.text=@"输入数值超出范围";
        return NO;
    }
    else
    {
        if([textField.text hasPrefix:@"."]&&([textField.text length]==1))
        {
            textField.text=@"0.";
        }
      
          return YES;
    }
    
}

-(void)updateTextContent{
    float currentInvest=[textField.text floatValue];
    double rewardValue=currentInvest*([_productInfo  floatValue])*180/36500;
    _rewardLabel.text=[NSString stringWithFormat:@"%.2lf",rewardValue];
    
    if (_rewardLabel.text.length>3) {
        float temp= 15*_rewardLabel.text.length+8;
        if (temp>WIDTH-18) {
            temp=WIDTH-18;
        }
        float xValue=(WIDTH-temp-14)/2.0;
        
        _rewardLabel.frame=CGRectMake(xValue, 103,temp, 26);
        _subrewardLabel.frame=CGRectMake(xValue+temp+2, 113, 12, 12);
    }
    
    if([textField.text length]<10){
        _tipLabel.text=@"此收益结果仅供参考，不代表实际收益";
    }
    
 }

- (void)show {
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    [keyWindow addSubview:self];
    CGRect frame = containerView.frame;
    
    [textField becomeFirstResponder];
    [UIView animateWithDuration:0.289f animations:^{
       containerView.frame = CGRectMake(0, HEIGHT-416, WIDTH, 416.0f);
       shutBtn.frame=CGRectMake(WIDTH-50, HEIGHT-416.0-45, 28, 28);
    connectView.frame=CGRectMake(WIDTH-37, HEIGHT-416.0-18, 2, 18);
    } completion:^(BOOL finished) {
    }];
}

- (void)hide {
    CGRect frame = containerView.frame;
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    NSLog(@"commit");
    
    [textField resignFirstResponder];
    [UIView animateWithDuration:0.3f animations:^{
        containerView.frame = CGRectMake(0, HEIGHT+45, WIDTH, 416.0f);
        shutBtn.frame=CGRectMake(WIDTH-50, HEIGHT, 28, 28);
        connectView.frame=CGRectMake(WIDTH-37, HEIGHT+28, 2, 18);
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

@end
