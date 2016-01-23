//
//  MyTableViewController.m
//  
//
//  Created by lanou on 16/1/23.
//
//

#import "MyTableViewController.h"
#import "BoyTableViewCell.h"
#import "GirlTableViewCell.h"
@interface MyTableViewController ()

@property (nonatomic, retain)NSMutableArray *dataArray;

@end

@implementation MyTableViewController

-(void)handleData {

    NSString *filePath =[[NSBundle mainBundle]pathForResource:@"Students" ofType:@"plist"];
    NSArray *array = [NSArray arrayWithContentsOfFile:filePath];
    _dataArray = [NSMutableArray new];
    for (NSDictionary *dic in array) {
        Student *student = [Student new];
        [student setValuesForKeysWithDictionary:dic];
        [_dataArray addObject:student];
    }
//    NSLog(@"%@",_dataArray);
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self handleData];
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
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return _dataArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    Student *stu  = _dataArray[indexPath.row];
    if ([stu.sex isEqualToString:@"男"]) {
        return [BoyTableViewCell cellHeightForStudent:stu];
    }else if ([stu.sex isEqualToString:@"女"]) {
        return [GirlTableViewCell cellHeightForStudent:stu];
    }

    return 0;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    Student *stu = _dataArray[indexPath.row];
    if ([stu.sex isEqualToString:@"男"]) {
        static NSString *reuseldentifier = @"男";
        BoyTableViewCell *bayCell = [tableView dequeueReusableCellWithIdentifier:reuseldentifier];
        if (!bayCell) {
            bayCell = [[BoyTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseldentifier];
        }
        [bayCell sendStudent:stu];
        bayCell.student = stu;
        return bayCell;
    }else if ([stu.sex isEqualToString:@"女"]) {
        static NSString *reuseldentifier = @"女";
    GirlTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseldentifier];
    
        if (!cell) {
            cell = [[GirlTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseldentifier];        }
    // Configure the cell...
        [cell sendStudent:stu];
        cell.student = stu;
        return cell;
    }
    return nil;
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
