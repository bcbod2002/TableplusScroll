
//  SlideMenu.h
//  TableplusScroll
//
//  Created by shinsoft on 2013/12/9.
//  Copyright (c) 2013年 Goston. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SlideMenuItem.h"

@class SlideMenu;
@protocol SlideMenuDelegate <NSObject>

@optional
-(void)touched_item_lable_text:(NSString *)chosen_item;
@end

typedef enum Slide_Locate
{
    Locate_Top,
    Locate_Buttom
} SLide_Locate;

@interface SlideMenu : UIView <SlideMenuItemDelegate>
{
    NSMutableArray *menu_items; 
    BOOL tap_tag;
    BOOL locate_top_tag;
}
@property (weak, nonatomic) id<SlideMenuDelegate>delegate;

- (id)initWithLocate:(SLide_Locate)Locate Item_images:(NSMutableArray *)item_images Item_labels:(NSMutableArray *)item_labels;
-(void)menu_items_extend;
-(void)menu_itens_shrink;
@end
