//
//  ViewController.m
//  果冻动画
//
//  Created by apple on 16/2/16.
//  Copyright © 2016年 cheniue. All rights reserved.
//

#import "ViewController.h"
#import "AnimationLayer.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    AnimationLayer *layer;
    UITableView *listView;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    listView = [[UITableView alloc]initWithFrame:self.view.bounds];
    [listView setDelegate:self];
    [listView setDataSource:self];
    [self.view addSubview:listView];
    
    // Do any additional setup after loading the view, typically from a nib.
    
    
    UIButton *animationButton = [[UIButton alloc]initWithFrame:CGRectMake(100, 120, 120, 120)];
    [animationButton addTarget:self action:@selector(beginAnimation:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:animationButton];
    
    
    layer = [AnimationLayer layer];
    [layer setFrame:animationButton.bounds];
    [layer setBackgroundColor:[UIColor yellowColor].CGColor];
    [animationButton.layer insertSublayer:layer atIndex:INT16_MAX];
    
    
    
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1000;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80.0f;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"blankCell"];
    if (!cell)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"blankCell"];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%@",@(indexPath.row)];
    return cell;
}
-(void)beginAnimation:(UIButton*)button
{
    [layer startAnimation];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
