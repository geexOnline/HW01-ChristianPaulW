//
//  ParksTableViewController.m
//  HW01-ChristianPaulW
//
//  Created by PAUL CHRISTIAN on 11/12/17.
//  Copyright © 2017 PAUL CHRISTIAN. All rights reserved.
//

#import "ParksTableViewController.h"
#import "ParksTableViewCell.h"
#import "ParksDetailViewController.h"
#import "park.h"


@interface ParksTableViewController ()
@property (strong, nonatomic)NSDictionary* parks;
@property (strong, nonatomic)NSArray* parkNames;
@end

@implementation ParksTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"Pick a Florida State Park";
    NSString* path = [[NSBundle mainBundle]pathForResource:@"StateParks" ofType:@"plist"];
    _parks = [NSDictionary dictionaryWithContentsOfFile:path];
    
    NSLog(@"Full Data Dump: %@",_parks);
    NSLog(@"Only Parks: %@",[_parks allKeys]);
    NSLog(@"Everglades Record: %@",_parks[@"Dry Tortugas"]);
    NSLog(@"Everglades Address: %@",_parks[@"Dry Tortugas"][@"address"]);
    _parkNames = [[_parks allKeys]sortedArrayUsingSelector:@selector(compare:)];
    NSLog(@"ParkNames: %@",_parkNames);
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    //#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //#warning Incomplete implementation, return the number of rows
    NSLog(@"%lu",[_parks count]);
    return [_parks count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString* cellIdentifier = @"ParkInfoCellID";
    ParksTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: cellIdentifier forIndexPath:indexPath];
    
    
    NSLog(@"indexPath: %@, indexPath.section: %lu",indexPath,indexPath.row);
    //Name Lable
    cell.lblName.text = _parkNames[indexPath.row];
    cell.lblName.font = [UIFont fontWithName:@"TimesNewRomanPS-BoldMT" size:24];
    [cell.lblName setTextColor:[UIColor brownColor]];
    //Type Lable
    cell.lblType.text = _parks[_parkNames[indexPath.row]][@"typeOfPark"];
    cell.lblType.font = [UIFont fontWithName:@"Times New Roman" size:18];
    [cell.lblType setTextColor:[UIColor brownColor]];
    //Location Lable
    cell.lblLocation.text = _parks[_parkNames[indexPath.row]][@"location"];
    cell.lblLocation.font = [UIFont fontWithName:@"TimesNewRomanPS-ItalicMT" size:10];
    [cell.lblLocation setTextColor:[UIColor orangeColor]];
    
    NSString* parkSMpath = _parks[_parkNames[indexPath.row]][@"picSM"];
    cell.imgSmallPic.image = [UIImage imageNamed:parkSMpath];

    NSLog(@"%lu:%@",indexPath.section,_parkNames[indexPath.row]);
        //NSArray* keyValues =
    
    
    
    // Configure the cell...
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier]isEqualToString:@"sguShowDetail"])
    {
        
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    ParksDetailViewController *detailVC = [segue destinationViewController];

    park *goPark = [[park alloc] init];
    goPark.name = [NSString stringWithFormat:@"%@",[sender lblName].text];
    goPark.type = _parks[goPark.name][@"typeOfPark"];
    goPark.imageLGpath = _parks[goPark.name][@"picLG"];
    goPark.location = _parks[goPark.name][@"location"];
    goPark.yearOpened = _parks[goPark.name][@"yearOpened"];
    goPark.address = _parks[goPark.name][@"address"];
    goPark.writeUp = _parks[goPark.name][@"description"];
        NSLog(@"%@",goPark.writeUp);
        detailVC.myPark = goPark;
    }
    
}


@end
