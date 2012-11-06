//
//  PMCustomKeyboard.h
//  PunjabiKeyboard
//
//  Created by Kulpreet Chilana on 7/31/12.
//  Copyright (c) 2012 Kulpreet Chilana. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

#define kAppName @"Punjabi Keyboard"
#define kFont [UIFont fontWithName:@"GurmukhiMN" size:20]
#define kAltLabel @"੧੨੩"
#define kReturnLabel @"ਅਗਲਾ"
#define kSpaceLabel @"ਖਾਲੀ ਥਾਂ"
#define kChar @[ @"◌ੌ", @"◌ੈ", @"◌ਾ", @"◌ੀ", @"◌ੂ", @"ਬ", @"ਹ", @"ਗ", @"ਦ", @"ਜ", @"ਡ", @"◌ੋ", @"◌ੇ", @"◌੍", @"ਿ◌", @"◌ੁ", @"ਪ", @"ਰ", @"ਕ", @"ਤ", @"ਚ", @"ਟ", @"◌ਂ", @"ੜ", @"ਮ", @"ਨ", @"ਵ", @"ਲ", @"ਸ", @"ਯ" ]
#define kChar_shift @[ @"ਔ", @"ਐ", @"ਆ", @"ਈ", @"ਊ", @"ਭ", @"ਙ", @"ਘ", @"ਧ", @"ਝ", @"ਢ", @"ਓ", @"ਏ", @"ਅ", @"ਇ", @"ਉ", @"ਫ", @"ੜ", @"ਖ", @"ਥ", @"ਛ", @"ਠ", @"◌ੰ", @"◌ੱ", @"ਣ", @"ਫ਼", @"ਜ਼", @"ਲ਼", @"ਸ਼", @"ਞ" ]
#define kChar_alt @[ @"੧", @"੨", @"੩", @"੪", @"੫", @"੬", @"੭", @"੮", @"੯", @"੦", @"ੴ", @"-", @"/", @":", @";", @"(", @")", @"$", @"₹", @"&", @"@", @"\"", @"ਖ਼", @"ਗ਼", @"।", @"॥", @".", @",", @"?", @"!" ]

@interface PMCustomKeyboard : UIView <UIInputViewAudioFeedback>

@property (strong, nonatomic) IBOutlet UIImageView *keyboardBackground;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *characterKeys;
@property (strong, nonatomic) IBOutlet UIButton *shiftButton;
@property (strong, nonatomic) IBOutlet UIButton *altButton;
@property (strong, nonatomic) IBOutlet UIButton *returnButton;
@property (strong, nonatomic) IBOutlet UIButton *deleteButton;
@property (strong) id<UITextInput> textView;
@property (strong, nonatomic) IBOutlet UIButton *spaceButton;

- (IBAction)returnPressed:(id)sender;
- (IBAction)characterPressed:(id)sender;
- (IBAction)shiftPressed:(id)sender;
- (IBAction)altPressed:(id)sender;
- (IBAction)deletePressed:(id)sender;
- (IBAction)unShift;
- (IBAction)spacePressed:(id)sender;

@end
