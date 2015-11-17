//
//  HomeVC.h
//  Employer
//
//  Created by Dipen on 13/11/15.
//  Copyright (c) 2015 Dipen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomCell.h"
#import "TableShare.h"
#import "TempVC.h"
@interface HomeVC : UIViewController<SWTableViewCellDelegate,UITableViewDelegate,UITableViewDataSource>{
    IBOutlet UITableView *tblView;
    NSMutableArray *ary;
    BOOL isOpen;
    IBOutlet UISwitch *swt;
    NSMutableArray *indexary;
}

@end
