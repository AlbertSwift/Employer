//
//  HomeVC.m
//  Employer
//
//  Created by Dipen on 13/11/15.
//  Copyright (c) 2015 Dipen. All rights reserved.
//

#import "HomeVC.h"

@interface HomeVC ()

@end

@implementation HomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    ary = [[NSMutableArray alloc] init];
    
    TableShare *share1 = [[TableShare alloc] init];
    share1.isOpen = NO;
    share1.isShowing = NO;
    share1.isAnimation = NO;
    [ary addObject:share1];
    
    TableShare *share2 = [[TableShare alloc] init];
    share2.isOpen = NO;
    share2.isShowing = NO;
    share2.isAnimation = NO;
    [ary addObject:share2];
    
    
    TableShare *share3 = [[TableShare alloc] init];
    share3.isOpen = NO;
    share3.isShowing = NO;
    share3.isAnimation = NO;
    [ary addObject:share3];
    
    TableShare *share4 = [[TableShare alloc] init];
    share4.isOpen = NO;
    share4.isShowing = NO;
    share4.isAnimation = NO;
    [ary addObject:share4];
    
    TableShare *share5 = [[TableShare alloc] init];
    share5.isOpen = NO;
    share5.isShowing = NO;
    share5.isAnimation = NO;
    [ary addObject:share5];
    [tblView reloadData];
    
}


-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark
#pragma mark - table view

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [ary count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    TableShare *share = [ary objectAtIndex:indexPath.row];
    if (share.isShowing) {
        if (!swt.isOn) {
            return 0;
        }else{
            return 100;
        }
    }
    return 100;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString * const CELL_ID = @"Cell";
    CustomCell* cell = (CustomCell*)[tableView  dequeueReusableCellWithIdentifier:CELL_ID];
    if (!cell) {
        NSArray *ary1=[[NSBundle mainBundle] loadNibNamed:@"CustomCell" owner:self options:nil];
        cell = [ary1 objectAtIndex:0];
    }
    
    // Add utility buttons
    NSMutableArray *rightUtilityButtons = [NSMutableArray new];
    TableShare *share = [ary objectAtIndex:indexPath.row];
    if (share.isShowing) {
//        [rightUtilityButtons sw_addUtilityButtonWithColor:
//         [UIColor colorWithRed:117.0f/255.0f green:117.0f/255.0f blue:117.0f/255.0f alpha:1.0f]
//                                                    title:@"Hidden"];
        [rightUtilityButtons sw_addUtilityButtonWithColor:[UIColor colorWithRed:117.0f/255.0f green:117.0f/255.0f blue:117.0f/255.0f alpha:1.0f] icon:[UIImage imageNamed:@"hide.png"]];
        
    }else{
//        [rightUtilityButtons sw_addUtilityButtonWithColor:
//         [UIColor colorWithRed:102.0f/255.0f green:187.0f/255.0f blue:106.0f/255.0f alpha:1.0f]
//                                                    title:@"Showing"];

    [rightUtilityButtons sw_addUtilityButtonWithColor:[UIColor colorWithRed:102.0f/255.0f green:187.0f/255.0f blue:106.0f/255.0f alpha:1.0f] icon:[UIImage imageNamed:@"show.png"]];
    
    }
    
//    [rightUtilityButtons sw_addUtilityButtonWithColor:
//     [UIColor colorWithRed:189.0f/255.0f green:189.0f/255.0f blue:189.0f/255.0f  alpha:1.0]
//                                                title:@"Edit"];

    [rightUtilityButtons sw_addUtilityButtonWithColor:[UIColor colorWithRed:189.0f/255.0f green:189.0f/255.0f blue:189.0f/255.0f  alpha:1.0] icon:[UIImage imageNamed:@"edit.png"]];
    
    cell.rightUtilityButtons = rightUtilityButtons;
    cell.delegate = self;
    cell.tag = indexPath.row;
    cell.lblTitle.text  = [NSString stringWithFormat:@"Edit :%ld",(long)indexPath.row];
    
    
    if (indexPath.row == 0) {
        [cell.contentView setBackgroundColor:[UIColor orangeColor]];
    }else if (indexPath.row == 1){
        [cell.contentView setBackgroundColor:[UIColor yellowColor]];
    }else if (indexPath.row == 2){
        [cell.contentView setBackgroundColor:[UIColor greenColor]];
    }else if (indexPath.row == 3){
        [cell.contentView setBackgroundColor:[UIColor blueColor]];
    }else if (indexPath.row == 4){
        [cell.contentView setBackgroundColor:[UIColor purpleColor]];
    }
    
    
    return cell;
}


