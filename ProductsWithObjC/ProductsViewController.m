#import <Commercetools/Commercetools.h>
#import "ProductsViewController.h"

@interface ProductsViewController ()
@property(nonatomic, strong) NSArray<ProductProjection *>  *products;
@end

@implementation ProductsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [ProductProjection searchWithStaged:NO sort:@[@"createdAt desc"] expansion:nil limit:20 offset:0 lang:[NSLocale localeWithLocaleIdentifier:@"en"] text:@"dress" fuzzy:NO fuzzyLevel:nil filters:nil filterQuery:nil filterFacets:nil facets:nil markMatchingVariants:YES priceCurrency:nil priceCountry:nil priceCustomerGroup:nil priceChannel:nil result:^(ProductProjectionResponse * _Nullable response, NSArray<NSError *> * _Nullable errors) {
        if (errors == nil) {
            self.products = response.results;
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.tableView reloadData];
            });
        }
    }];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.products.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ProductCell" forIndexPath:indexPath];
    cell.textLabel.text = self.products[indexPath.row].name[@"en"];
    cell.detailTextLabel.text = self.products[indexPath.row].id;
    return cell;
}

@end
