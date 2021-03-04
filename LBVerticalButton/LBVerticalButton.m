//
//  LBVerticalButton.m
//  PerpetualCalendar
//
//  Created by 刘彬 on 2019/7/23.
//  Copyright © 2019 BIN. All rights reserved.
//

#import "LBVerticalButton.h"

@interface LBVerticalButton()
@end

@implementation LBVerticalButton
- (instancetype)init
{
    return [self initWithFrame:CGRectZero];
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.lineSpacing = 5;
        
        UIButton *badgeButton = [[UIButton alloc] init];
        badgeButton.hidden = YES;
        badgeButton.clipsToBounds = YES;
        badgeButton.titleLabel.font = [UIFont systemFontOfSize:11];
        [badgeButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        badgeButton.backgroundColor = [UIColor redColor];
        [self addSubview:badgeButton];
        _badgeButton = badgeButton;
        
        [badgeButton.titleLabel addObserver:self forKeyPath:NSStringFromSelector(@selector(text)) options:NSKeyValueObservingOptionNew context:nil];
        [badgeButton.imageView addObserver:self forKeyPath:NSStringFromSelector(@selector(image)) options:NSKeyValueObservingOptionNew context:nil];
    }
    return self;
}
-(void)layoutSubviews{
    [super layoutSubviews];
    
    CGRect imageViewFrame = self.imageView.bounds;
    CGRect titleLabelFrame = self.titleLabel.bounds;
    CGFloat minY = (CGRectGetHeight(self.bounds)-(CGRectGetHeight(titleLabelFrame)+CGRectGetHeight(imageViewFrame)+self.lineSpacing))/2;
    imageViewFrame.origin.y = minY;
    imageViewFrame.origin.x = (CGRectGetWidth(self.bounds)-CGRectGetWidth(imageViewFrame))/2;
    
    titleLabelFrame.origin.x = (CGRectGetWidth(self.bounds)-CGRectGetWidth(titleLabelFrame))/2;
    titleLabelFrame.origin.y = CGRectGetMaxY(imageViewFrame)+self.lineSpacing;

    self.titleLabel.frame = titleLabelFrame;
    self.imageView.frame = imageViewFrame;
    
    CGRect badgeButtonFrame = self.badgeButton.bounds;
    self.badgeButton.layer.cornerRadius = CGRectGetHeight(badgeButtonFrame)/2;

    badgeButtonFrame.origin.x = CGRectGetMaxX(self.imageView.frame)-CGRectGetWidth(badgeButtonFrame)/2;
    badgeButtonFrame.origin.y = CGRectGetMinY(self.imageView.frame)-CGRectGetHeight(badgeButtonFrame)/2;
    
    self.badgeButton.frame = badgeButtonFrame;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    if (object == self.badgeButton.imageView){
        [self.badgeButton.imageView sizeToFit];
    }
    else if (object == self.badgeButton.titleLabel){
        [self.badgeButton.titleLabel sizeToFit];
    }
    self.badgeButton.hidden = (!CGRectIsEmpty(self.badgeButton.imageView.bounds) && !CGRectIsEmpty(self.badgeButton.titleLabel.bounds));

    CGRect badgeBtnFrame;
    badgeBtnFrame.size.height = MAX(CGRectGetHeight(self.badgeButton.imageView.bounds), CGRectGetHeight(self.badgeButton.titleLabel.bounds));
    
    badgeBtnFrame.size.width = CGRectGetWidth(self.badgeButton.imageView.bounds)+CGRectGetWidth(self.badgeButton.titleLabel.bounds);

    if (CGRectGetWidth(badgeBtnFrame) < 17) {
        badgeBtnFrame.size.width = 17;
    }
    if (CGRectGetHeight(badgeBtnFrame) < 17) {
        badgeBtnFrame.size.height = 17;
    }

    self.badgeButton.bounds = badgeBtnFrame;
    [self setNeedsLayout];
}

-(UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
    if (CGRectContainsPoint(self.badgeButton.frame, point)) {
        return self.badgeButton;
    }
    return [super hitTest:point withEvent:event];
}


-(void)dealloc{
    [self.badgeButton.titleLabel removeObserver:self forKeyPath:NSStringFromSelector(@selector(text))];
    [self.badgeButton.imageView removeObserver:self forKeyPath:NSStringFromSelector(@selector(image))];
}

@end
