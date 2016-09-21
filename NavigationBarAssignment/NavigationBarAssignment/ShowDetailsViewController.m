//
//  ShowDetailsViewController.m
//  NavigationBarAssignment
#import "ShowDetailsViewController.h"

@interface  ShowDetailsViewController(){
    IBOutlet UILabel *labelProductName;
    IBOutlet UILabel *labelProductprice;
    IBOutlet UILabel *labelProductCategory;
}
@end
@implementation ShowDetailsViewController
@synthesize product;
/** Assigns labels with product values
 * \param animated Sends animated value
 */
-(void) viewWillAppear:(BOOL)animated{
    labelProductName.text = [@"Product Name : " stringByAppendingString:product.productName];
    labelProductprice.text = [@"Product Price : " stringByAppendingString:[[NSNumber numberWithFloat:product.productPrice] stringValue]];
    labelProductCategory.text = [@"Product Category: " stringByAppendingString:product.productCategory];
}
@end