//
//  ParksDetailViewController.h
//  HW01-ChristianPaulW
//
//  Created by PAUL CHRISTIAN on 11/12/17.
//  Copyright © 2017 PAUL CHRISTIAN. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "park.h"
#import "ParksTableViewController.h"
#import "ParksTableViewCell.h"

@interface ParksDetailViewController : UIViewController
@property(strong, nonatomic)park* myPark;
@property(strong, nonatomic)NSString* viewTitle;

@end
