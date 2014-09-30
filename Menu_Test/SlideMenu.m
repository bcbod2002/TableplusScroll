//
//  SlideMenu.m
//  TableplusScroll
//
//  Created by shinsoft on 2013/12/9.
//  Copyright (c) 2013年 Goston. All rights reserved.
//

#import "SlideMenu.h"

@implementation SlideMenu

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.userInteractionEnabled = YES;
        tap_tag = NO;
    }
    return self;
}

// 初始化 SlideMenu 的位置、圖片、Lable
- (id)initWithLocate:(SLide_Locate)Locate Item_images:(NSMutableArray *)item_images Item_labels:(NSMutableArray *)item_labels
{
    self = [super init];
    if (self && ([item_images count] == [item_labels count]))
    {
        self.userInteractionEnabled = YES;
        tap_tag = NO;
        menu_items = [[NSMutableArray alloc] init];
        // Initialization code
        
        
        for (NSInteger i = 0; i < [item_labels count]; ++i)
        {
            SlideMenuItem *item_view  = [[SlideMenuItem alloc] initWithImage:[UIImage imageNamed:[item_images objectAtIndex:i]] and_lable:[item_labels objectAtIndex:i] and_locate:0];
            item_view.delegate = self;
            [item_view set_self_number:i];
            [menu_items addObject:item_view];
            [item_view setAlpha:0];
            [self addSubview:item_view];
        }
        if (Locate == Locate_Top)
        {
            [self set_menu_top];
        }
        else
        {
            [self set_menu_buttom];
        }
    }
    else
    {
        NSLog(@"Image and Lable of Items of array of count are not [EQUAL]");
    }
    return self;
}

// 回傳 最頂部的文字
-(NSString *)top_item_is
{
    return [[menu_items objectAtIndex:0] get_lable_text];
}

// 設定 Menu Item在畫面上半部與正向排序
- (void)set_menu_top
{
    [self setFrame:CGRectMake(0, 20, 320, 25)];
    [self bubble_sort_items_obverse];
    [[menu_items objectAtIndex:0] setAlpha:1];
    locate_top_tag = YES;
}

// 設定 Menu Item在畫面下半部與反向排序
- (void)set_menu_buttom
{
//    [self setFrame:CGRectMake(0, (525 - ([menu_items count] * 25)), 320, ([menu_items count] * 25))];
    [self setFrame:CGRectMake(0, 525, 320, 25)];
    [self bubble_sort_items_reverse];
    [[menu_items objectAtIndex:[menu_items count] - 1] setAlpha:1];
    locate_top_tag = NO;
}

// 將選中的 Item 置頂
- (void)move_objectto_first:(NSInteger)number
{
    NSMutableArray *tmp_array = [[NSMutableArray alloc] initWithCapacity:[menu_items count]];
    
    if (locate_top_tag)
    {
        [tmp_array addObject:[menu_items objectAtIndex:number]];
        for (NSInteger i = 0;i < [menu_items count]; ++i)
        {
            if (i != number)
            {
                [tmp_array addObject:[menu_items objectAtIndex:i]];
            }
            
        }
        [menu_items removeAllObjects];
        menu_items = tmp_array;
        [self bubble_sort_items_obverse];
        [self.delegate touched_item_lable_text:[[menu_items objectAtIndex:0] get_lable_text]];
    }
    else
    {
        for (NSInteger i = 0;i < [menu_items count]; ++i)
        {
            if (i != number)
            {
                [tmp_array addObject:[menu_items objectAtIndex:i]];
            }
        }
        [tmp_array addObject:[menu_items objectAtIndex:number]];
        for (NSInteger i = 0; i < [menu_items count]; ++i)
        {
            [[tmp_array objectAtIndex:i] set_self_number:i];
        }
        [menu_items removeAllObjects];
        menu_items = tmp_array;
        [self bubble_sort_items_reverse];
        [self.delegate touched_item_lable_text:[[menu_items lastObject] get_lable_text]];
    }
}

// 排列除了置頂之外的 Items
-(void)bubble_sort_items_obverse
{
    SlideMenuItem *tmp_slidemenuitem;
    for (NSInteger i = 1; i < [menu_items count]; ++i)
    {
        for (NSInteger j = 1; j < [menu_items count] - 1; ++j)
        {
            if ([[[menu_items objectAtIndex:j] get_lable_text] compare:[[menu_items objectAtIndex:j + 1] get_lable_text]] == NSOrderedDescending)
            {
                tmp_slidemenuitem = [menu_items objectAtIndex:j + 1];
                [menu_items removeObjectAtIndex:j + 1];
                [menu_items insertObject:[menu_items objectAtIndex:j] atIndex:j + 1];
                [menu_items removeObjectAtIndex:j];
                [menu_items insertObject:tmp_slidemenuitem atIndex:j];
            }
        }
    }
    for (NSInteger i = 0; i < [menu_items count]; ++i)
    {
        [[menu_items objectAtIndex:i] set_self_number:i];
    }
}


