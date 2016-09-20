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
@interface ListProductsViewController (){
    UIView *viewNoItem, *viewEachProduct;
    UILabel *labelNoItem;
    UIScrollView *scrollViewListProducts;
    UIButton *buttonListProduct
}

@end

@implementation ListProductsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addProducts)];
    
    self.navigationController.topViewController.navigationItem.rightBarButtonItem = item;
    
}
- (void)viewDidAppear:(BOOL)animated{
    [self displayViewsList];
}
-(void) viewWillDisappear:(BOOL)animated{
    [viewNoItem removeFromSuperview];
    [scrollViewListProducts removeFromSuperview];
}
-(void)displayViewsList{
    AppDelegate *appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    int arrayLength=[appDelegate.arrayProducts count];
    int yvalue=100;
    if(arrayLength==0)
   {
       viewNoItem = [[UIView alloc] initWithFrame: CGRectMake(10, 100, 300, 50)];
       viewNoItem.backgroundColor = [UIColor cyanColor];
       [self.view addSubview:viewNoItem];
       labelNoItem = [[UILabel alloc] initWithFrame: CGRectMake(10,10,200,20)];
        labelNoItem.backgroundColor=[UIColor clearColor];
       labelNoItem.text= @"No Item available";
       [viewNoItem  addSubview:labelNoItem];
      
    }
    else{
        scrollViewListProducts = [[UIScrollView alloc] initWithFrame:CGRectMake(10, 100, self.view.frame.size.width, self.view.frame.size.height)];
        
        for(int i=0;i<arrayLength;i++){
            viewEachProduct = [[UIView alloc] initWithFrame: CGRectMake(10, 20, 300, 60)];
            viewEachProduct.backgroundColor = [UIColor cyanColor];
            //[self.view addSubview:viewEachProduct];
            [scrollViewListProducts addSubview:viewEachProduct];
            UILabel *labelProductName = [[UILabel alloc] initWithFrame: CGRectMake(10,10,200,20)];
            labelProductName.backgroundColor=[UIColor clearColor];
            labelProductName.text= [appDelegate.arrayProducts[i] productName];
            [viewEachProduct  addSubview:labelProductName];
            UILabel *labelProductPrice = [[UILabel alloc] initWithFrame: CGRectMake(10,30,200,20)];
            labelProductPrice.backgroundColor=[UIColor clearColor];
            labelProductPrice.text= [NSString stringWithFormat:@"%0.2f", [appDelegate.arrayProducts[i] productPrice]];
            [viewEachProduct  addSubview:labelProductPrice];
            yvalue+=70;
        }
        [self.view addSubview:scrollViewListProducts];
        
    }
    
}

-(void)addProducts {
    NSLog(@"added");
    
    AddProductViewController *addProductViewController=[self.storyboard instantiateViewControllerWithIdentifier:@"AddProductViewController"];
    [self.navigationController pushViewController:addProductViewController animated:YES];
   
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
