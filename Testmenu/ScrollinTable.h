//
//  MenuTest.h
//  TableplusScroll
//
//  Created by shinsoft on 2013/12/6.
//  Copyright (c) 2013年 Goston. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MenuTest : UIView <UITableViewDataSource, UITableViewDelegate>
{
    NSMutableArray *items_view;
    UITableView *tableview_items;
    CGFloat cell_height;
    
    CGFloat phony_view_width;
    CGFloat phony_view_height;
    CGFloat phony_view_x;
    CGFloat phony_view_y;
}


-(id)initWithFrame:(CGRect)frame CellHeiget:(NSInteger)Cell_Height Items:(NSMutableArray *)items;
-(void)set_view_inscrollview_size :(CGFloat)width and:(CGFloat)height;
-(void)set_view_inscrollview_locate :(CGFloat)x and:(CGFloat)y;
//@property (strong, nonatomic)
@end
