//
//  MasterViewController.m
//  FlowerDetail
//
//  Created by John Ray on 10/16/13.
//  Copyright (c) 2013 John E. Ray. All rights reserved.
//

#import "MasterViewController.h"

#import "DetailViewController.h"

@interface MasterViewController () {
    NSMutableArray *_objects;
}
- (void)createFlowerData;
@property (strong,nonatomic) NSArray *flowerData;
@property (strong,nonatomic) NSArray *flowerSections;
@end

@implementation MasterViewController

- (void)awakeFromNib
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        self.clearsSelectionOnViewWillAppear = NO;
        self.preferredContentSize = CGSizeMake(320.0, 600.0);
    }
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.detailViewController =
        (DetailViewController *)[[self.splitViewController.viewControllers
                                  lastObject] topViewController];
    
    [self createFlowerData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)insertNewObject:(id)sender
{
    if (!_objects) {
        _objects = [[NSMutableArray alloc] init];
    }
    [_objects insertObject:[NSDate date] atIndex:0];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

#pragma mark - Table View
/*
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _objects.count;
}
 */
- (NSInteger)numberOfSectionsInTableView:(UITableView *)aTableView {
    // Return the number of sections.
    return [self.flowerSections count];
}


- (NSInteger)tableView:(UITableView *)aTableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
	return [self.flowerData[section] count];
}


- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
	return self.flowerSections[section];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	UITableViewCell *cell = [tableView
                             dequeueReusableCellWithIdentifier:@"flowerCell"];
    
    cell.textLabel.text=
    self.flowerData[indexPath.section][indexPath.row][@"name"];
    cell.detailTextLabel.text=
    self.flowerData[indexPath.section][indexPath.row][@"url"];
    
    UIImage *flowerImage;
    flowerImage=[UIImage imageNamed:
                 self.flowerData[indexPath.section][indexPath.row][@"picture"]];
    
    cell.imageView.image=flowerImage;
    
    return cell;
}


- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    //return YES;
    return NO;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [_objects removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        //  NSDate *object = _objects[indexPath.row];
        self.detailViewController.detailItem=
        self.flowerData[indexPath.section][indexPath.row];
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        //  NSDate *object = _objects[indexPath.row];
        // [[segue destinationViewController] setDetailItem:object];
        [[segue destinationViewController] setDetailItem:
         self.flowerData[indexPath.section][indexPath.row]];
    }
}

- (void)createFlowerData {
    
	NSMutableArray *redFlowers;
	NSMutableArray *blueFlowers;
	
	self.flowerSections=@[@"Red Flowers",@"Blue Flowers"];
	
	redFlowers=[[NSMutableArray alloc] init];
	blueFlowers=[[NSMutableArray alloc] init];
	
	[redFlowers addObject:@{@"name":@"Poppy",
						    @"picture":@"Poppy.png",
                            @"url":@"http://en.wikipedia.org/wiki/Poppy"}];
	[redFlowers addObject:@{@"name":@"Tulip",
						    @"picture":@"Tulip.png",
						    @"url":@"http://en.wikipedia.org/wiki/Tulip"}];
	[redFlowers addObject:@{@"name":@"Gerbera",
                            @"picture":@"Gerbera.png",
                            @"url":@"http://en.wikipedia.org/wiki/Gerbera"}];
	[redFlowers addObject:@{@"name":@"Peony",
                            @"picture":@"Peony.png",
                            @"url":@"http://en.wikipedia.org/wiki/Peony"}];
	[redFlowers addObject:@{@"name":@"Rose",
                            @"picture":@"Rose.png",
                            @"url":@"http://en.wikipedia.org/wiki/Rose"}];
    [redFlowers addObject:@{@"name":@"Hollyhock",
                            @"picture":@"Hollyhock.png",
                            @"url":@"http://en.wikipedia.org/wiki/Hollyhock"}];
    [redFlowers addObject:@{@"name":@"Straw Flower",
                            @"picture":@"Strawflower.png",
                            @"url":@"http://en.wikipedia.org/wiki/Peony"}];
    [blueFlowers addObject:@{@"name":@"Hyacinth",
                             @"picture":@"Hyacinth.png",
                             @"url":@"http://en.m.wikipedia.org/wiki/Hyacinth_(flower)"}];
    [blueFlowers addObject:@{@"name":@"Hydrangea",
                             @"picture":@"Hydrangea.png",
                             @"url":@"http://en.m.wikipedia.org/wiki/Hydrangea"}];
    [blueFlowers addObject:@{@"name":@"Sea Holly",
                             @"picture":@"Sea Holly.png",
                             @"url":@"http://en.wikipedia.org/wiki/Sea_holly"}];
    [blueFlowers addObject:@{@"name":@"Grape Hyacinth",
                             @"picture":@"Grape Hyacinth.png",
                             @"url":@"http://en.wikipedia.org/wiki/Grape_hyacinth"}];
    [blueFlowers addObject:@{@"name":@"Phlox",
                             @"picture":@"Phlox.png",
                             @"url":@"http://en.wikipedia.org/wiki/Phlox"}];
    [blueFlowers addObject:@{@"name":@"Pin Cushion Flower",
                             @"picture":@"Pincushion flower.png",
                             @"url":@"http://en.wikipedia.org/wiki/Scabious"}];
    [blueFlowers addObject:@{@"name":@"Iris",
                             @"picture":@"Iris.png",
                             @"url":@"http://en.wikipedia.org/wiki/Iris_(plant)"}];
    
	self.flowerData=@[redFlowers,blueFlowers];
    
}

@end
