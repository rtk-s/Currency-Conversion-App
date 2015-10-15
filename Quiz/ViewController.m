//
//  ViewController.m
//  Quiz
//
//  Created by Nikolay on 15.10.15.
//  Copyright © 2015 nut. All rights reserved.
//

#import "ViewController.h"
#import "CurrencyRequest/CRCurrencyRequest.h"
#import "CurrencyRequest/CRCurrencyResults.h"

@interface ViewController () <CRCurrencyRequestDelegate>


@property (nonatomic) CRCurrencyRequest *req;
@property (weak, nonatomic) IBOutlet UIButton *convertButton;
@property (weak, nonatomic) IBOutlet UITextField *inputField;
@property (weak, nonatomic) IBOutlet UILabel *currencyA;
@property (weak, nonatomic) IBOutlet UILabel *currencyB;
@property (weak, nonatomic) IBOutlet UILabel *currencyC;
@end

@implementation ViewController

- (IBAction)buttonTaped:(id)sender {
    self.convertButton.enabled = NO;
    
    self.req =[[CRCurrencyRequest alloc]init];
    self.req.delegate = self;
    [self.req start];
    
    
    
}

- (void)currencyRequest:(CRCurrencyRequest *)req
    retrievedCurrencies:(CRCurrencyResults *)currencies{
    self.convertButton.enabled = YES;
    
    double inputValue = [self.inputField.text floatValue];
    
    double euroValue = inputValue *currencies.EUR;
    double ronValue = inputValue *currencies.RON;
    double mxnValue = inputValue *currencies.MXN;
    
    NSString *euOut = [NSString stringWithFormat:@"%.2f",euroValue];
    NSString *ronOut = [NSString stringWithFormat:@"%.2f",ronValue];
    NSString *mxnOut = [NSString stringWithFormat:@"%.2f",mxnValue];
    
    self.currencyA.text = euOut;
    self.currencyB.text = mxnOut;
    self.currencyC.text = ronOut;
}


@end
