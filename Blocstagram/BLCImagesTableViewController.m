//
//  BLCImagesTableViewController.m
//  Blocstagram
//
//  Created by Man Hong Lee on 1/29/15.
//  Copyright (c) 2015 ManHong Lee. All rights reserved.
//

#import "BLCImagesTableViewController.h"
#import "BLCDataSource.h"
#import "BLCMedia.h"
#import "BLCUser.h"
#import "BLCComment.h"
#import "BLCMediaTableViewCell.h"

@interface BLCImagesTableViewController ()

@end

@implementation BLCImagesTableViewController

-(id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
//        self.images = [NSMutableArray array];
    }
    return self;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    for (int i=1; i <= 10; i++) {
//        NSString *imageName = [NSString stringWithFormat:@"%d.jpg", i];
//        UIImage*image = [UIImage imageNamed:imageName];
//        if (image) {
//            [self.images addObject:image];
//        }
//    }
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    [self.tableView registerClass:[BLCMediaTableViewCell class] forCellReuseIdentifier:@"mediaCell"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
//
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Potentially incomplete method implementation.
//    // Return the number of sections.
//    return 0;
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete method implementation.
//    // Return the number of rows in the section. r
//    return 0;
//    return self.images.count;
    return [self items].count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    BLCMediaTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"mediaCell" forIndexPath:indexPath];
    cell.mediaItem =[BLCDataSource sharedInstance].mediaItems[indexPath.row];
    return cell;
}

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    UIImage *image = self.images[indexPath.row];
    BLCMedia *item = [self items][indexPath.row];
    UIImage *image = item.image;
    return (CGRectGetWidth(self.view.frame)/image.size.width) *image.size.height;
}

-(BOOL) tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return YES;
}

//
//- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
//    
//    
////    [self.images removeObjectAtIndex:indexPath.row];
//    NSMutableArray* mutableArray = [self items].mutableCopy;
//    [mutableArray removeObjectAtIndex:indexPath.row];
//    [BLCDataSource sharedInstance].mediaItems = (NSArray*) mutableArray;
//    
//    [tableView reloadData];
//}

-(NSArray*) items{
    return [BLCDataSource sharedInstance].mediaItems;
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/



- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}


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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
