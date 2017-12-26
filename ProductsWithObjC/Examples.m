#import <Foundation/Foundation.h>
#import <Commercetools/Commercetools.h>

@interface Examples: NSObject

@end


@implementation Examples

+ (void)examples {
    
    // Setting configuration
    Config *config = [[Config alloc] initWithPath:@"CommercetoolsStagingConfig" loggingEnabled:YES logLevel:LogLevelDebug];
    [Commercetools setConfig:config];
    
    // ProductProjection endpoints
    
    // ProductProjection search
    [ProductProjection searchWithStaged:NO sort:@[@"lastModifiedAt desc"] expansion:nil limit:20 offset:0 lang:[NSLocale localeWithLocaleIdentifier:@"en"] text:@"dress" fuzzy:NO fuzzyLevel:nil filters:nil filterQuery:nil filterFacets:nil facets:nil markMatchingVariants:YES priceCurrency:nil priceCountry:nil priceCustomerGroup:nil priceChannel:nil result:^(ProductProjectionResponse * _Nullable response, NSArray<NSError *> * _Nullable errors) {
        
    }];
    
    // ProductProjection suggest
    [ProductProjection suggestWithStaged:NO limit:20 lang:[NSLocale localeWithLocaleIdentifier:@"en"] searchKeywords:@"dress" fuzzy:NO result:^(NSDictionary<NSString *,id> * _Nullable suggestionDictionary, NSArray<NSError *> * _Nullable errors) {
        
    }];
    
    // ProductProjection query (search is preferred)
    [ProductProjection queryWithStaged:NO predicates:nil sort:nil expansion:nil limit:20 offset:0 result:^(ProductProjectionResponse * _Nullable response, NSArray<NSError *> * _Nullable errors) {
        
    }];
    
    // Get product by key
    [ProductProjection byKey:@"tagliatore-suit" expansion:nil result:^(ProductProjection * _Nullable product, NSArray<NSError *> * _Nullable errors) {
        
    }];
    
    // Get product by ID
    [ProductProjection byId:@"6527b2b9-9d83-4901-a28e-745fc808fedf" staged:NO expansion:nil result:^(ProductProjection * _Nullable product, NSArray<NSError *> * _Nullable errors) {
        
    }];
    
    // Cart endpoints
    
    // Cart query
    [Cart queryWithPredicates:nil sort:@[@"lastModifiedAt desc"] expansion:nil limit:20 offset:0 result:^(CartResponse * _Nullable response, NSArray<NSError *> * _Nullable errors) {
        
    }];
    
    // Get active cart (for the currently logged in customer, or current anonymous customer, depending on Commercetools.authState)
    [Cart activeWithExpansion:nil result:^(Cart * _Nullable cart, NSArray<NSError *> * _Nullable errors) {
        if (cart == nil && errors == nil) {
            NSLog(@"No active cart for the current customer");
        }
    }];
    
    // Create a new cart
    CartDraft *cartDraft = [[CartDraft alloc] initWithCurrency:@"USD" customerId:nil customerEmail:nil anonymousId:nil country:nil inventoryMode:InventoryModeEnumNone taxMode:TaxModeEnumPlatform lineItems:nil customLineItems:nil shippingAddress:nil billingAddress:nil shippingMethod:nil custom:nil locale:nil deleteDaysAfterLastModification:2];
    [Cart create:cartDraft expansion:nil result:^(Cart * _Nullable cart, NSArray<NSError *> * _Nullable errors) {
        
    }];
    
    // Update an existing cart
    LineItemDraft *lineItemDraft = [[LineItemDraft alloc] initWithProductId:@"6527b2b9-9d83-4901-a28e-745fc808fedf" variantId:1 sku:nil quantity:1 supplyChannel:nil distributionChannel:nil custom:nil];
    AddLineItem *addLineItem = [[AddLineItem alloc] initWithLineItemDraft:lineItemDraft];
    [Cart update:@"759a5483-034c-47d3-898e-0837e4d1a51d" version:1 actions:@[addLineItem] expansion:nil result:^(Cart * _Nullable cart, NSArray<NSError *> * _Nullable errors) {
        
    }];
    
    // Cart delete
    [Cart delete:@"759a5483-034c-47d3-898e-0837e4d1a51d" version:1 expansion:nil result:^(Cart * _Nullable cart, NSArray<NSError *> * _Nullable errors) {
        
    }];
    
    // Order endpoints
    
    // Create order from cart
    OrderDraft *orderDraft = [[OrderDraft alloc] initWithId:@"759a5483-034c-47d3-898e-0837e4d1a51d" version:1]; // cart id and version
    [Order create:orderDraft expansion:nil result:^(Order * _Nullable order, NSArray<NSError *> * _Nullable errors) {
        
    }];
    
    // Order query
    [Order queryWithPredicates:nil sort:nil expansion:nil limit:20 offset:0 result:^(OrderResponse * _Nullable ordersResponse, NSArray<NSError *> * _Nullable errors) {
        
    }];
    
    // Get order by ID
    [Order byId:@"6527b2b9-9d83-4901-a28e-745fc808fedf" expansion:nil result:^(Order * _Nullable order, NSArray<NSError *> * _Nullable errors) {
        
    }];
    
    // ShippingMethod endpoints
    
    // ShippingMethod query
    [ShippingMethod queryWithPredicates:nil sort:nil expansion:nil limit:20 offset:0 result:^(ShippingMethodResponse * _Nullable shippingMethodsResponse, NSArray<NSError *> * _Nullable errors) {
        
    }];
    
    // Get ShippingMethod by ID
    [ShippingMethod byId:@"6527b2b9-9d83-4901-a28e-745fc808fedf" expansion:nil result:^(ShippingMethod * _Nullable shippingMethod, NSArray<NSError *> * _Nullable errors) {
        
    }];
    
    // Get ShippingMethod by key
    [ShippingMethod byKey:@"foo" expansion:nil result:^(ShippingMethod * _Nullable shippingMethod, NSArray<NSError *> * _Nullable errors) {
        
    }];
    
    // Get ShippingMethods available for a specific cart
    //  [ShippingMethod forCart:cart result:^(NSArray<ShippingMethod *> * _Nullable shippingMethods, NSArray<NSError *> * _Nullable errors) {
    //  }];
    
    // Get ShippingMethods available for specific country (and state / currency combination)
    [ShippingMethod forCountry:@"US" state:@"CA" currency:@"USD" result:^(NSArray<ShippingMethod *> * _Nullable shippingMethods, NSArray<NSError *> * _Nullable errors) {
        
    }];
    
    // Payment endpoints
    
    // Payment query
    [Payment queryWithPredicates:nil sort:nil expansion:nil limit:20 offset:0 result:^(PaymentResponse * _Nullable paymentsResponse, NSArray<NSError *> * _Nullable errors) {
        
    }];
    
    // Get Payment by ID
    [Payment byId:@"6527b2b9-9d83-4901-a28e-745fc808fedf" expansion:nil result:^(Payment * _Nullable payment, NSArray<NSError *> * _Nullable errors) {
        
    }];
    
    // Payment create
    Money *amountPlanned = [[Money alloc] initWithCurrencyCode:@"USD" centAmount:808];
    PaymentMethodInfo *paymentMethodInfo = [[PaymentMethodInfo alloc] initWithPaymentInterface:nil method:@"VISA" name:nil];
    
    TransactionDraft *transactionDraft = [[TransactionDraft alloc] initWithTimestamp:nil type:TransactionTypeEnumCharge amount:amountPlanned interactionId:nil];
    
    PaymentDraft *paymentDraft = [[PaymentDraft alloc] initWithAmountPlanned:amountPlanned paymentMethodInfo:paymentMethodInfo custom:nil transaction:transactionDraft];
    
    [Payment create:paymentDraft expansion:nil result:^(Payment * _Nullable payment, NSArray<NSError *> * _Nullable errors) {
        
    }];
    
    // Update existing payment
    ChangeAmountPlanned *changeAmountPlanned = [[ChangeAmountPlanned alloc] initWithAmount:amountPlanned];
    [Payment update:@"6527b2b9-9d83-4901-a28e-745fc808fedf" version:1 actions:@[changeAmountPlanned] expansion:nil result:^(Payment * _Nullable payment, NSArray<NSError *> * _Nullable errors) {
        
    }];
    
    // Payment delete
    [Payment delete:@"6527b2b9-9d83-4901-a28e-745fc808fedf" version:1 expansion:nil result:^(Payment * _Nullable payment, NSArray<NSError *> * _Nullable errors) {
        
    }];
    
    // ProductType endpoints
    
    // Get ProductType by key
    [ProductType byKey:@"foo" expansion:nil result:^(ProductType * _Nullable productType, NSArray<NSError *> * _Nullable errors) {
        
    }];
    
    // Get ProductType by ID
    [ProductType byId:@"6527b2b9-9d83-4901-a28e-745fc808fedf" expansion:nil result:^(ProductType * _Nullable productType, NSArray<NSError *> * _Nullable errors) {
        
    }];
    
    // ProductType query
    [ProductType queryWithPredicates:nil sort:nil expansion:nil limit:20 offset:0 result:^(ProductTypeResponse * _Nullable productTypesResponse, NSArray<NSError *> * _Nullable errors) {
        
    }];
    
    // Login customer, and specify cart migration mode if previously using anonymous customer token
    [Commercetools loginCustomerWithUsername:@"customer@example.com" password:@"qwerty" activeCartSignInMode:AnonymousCartSignInModeEnumMergeWithExistingCustomerCart result:^(Customer * _Nullable customer, Cart * _Nullable cart, NSError * _Nullable errors) {
        
    }];
    
    // Logout customer
    [Commercetools logoutCustomer];
    
    // Inspect current authorization state / token type
    switch (Commercetools.authState) {
        case TokenStateAnonymousToken:
            // SDK is handling tokens for an anonymous customer.
            break;
        case TokenStateCustomerToken:
            // SDK is handling tokens for a logged in customer.
            break;
            
        case TokenStatePlainToken:
            // SDK is handling a token without an associated customer.
            break;
            
        default:
            // SDK does not have a token (i.e. because Commercetools configuration is not valid)
            break;
    }
}

@end
