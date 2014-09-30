//
//  MainViewController.h
//  TableplusScroll
//
//  Created by shinsoft on 2013/12/3.
//  Copyright (c) 2013年 Goston. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PagedFlowView.h"
#import "SlideMenu.h"

@interface MainViewController : UIViewController <UIScrollViewDelegate, UITableViewDelegate, UITableViewDataSource, SlideMenuDelegate>
{
    NSArray *imageArray;
//    PagedFlowView *hoflowview;
    NSMutableArray *testtmutarray_image;
    NSMutableArray *testtmutarray_label;
}

@property (strong, nonatomic) IBOutlet UITableView *scroll_table;
@property (strong, nonatomic) IBOutlet UIScrollView *scroll_view;

//@property (strong, nonatomic) IBOutlet PagedFlowView *page_test;

@end