//
//  TempVC.m
//  Employer
//
//  Created by Dipen on 14/11/15.
//  Copyright (c) 2015 Dipen. All rights reserved.
//

#import "TempVC.h"

@interface TempVC ()

@end

@implementation TempVC



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

    lblTitle.text = [NSString stringWithFormat:@"Edit: %@",self.strIndex];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)btnBackClick:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
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