- (void)tableView:(UITableView *)tableView willDisplayCell:(SWTableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    TableShare *share = [ary objectAtIndex:indexPath.row];
    if (share.isOpen) {
        if (share.isAnimation) {
            [cell showRightUtilityButtonsAnimated:YES];
        }else{
            [cell showRightUtilityButtonsAnimated:NO];
        }
    }else{
        [cell hideUtilityButtonsAnimated:YES];
    }
    
}



- (IBAction)btnswitchCLick:(id)sender {
    
    //[tblView reloadData];
    swt.enabled =NO;
    indexary = [[NSMutableArray alloc]init];
    int i=0;
    for (TableShare *share in ary) {
        if (swt.isOn) {
            //reload cell
            if (share.isShowing) {
                [indexary addObject:[NSString stringWithFormat:@"%d",i]];
            }
            [self show:i];
        }else{
            share.isOpen = NO;
            [self delay:i];
        }
        i++;
    }
    
}

- (void)swipeableTableViewCell:(SWTableViewCell *)cell didTriggerRightUtilityButtonWithIndex:(NSInteger)index {
    
    switch (index) {
        case 1:
        {
            TempVC *tempobj = [[TempVC alloc] init];
            tempobj.strIndex = [NSString stringWithFormat:@"%ld",(long)cell.tag];
            [self.navigationController pushViewController:tempobj animated:YES];
           // [self reset];
           // swt.on = NO;
            //[cell hideUtilityButtonsAnimated:YES];
            break;
        }
        case 0:
        {
            
            // Delete button is pressed
            
            TableShare *share = [ary objectAtIndex:cell.tag];
            if (share.isShowing) {
                share.isShowing = NO;
            }else{
                share.isShowing = YES;
            }
            share.isAnimation = NO;
            NSIndexPath *indexPath = [tblView indexPathForCell:cell];
            NSArray *indexPaths = [[NSArray alloc] initWithObjects:indexPath, nil];
            [tblView reloadRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationNone];
            break;
        }
        default:
            break;
    }
}


-(void)delay :(int)index{
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:index inSection:0];
    SWTableViewCell *cell = (SWTableViewCell *) [tblView cellForRowAtIndexPath:indexPath];
    [cell hideUtilityButtonsAnimated:YES];
    
    if (index >= [ary count]-1) {
        [self performSelector:@selector(reloadTable) withObject:nil afterDelay:0.5];
        
    }
    
}

-(void)reloadTable{
    
    int i=0;
    for (TableShare *share in ary) {
        share.isAnimation= NO;
        if (share.isShowing) {
            NSIndexPath *indexPath = [NSIndexPath indexPathForRow:i inSection:0];
            NSArray *indexPaths = [[NSArray alloc] initWithObjects:indexPath, nil];
            [tblView reloadRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationFade];
        }
        i++;
    }
    swt.enabled = YES;
    //[tblView reloadData];
}

-(void)show:(int)index{
    
    TableShare *share = [ary objectAtIndex:index];
    share.isOpen = YES;
    share.isAnimation = YES;
    
    
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:index inSection:0];
    SWTableViewCell *cell = (SWTableViewCell *) [tblView cellForRowAtIndexPath:indexPath];
    [cell showRightUtilityButtonsAnimated:YES];
    
    if ([indexary count]>=1 && index >= [ary count]-1) {
        [self performSelector:@selector(showTableAnimation) withObject:nil afterDelay:0.5];
    }else{
        swt.enabled = YES;
    }
}


-(void)showTableAnimation{
    
    for (NSString *str  in indexary) {
        
        TableShare *share = [ary objectAtIndex:[str intValue]];
        share.isAnimation = NO;
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:[str intValue] inSection:0];
        NSArray *indexPaths = [[NSArray alloc] initWithObjects:indexPath, nil];
        [tblView reloadRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationFade];
    }
    
    [indexary removeAllObjects];
    swt.enabled = YES;
    
}


-(void)reset{
    for (TableShare *share in ary) {
        share.isOpen = NO;
    }
    [tblView reloadData];
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