// Goston ADD 12/26 Bubble Sort Reverse 有問題
// Goston ADD 12/26 Buttom 版的 view 會移動
// 排列除了置底之外的 Items
-(void)bubble_sort_items_reverse
{
    SlideMenuItem *tmp_slidemenuitem;
    for (NSInteger i = 0; i < [menu_items count] - 1; ++i)
    {
        for (NSInteger j = 0; j < [menu_items count] - 2; ++j)
        {
            if ([[[menu_items objectAtIndex:j] get_lable_text] compare:[[menu_items objectAtIndex:j + 1] get_lable_text]] == NSOrderedAscending)
            {
                tmp_slidemenuitem = [menu_items objectAtIndex:j + 1];
                [menu_items removeObjectAtIndex:j + 1];
                [menu_items insertObject:[menu_items objectAtIndex:j] atIndex:j + 1];
                [menu_items removeObjectAtIndex:j];
                [menu_items insertObject:tmp_slidemenuitem atIndex:j];
            }
        }
    }
    for (NSInteger i = 0; i < [menu_items count]; ++i)
    {
        [[menu_items objectAtIndex:i] set_self_number:i];
    }
}
/*-(NSMutableArray *)quicksort_items_without_top:(NSMutableArray *)array
{
    NSMutableArray *phony_array;
    NSString *tmp_string = [[NSString alloc] init];
    NSInteger head = 1;
    NSInteger tail = [array count] - 1;
    NSString *pivot = [[NSString alloc] initWithString:[array objectAtIndex:[array count] / 2]];

    for (NSInteger i = 1; i < [array count]; ++i)
    {
        for (NSInteger j = 1; j < [array count] - 1; ++j)
        {
            if ([[[array objectAtIndex:j] get_lable_text] compare:[array objectAtIndex:j + 1]] == NSOrderedDescending)
            {
                
                //            [array removeObjectAtIndex,:<#(NSUInteger)#>]
                
            }
        }
    }
    return array;
}*/

// 點選到的 Item 的狀態修改
-(void)gesture_tap_item:(NSInteger)item_number
{
    if (!tap_tag)
    {
        [self menu_items_extend];
        tap_tag = YES;
    }
    else
    {
        [self menu_itens_shrink:item_number];
        tap_tag = NO;
    }
}

// Menu Items 展開
- (void)menu_items_extend
{
    [UIView animateWithDuration:0.4 delay:0 options:(UIViewAnimationOptionBeginFromCurrentState | UIViewAnimationOptionTransitionCrossDissolve | UIViewAnimationOptionCurveEaseIn)
    animations:^{
        for (NSInteger i = 0; i < [menu_items count]; ++i)
        {
            [[menu_items objectAtIndex:i] setFrame:CGRectOffset([[menu_items objectAtIndex:i] frame], 0, i * 25)];
            [[menu_items objectAtIndex:i] setAlpha:1];
        }
        if (locate_top_tag)
        {
            
            [self setFrame:CGRectMake(0, 20, 320, ([menu_items count] * 25))];
        }
        else
        {
            [self setFrame:CGRectMake(0, (525 - (([menu_items count] - 1) * 25)), 320, ([menu_items count] * 25))];
        }
    }completion:^(BOOL finished){/*NSLog(@"EXTEND");*/}];
}

// Menu Items 收縮
-(void)menu_itens_shrink:(NSInteger)item_number
{
    [UIView animateWithDuration:0.4 delay:0 options:(UIViewAnimationOptionBeginFromCurrentState | UIViewAnimationOptionTransitionCrossDissolve | UIViewAnimationOptionCurveEaseIn)
    animations:^{
        for(NSInteger i = 0;i < [menu_items count];++i)
        {
            [[menu_items objectAtIndex:i] setFrame:CGRectOffset([[menu_items objectAtIndex:i] frame], 0, i * (-25))];
            [[menu_items objectAtIndex:i] setAlpha:0];
            [[menu_items objectAtIndex:item_number] setAlpha:1];
        }
        if (locate_top_tag)
        {
            [self setFrame:CGRectMake(0, 20, 320, 25)];
        }
        else
        {
            [self setFrame:CGRectMake(0, 525, 320, 25)];
        }

    }
    completion:^(BOOL finished)
    {/*NSLog(@"SHRINK");*/
        [self move_objectto_first:item_number];
    }];
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