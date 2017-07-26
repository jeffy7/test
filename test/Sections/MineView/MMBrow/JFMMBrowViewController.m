//
//  JFMMBrowViewController.m
//  test
//
//  Created by je_ffy on 2017/7/11.
//  Copyright © 2017年 je_ffy. All rights reserved.
//

#import "JFMMBrowViewController.h"
#import <BQMM/BQMM.h>
@interface JFMMBrowViewController ()<MMEmotionCentreDelegate>

@property (nonatomic, strong) UITextField *textField;
@property (nonatomic, strong) UIButton *button;
@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation JFMMBrowViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSString *appId = @"122498b955e1487bb4631c834db4c72b";
    NSString *appSecret = @"d4ea0db9a6074643bbfa866104d7fbcd";
    [[MMEmotionCentre defaultCentre] setAppId:appId secret:appSecret];
    [MMEmotionCentre defaultCentre].delegate = self;
    
    _textField = [[UITextField alloc] initWithFrame:CGRectMake(0, 64, FULL_SCREEN_WIDTH, 44)];
    _textField.layer.borderWidth = 0.50f;
    _textField.layer.borderColor = [UIColor redColor].CGColor;
    [self.view addSubview:_textField];
    
    _button = [[UIButton alloc] initWithFrame:CGRectMake(0, 110, 50, 50)];
    _button.layer.borderWidth = 0.50f;
    _button.layer.borderColor = [UIColor redColor].CGColor;
    [self.view addSubview:_button];
    [_button addTarget:self action:@selector(buttonPress) forControlEvents:UIControlEventTouchUpInside];

    _imageView =[[UIImageView alloc] initWithFrame:CGRectMake(100, 110, 100, 100)];
    _imageView.layer.borderWidth = 0.50f;
    _imageView.layer.borderColor = [UIColor redColor].CGColor;
    [self.view addSubview:_imageView];
    
}

- (void)buttonPress {
    _button.selected = !_button.selected;
    if (_button.selected) {
        
        //将输入框设为firstResponder
        if (!_textField.isFirstResponder) {
            [_textField becomeFirstResponder];
        }
        
        [[MMEmotionCentre defaultCentre] attachEmotionKeyboardToInput:_textField];
    }else {
        [[MMEmotionCentre defaultCentre] switchToDefaultKeyboard];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - emotion centre delegate

- (void)didSelectEmoji:(UIImage *)img data:(NSData *)data withCode:(NSString *)emojiCode{
    _imageView.image = img;
}

- (void)didSendWithInput:(UIResponder<UITextInput> *)input {
//    [self sendText:input.mmText];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
