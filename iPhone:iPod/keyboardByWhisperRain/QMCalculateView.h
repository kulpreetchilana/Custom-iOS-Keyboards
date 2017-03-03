//
//  QMCalculateView.h
//  MotherMoney
//
//  Created by WhisperRain on 16/7/6.
//  Copyright © 2016年 WhisperRain. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "QMProductInfo.h"
#import "MMNumberKeyboard.h"


@interface QMCalculateView : UIView<MMNumberKeyboardDelegate>



- (id)initWithFrame:(CGRect)frame andProductInfo:(NSString *)info;

- (void)show;

- (void)hide;

@property(nonatomic,strong)NSString *productInfo;

@end
