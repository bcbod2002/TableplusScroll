//
//  SlideMenuItem.h
//  TableplusScroll
//
//  Created by shinsoft on 2013/12/17.
//  Copyright (c) 2013年 Goston. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SlideMenuItem;
@protocol SlideMenuItemDelegate <NSObject>

@optional
//- (void)slidemenu_item_change_locate:(SlideMenuItem *)itemView;
- (void)gesture_tap_item:(NSInteger)item_number;
@end

typedef enum SlideState
{
    STATE_FULL_MENU,
    STATE_MAIN_MENU
}SlideState;

@interface SlideMenuItem : UIView <UIGestureRecognizerDelegate>
{
    UIImageView * image_view;
    UILabel *lable;
    NSMutableArray *all_menu_items;
    NSInteger self_number;
    BOOL tap_tag;
    float old_x, old_y;
}
@property (weak, nonatomic) id<SlideMenuItemDelegate>delegate;
//@property(strong , nonatomic)SlideMenuItem *item;
- (id)initWithImage:(UIImage *)image and_lable:(NSString *)lable_string and_locate:(CGFloat)locate_y;

-(void)set_tap_tag:(BOOL)taptag;
-(void)set_self_number:(NSInteger)number;
-(void)set_lable_text:(NSString *)string;
-(void)set_head_image:(UIImage *)image;

-(NSString *)get_lable_text;
-(UIImage *)get_image;
@end