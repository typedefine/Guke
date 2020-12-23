//
//  ZXFInputField.m
//  GuKe
//
//  Created by saas on 2020/12/21.
//  Copyright © 2020 shangyukeji. All rights reserved.
//

#import "ZXFInputField.h"

@interface ZXFInputField ()<UITextFieldDelegate>

@property(nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *placeholder;
@property(nonatomic, copy) void (^ completion)(NSString *text);
@property (nonatomic, strong) UITextField *textField;
@property(nonatomic, strong) UILabel *leftLabel;

@end

@implementation ZXFInputField

- (instancetype)init
{
    if (self = [super init]) {
        [self setUp];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    if (self = [super initWithCoder:coder]) {
        [self setUp];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setUp];
    }
    return self;
}

- (void)setUp
{
    self.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.textField];
    [self.textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
    self.textField.leftView = self.leftLabel;
}

- (void)configWithTitle:(NSString *)title
            placeholder:(NSString *)placeholder
             completion:(void (^)(NSString *text))completion
{
    if (title.isValidStringValue) {
        self.title = title;
    }
    
    if (placeholder.isValidStringValue) {
        self.placeholder = placeholder;
    }
    
    if (placeholder.isValidStringValue) {
        self.textField.placeholder = placeholder;
    }
    self.completion = [completion copy];
    
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    if (self.completion) {
        self.completion(textField.text);
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.textField resignFirstResponder];
//    [self.textField endEditing:YES];
    return YES;
}


- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    return YES;
}


- (UITextField *)textField
{
    if (!_textField) {
        _textField = [[UITextField alloc] init];
        _textField.textColor = detailTextColor;
        
        _textField.delegate = self;
    }
    return _textField;
}

- (void)setPlaceholder:(NSString *)placeholder
{
    _placeholder = placeholder;
    self.textField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:placeholder attributes:@{
        NSFontAttributeName : [UIFont systemFontOfSize:15 weight:UIFontWeightRegular],
        NSForegroundColorAttributeName:[UIColor colorWithHex:0xD0D0D0]
    }];
}

- (void)setTitle:(NSString *)title
{
    _title = title;
    self.leftLabel.text = title;
}

- (UILabel *)leftLabel
{
    if (!_leftLabel) {
        _leftLabel = [[UILabel alloc] init];
        _leftLabel.textColor = [UIColor colorWithHex:0x3C3E3D];
        _leftLabel.font = [UIFont systemFontOfSize:15 weight:UIFontWeightRegular];
    }
    return _leftLabel;
}


@end