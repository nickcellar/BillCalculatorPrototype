//
//  BillTest.m
//  BillCalculatorPrototype
//
//  Created by Nicholas Wong on 2/26/14.
//  Copyright (c) 2014 Nicholas Workshop. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Bill.h"

@interface BillTest : XCTestCase

@end

@implementation BillTest

- (void)setUp
{
    [super setUp];
    // Put setup code here; it will be run once, before the first test case.
}

- (void)tearDown
{
    // Put teardown code here; it will be run once, after the last test case.
    [super tearDown];
}

- (void)testBasicBill
{
    Bill *bill = [[Bill alloc] init];
    XCTAssertEqual(bill.totalCharge, 24.775f, @"");
}

- (void)testCustomBill
{
    Bill *bill = [[Bill alloc] initWithCheckAmount:36.25 tipRate:0.18 taxRate:0.08875 isTaxIncluded:YES];
    XCTAssertEqual(bill.totalCharge, 42.243111f, @"");
}

@end
