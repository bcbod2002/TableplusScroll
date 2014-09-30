//
//  SlideMenuItem.m
//  TableplusScroll
//
//  Created by shinsoft on 2013/12/17.
//  Copyright (c) 2013年 Goston. All rights reserved.
//

#import "SlideMenuItem.h"

@implementation SlideMenuItem

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        // Initialization code
    }
    return self;
}

// 初始化 Menu 的圖片、文字、Y軸的位子
- (id)initWithImage:(UIImage *)image and_lable:(NSString *)lable_string and_locate:(CGFloat)locate_y
{
    self = [super init];
    if (self)
    {
        [self setFrame:CGRectMake(0, locate_y, 320, 23.5)];
        [self setBackgroundColor:[UIColor blackColor]];
        image_view = [[UIImageView alloc] initWithFrame:CGRectMake(self.bounds.origin.x + 5, 0, self.bounds.size.height, self.bounds.size.height)];
        [self set_head_image:image];
        lable = [[UILabel alloc] initWithFrame:CGRectMake(self.bounds.origin.x + 40, self.bounds.size.height / 4, 160, 15)];
        [self set_lable_text:lable_string];
        [lable setTextColor:[UIColor whiteColor]];
        [lable setTextAlignment:UITextAlignmentLeft];
        [self addSubview:image_view];
        [self addSubview:lable];
    }
    tap_tag = NO;
    
    return self;
}

// 設定該 Item 的號碼牌
-(void)set_self_number:(NSInteger)number
{
    self_number = number;
}

// 設定該 Item 的 Tap tag
-(void)set_tap_tag:(BOOL)taptag
{
    tap_tag = taptag;
}

// 設定 Item 的 text
-(void)set_lable_text:(NSString *)string
{
    lable.text = string;
}

// 設定 Item 的 image
-(void)set_head_image:(UIImage *)image
{
    [image_view setImage:image];
}

// 回傳 Item 的 text
-(NSString *)get_lable_text
{
    return lable.text;
}

// 回傳 Item 的 image
-(UIImage *)get_image
{
    return image_view.image;
}

// 畫面觸碰開始
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.delegate gesture_tap_item:self_number];
}

// 畫面觸碰移動
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [[event allTouches] anyObject];
    CGPoint touchLocation = [touch locationInView:self.superview];
}

// 畫面觸碰結束
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
}

// 畫面觸碰取消
-(void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
