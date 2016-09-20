//
//  ViewController.m
//  NavigationBarAssignment
//
//  Created by komal lunkad on 19/09/16.
//  Copyright © 2016 komal lunkad. All rights reserved.
//

#import "ListProductsViewController.h"
#import "AddProductViewController.h"
#import "AppDelegate.h"
#import "Products.h"
#import "ShowDetailsViewController.h"
@interface ListProductsViewController (){
    UIView *viewNoItem;
    UIButton *buttonListProduct;
}
@end
@implementation ListProductsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIBarButtonItem *barButtonItemAdd = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addProducts)];
    self.navigationController.topViewController.navigationItem.rightBarButtonItem = barButtonItemAdd;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated{
    [self displayViewsList];
}
-(void) viewWillDisappear:(BOOL)animated{
    [viewNoItem removeFromSuperview];
}
/** Navigates to screen add product details
 */
-(void)addProducts {
    AddProductViewController *addProductViewController=[self.storyboard instantiateViewControllerWithIdentifier:@"AddProductViewController"];
    [self.navigationController pushViewController:addProductViewController animated:YES];
}
/** Displays view list displaying product details if available else returns no product available
 */
-(void)displayViewsList{
    AppDelegate *appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    int arrayLength=[appDelegate.arrayProducts count];
    if(arrayLength==0){
        [self viewsListForNoItem];
    }
    else{
        [self viewsListForItems];
    }
}
/** Displays that no product is available
 */
-(void)viewsListForNoItem{
    viewNoItem = [[UIView alloc] initWithFrame: CGRectMake(10, 100, 300, 50)];
    viewNoItem.backgroundColor = [UIColor cyanColor];
    [self.view addSubview:viewNoItem];
    UILabel *labelNoItem = [[UILabel alloc] initWithFrame: CGRectMake(10,10,200,20)];
    labelNoItem.backgroundColor=[UIColor clearColor];
    labelNoItem.text= @"No Item available";
    [viewNoItem  addSubview:labelNoItem];
}
/** Displays view list displaying product list
 */
-(void)viewsListForItems{
    AppDelegate *appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    int arrayLength=[appDelegate.arrayProducts count];
    int yvalue=20;
    UIScrollView *scrollViewListProducts = [[UIScrollView alloc] initWithFrame:CGRectMake(10, 100, self.view.frame.size.width, self.view.frame.size.height)];
    for(int i=0;i<arrayLength;i++){
        UIView *viewEachProduct = [self createViewWithYValue:yvalue];
        [scrollViewListProducts addSubview:viewEachProduct];
        UIButton *buttonEachProduct =[self createButtonWithYValue:yvalue];
        [buttonEachProduct setTag:i];
        [scrollViewListProducts addSubview:buttonEachProduct];
        UILabel *labelProductName = [self createLabelProductName:[appDelegate.arrayProducts[i] productName]];
        [viewEachProduct  addSubview:labelProductName];
        UILabel *labelProductPrice = [self createLabelProductprice:[NSString stringWithFormat:@"%0.2f", [appDelegate.arrayProducts[i] productPrice]]];
        [viewEachProduct  addSubview:labelProductPrice];
        yvalue+=70;
    }
    [self.view addSubview:scrollViewListProducts];
}
/** Creates view with yvalue given
 * \param yvalue The y coordinate of view
 * \returns UIView element
 */
-(UIView*)createViewWithYValue:(int)yvalue{
    UIView *viewEachProduct = [[UIView alloc] initWithFrame: CGRectMake(10, yvalue, 250, 60)];
    viewEachProduct.backgroundColor = [UIColor cyanColor];
    return viewEachProduct;
}
/** Creates button with yvalue given
 * \param yvalue The y coordinate of button
 * \returns UIButton element
 */
-(UIButton*)createButtonWithYValue:(int)yvalue{
    UIButton *buttonEachProduct = [UIButton buttonWithType: UIButtonTypeRoundedRect];
    buttonEachProduct.frame = CGRectMake(10, yvalue, 250, 60);
    [buttonEachProduct setTitle:@"" forState:UIControlStateNormal];
    [buttonEachProduct addTarget:self action:@selector(buttonEachProductTapped:) forControlEvents:UIControlEventTouchUpInside];
    return buttonEachProduct;
}
/** Creates label for product name
 * \param input The text to be displayed on label
 * \returns UILabel element
 */
-(UILabel*)createLabelProductName:(NSString*)input{
    UILabel *labelProductName = [[UILabel alloc] initWithFrame: CGRectMake(10,10,200,20)];
    labelProductName.backgroundColor=[UIColor clearColor];
    labelProductName.text=input;
    return labelProductName;
}
/** Creates label for product price
 * \param input The text to be displayed on label
 * \returns UILabel element
 */
-(UILabel*)createLabelProductprice:(NSString*)input{
    UILabel *labelProductPrice = [[UILabel alloc] initWithFrame: CGRectMake(10,30,200,20)];
    labelProductPrice.backgroundColor=[UIColor clearColor];
    labelProductPrice.text=input;
    return labelProductPrice;
}
/** Navigates to show product details screen
 * \param sender The button object
 */
-(void)buttonEachProductTapped:(UIButton*)sender{
    AppDelegate *appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    Products *product=[appDelegate.arrayProducts objectAtIndex:sender.tag];
    ShowDetailsViewController *showDetailsViewController=[self.storyboard instantiateViewControllerWithIdentifier:@"ShowDetailsViewController"];
    showDetailsViewController.product=product;
    [self.navigationController pushViewController:showDetailsViewController animated:YES];
}
@end
