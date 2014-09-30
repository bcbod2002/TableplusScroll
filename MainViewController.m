//
//  MainViewController.m
//  TableplusScroll
//
//  Created by shinsoft on 2013/12/3.
//  Copyright (c) 2013年 Goston. All rights reserved.
//

#import "MainViewController.h"
#import "ScrollInTable.h"
#import "SlideMenu.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    imageArray = [[NSArray alloc] initWithObjects:@"0.tiff",@"1.tiff",@"2.tiff",@"3.tiff",@"4.tiff",@"5.tiff",@"6.tiff",@"7.tiff",nil];
    [self.navigationController popToRootViewControllerAnimated:YES];
    
    testtmutarray_image = [[NSMutableArray alloc] initWithObjects:@"0.tiff", @"1.tiff", @"2.tiff", @"3.tiff", @"4.tiff", @"5.tiff", @"6.tiff", @"7.tiff", @"1.tiff", @"2.tiff", nil];
    testtmutarray_label = [[NSMutableArray alloc] initWithObjects:@"小白2", @"Min", @"689", @"猜Q3", @"Q資4", @"WRETWRE", @"GANK", @"POKER", @"站著穿", @"123", nil];
//    testtmutarray_label = [[NSMutableArray alloc] initWithObjects:@"0", @"1", @"2", @"3", @"4", @"5", nil];
    
    
//    MenuTest *menutest = [[MenuTest alloc] initWithFrame:CGRectMake(50, 100, 100, 200)];
//    MenuTest *menutest = [[MenuTest alloc] initWithFrame:CGRectMake(0, 0, 500, 500) and:imageArray];
//    MenuTest *menutest = [[MenuTest alloc] initWithFrame:CGRectMake(0, 0, 320, 500) with:130 and:imageArray];
//    ScrollInTable *menutest = [[ScrollInTable alloc] initWithFrame:CGRectMake(0, 0, 320, 500) CellHeiget:130 Items:imageArray];
//    menutest.backgroundColor = [UIColor yellowColor];
//    [self.view addSubview:menutest];
}
-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
//    SlideMenu *test_slide = [[SlideMenu alloc] initWithLocate:Locate_Buttom Item_images:testtmutarray_image Item_labels:testtmutarray_label];
//    test_slide.delegate = self;
//    [self.view addSubview:test_slide];
//    
//    SlideMenu *phony_slide = [[SlideMenu alloc] initWithLocate:Locate_Top Item_images:testtmutarray_image Item_labels:testtmutarray_label];
//    phony_slide.delegate = self;
//    [self.view addSubview:phony_slide];
    
    // scrill inTable
    ScrollInTable *scrollInTable = [[ScrollInTable alloc] initWithFrame:CGRectMake(0, 0, 320, 568) CellHeiget:100 Items:imageArray];
    [self.view addSubview:scrollInTable];
}
-(void)touched_item_lable_text:(NSString *)chosen_item
{
    NSLog(@"%@", chosen_item);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UIScrollView *test_scroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 320, 260)];
    
    static NSString *CellIdentifier = @"Scroll_Cell";
    UITableViewCell *cell;

    CGFloat r, g, b;
    
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Scroll_Cell"];
    [test_scroll setContentSize:CGSizeMake(1600, 260)];
//    [test_scroll setContentSize:CGSizeMake(2400, 100)];
    [test_scroll setPagingEnabled:YES];
    [test_scroll setScrollsToTop:NO];
//    [test_scroll setDelegate:self];
    for (NSInteger i = 0; i < 5; ++i)
    {
        
        UIView *phony_view = [[UIView alloc] initWithFrame:CGRectMake(5 + (i * 320), 10, 310, 240)];
        r = (arc4random() % 10) / 10.0;
        g = (arc4random() % 10) / 10.0;
        b = (arc4random() % 10) / 10.0;
        [phony_view setBackgroundColor:[UIColor colorWithRed:r green:g blue:b alpha:0.5]];
        [phony_view.layer setCornerRadius:10.0];
//        [test_scroll addSubview:phony_view];
        
    }
    
//    [[cell contentView] addSubview:test_scroll];

    return cell;
}
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}

@end
