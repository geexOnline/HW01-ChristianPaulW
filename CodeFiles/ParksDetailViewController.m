//
//  ParksDetailViewController.m
//  HW01-ChristianPaulW
//
//  Created by PAUL CHRISTIAN on 11/12/17.
//  Copyright © 2017 PAUL CHRISTIAN. All rights reserved.
//

#import "ParksDetailViewController.h"

@interface ParksDetailViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imgPicBig;
@property (weak, nonatomic) IBOutlet UITextView *txtParkInfo;
@property (weak, nonatomic) IBOutlet UILabel *lblName;
@property (weak, nonatomic) IBOutlet UILabel *lblType;
@property (weak, nonatomic) IBOutlet UILabel *lblLocation;
@property (strong, nonatomic)NSDictionary* directions;

@end

@implementation ParksDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // self.txtParkInfo.text = self.myPark.name;
    self.navigationItem.title = self.myPark.name;
    
    self.imgPicBig.image = [UIImage imageNamed:self.myPark.imageLGpath];
    
    self.lblName.text = [NSString stringWithFormat:@"%@",self.myPark.name];
    self.lblName.font = [UIFont fontWithName:@"TimesNewRomanPS-BoldMT" size:34];
    [self.lblName setTextColor:[UIColor brownColor]];
    
	self.lblType.text = [NSString stringWithFormat:@"%@",self.myPark.type];
    self.lblType.font = [UIFont fontWithName:@"Times New Roman" size:20];
    [self.lblType setTextColor:[UIColor brownColor]];
    
    self.lblLocation.text = self.myPark.location;
    self.lblLocation.font = [UIFont fontWithName:@"TimesNewRomanPS-ItalicMT" size:14];
    
    NSString* path = [[NSBundle mainBundle]pathForResource:@"Directions" ofType:@"plist"];
    _directions = [NSDictionary dictionaryWithContentsOfFile:path];
    NSArray* dir = _directions[self.myPark.name];
    NSString* directionsFormatted = [[NSString alloc]init];
    for (int i=0;i<[dir count];i++)
    {
        directionsFormatted = [directionsFormatted stringByAppendingString:[NSString stringWithFormat:@"%@\n",dir[i]]];
        
    }
    NSLog(@"\nPark Name: %@\nDirections:%@\nAll:%@",self.myPark.name,_directions[self.myPark.name],_directions);
    
    self.txtParkInfo.text = [NSString stringWithFormat:@"%@\n\nAddress: %@\n\nYear Park Opened: %@\n\nDirections:\n\n%@",self.myPark.writeUp,self.myPark.address,self.myPark.yearOpened,directionsFormatted];



    
    /*Location Lable
    cell.lblLocation.text = _parks[_parkNames[indexPath.row]][@"location"];
    cell.lblLocation.font = [UIFont fontWithName:@"TimesNewRomanPS-ItalicMT" size:10];
    [cell.lblLocation setTextColor:[UIColor orangeColor]];
    
    NSString* parkSMpath = _parks[_parkNames[indexPath.row]][@"picSM"];
    cell.imgSmallPic.image = [UIImage imageNamed:parkSMpath];
*/

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
