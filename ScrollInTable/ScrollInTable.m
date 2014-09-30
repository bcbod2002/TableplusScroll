//
//  ScrollInTable.m
//  TableplusScroll
//
//  Created by shinsoft on 2013/12/9.
//  Copyright (c) 2013年 Goston. All rights reserved.
//

#import "ScrollInTable.h"

@implementation ScrollInTable

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(id)initWithFrame:(CGRect)frame CellHeiget:(NSInteger)Cell_Height Items:(NSMutableArray *)items
{
    self = [super initWithFrame:frame];
    if (self)
    {
        // Initialization code
        self.frame = frame;
        items_view = [[NSMutableArray alloc] initWithArray:items];
        tableview_items = [[UITableView alloc] initWithFrame:frame style:UITableViewStylePlain];
        [tableview_items setSeparatorStyle:UITableViewCellSeparatorStyleNone];
        cell_height = Cell_Height;
        tableview_items.dataSource = self;
        tableview_items.delegate = self;
        [self addSubview:tableview_items];
        
        
        // 先初始化 必免沒有初始化就直接拿來用
        phony_view_x = 5;
        phony_view_y = 10;
        phony_view_width = 310;
        phony_view_height = 150;
        NSLog(@"%lu", (unsigned long)[items_view count]);
    }
    return self;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

-(void)set_view_inscrollview_size :(CGFloat)width and:(CGFloat)height
{
    phony_view_width = width;
    phony_view_height = height;
}
-(void)set_view_inscrollview_locate :(CGFloat)x and:(CGFloat)y
{
    phony_view_x = x;
    phony_view_y = y;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [items_view count];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell;
    cell = [[UITableViewCell alloc] init];
    
    UIScrollView *scroll_items = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 320, cell_height)];
    [scroll_items setContentSize:CGSizeMake(320 * [items_view count], cell_height)];
    [scroll_items setPagingEnabled:YES];
    [scroll_items setScrollsToTop:NO];
    
    CGFloat r, g, b;
    for (NSInteger i = 0; i < 5; ++i)
    {
        UIView *phony_view = [[UIView alloc] initWithFrame:CGRectMake(phony_view_x + (i * 320), phony_view_y, phony_view_width, phony_view_height)];
        r = (arc4random() % 10) / 10.0;  // Goston ADD Test
        g = (arc4random() % 10) / 10.0;  // Goston ADD Test
        b = (arc4random() % 10) / 10.0;  // Goston ADD Test
        [phony_view setBackgroundColor:[UIColor colorWithRed:r green:g blue:b alpha:0.5]];  // Goston ADD Test
        [phony_view.layer setCornerRadius:10.0];
        [scroll_items addSubview:phony_view];
    }
    
    [[cell contentView] addSubview:scroll_items];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return cell_height;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
