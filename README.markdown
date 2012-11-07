Custom Keyboards for iOS
=========

#### An easily customizable iOS keyboard ####

Custom Keyboards for iOS allows you to create a keyboard `inputView` that looks and feels just like the iPad or iPhone/iPod touch keyboard. It is particularly useful for developers who are looking to add keyboard input for language that is not natively supported by iOS. The included example project is for a Punjabi keyboard.

## Installation & Usage

### Setup

Add the `iPad` and/or `iPhone:iPod` directory to your target in Xcode. `PKCustomKeyboard.h` contains all of the customizable constants for the iPad keyboard. `PMCustomKeyboard.h` contains all of the customizable constants for the iPhone/iPod touch keyboard. Characters in the `kChar` array can start or end with ◌ (U+25CC) and the ◌ will not appear when inputted into the textView. This is particularly useful for diacritical characters.

Make sure to import `PKCustomKeyboard.h` and `PMCustomKeyboard.h` into your view controller's header file.

### Usage
Insert the following into the `viewDidLoad` of your view controller or wherever else you see fit. You can `setTextView` to any `UITextView` or `UITextField` that you want the keyboard to appear for.

```objective-c

if ( UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone )
    {
        PMCustomKeyboard *customKeyboard = [[PMCustomKeyboard alloc] init];
        [customKeyboard setTextView:self.textView];
        
    }
    else {
        PKCustomKeyboard *customKeyboard = [[PKCustomKeyboard alloc] init];
        [customKeyboard setTextView:self.textView];
    }

```

## License
Copyright (c) 2012 Kulpreet Chilana

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the 'Software'), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
