//
//  BillCalculatorViewController.m
//  BillCalculatorPrototype
//
//  Created by Nicholas Wong on 2/28/14.
//  Copyright (c) 2014 Nicholas Workshop. All rights reserved.
//

#import "BillCalculatorViewController.h"
#import "Bill.h"

@interface BillCalculatorViewController ()
@property int splitCount;
@property Bill *bill;
@property(weak, nonatomic) IBOutlet UITextField *uCheckAmount;
@property(weak, nonatomic) IBOutlet UISwitch *uTaxIncluded;
@property(weak, nonatomic) IBOutlet UILabel *uTotalCharge;
@property(weak, nonatomic) IBOutlet UILabel *uTotalTips;
@property(weak, nonatomic) IBOutlet UILabel *uTipRate;
@property(weak, nonatomic) IBOutlet UILabel *uSplitCount;
@property(weak, nonatomic) IBOutlet UILabel *uTotalChargePerPerson;
@property(weak, nonatomic) IBOutlet UILabel *uTotalTipPerPerson;
@property(weak, nonatomic) IBOutlet UITextField *uTaxRate;
@end

@implementation BillCalculatorViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    // set init data
    _splitCount = 1;
    _bill = [[Bill alloc] init];
    [_uCheckAmount setText:[NSString stringWithFormat:@"$%g", _bill.checkAmount]];
    [_uTipRate setText:[NSString stringWithFormat:@"(%g%%)", _bill.tipRate * 100]];
    [_uTaxRate setText:[NSString stringWithFormat:@"(%g%%)", _bill.taxRate * 100]];
    [_uTaxIncluded setOn:_bill.isTaxIncluded];
    [self updateResult];

    // set delegates
    [self.view addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard)]];
}

- (void)updateResult
{
    [_bill calculate];
    [_uTotalCharge setText:[NSString stringWithFormat:@"$%g", _bill.totalCharge]];
    [_uTotalTips setText:[NSString stringWithFormat:@"$%g", _bill.totalTip]];
    [_uTotalChargePerPerson setText:[NSString stringWithFormat:@"$%g", _bill.totalCharge / _splitCount]];
    [_uTotalTipPerPerson setText:[NSString stringWithFormat:@"$%g", _bill.totalTip / _splitCount]];
}

- (IBAction)checkAmountEditingDidEnd:(UITextField *)sender
{
    [_bill setCheckAmount:[sender.text floatValue]];
    [self updateResult];
}

- (IBAction)taxRateEditingDidEnd:(UITextField *)sender
{
    [_bill setTaxRate:[sender.text floatValue] / 100];
    [self updateResult];
}

- (IBAction)taxIncludedValueChanged:(UISwitch *)sender
{
    [_bill setIsTaxIncluded:sender.isOn];
    [self updateResult];
}

- (IBAction)tipRateValueChanged:(UISlider *)sender
{
    float tipRate = sender.value * 5 / 100;
    int tipRatePercent = (int) sender.value * 5;
    [_uTipRate setText:[NSString stringWithFormat:@"(%d%%)", tipRatePercent]];
    [_bill setTipRate:tipRate];
    [self updateResult];
}

- (IBAction)splittingValueChanged:(UISlider *)sender
{
    _splitCount = (int) sender.value;
    [_uSplitCount setText:[NSString stringWithFormat:@"(%d)", _splitCount]];
    [self updateResult];
}

- (void)dismissKeyboard
{
    [_uCheckAmount resignFirstResponder];
    [_uTaxRate resignFirstResponder];
}

@end
