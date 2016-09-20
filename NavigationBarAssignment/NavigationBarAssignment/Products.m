//
//  Products.m
//  NavigationBarAssignment
//
//  Created by komal lunkad on 19/09/16.
//  Copyright © 2016 komal lunkad. All rights reserved.
//

#import "Products.h"
@interface Products()
@end
@implementation Products
@synthesize productName,productPrice,productCategory;
- (id)init {
    self = [super init];
    productName=@"";
    productPrice=0.0;
    productCategory=@"";
    return self;
}
@end