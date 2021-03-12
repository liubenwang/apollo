//
//  NextViewController.m
//  WebProtal
//
//  Created by benwang on 2021/3/9.
//

#import "NextViewController.h"

@interface NextViewController ()

@end

@implementation NextViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIButton *button = [UIButton buttonWithType:UIButtonTypeClose];
    [button addTarget:self action:@selector(close) forControlEvents:UIControlEventTouchUpInside];
    button.frame = CGRectMake(100, 100, 80, 80);
    [self.view addSubview:button];

    self.view.backgroundColor = [UIColor grayColor];
}

- (void)close {
    NextViewController *vc = [[NextViewController alloc] init];

    NSMutableArray *muArr = [self.navigationController.viewControllers mutableCopy];
    [muArr removeLastObject];
    [muArr addObject: vc];
    [self.navigationController setViewControllers: muArr.copy animated: YES];
}

- (void)dealloc {
    NSLog(@"dealloc");
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
