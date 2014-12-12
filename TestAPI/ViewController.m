//
//  ViewController.m
//  TestAPI
//
//  Created by Faik Catibusic on 12/9/14.
//  Copyright (c) 2014 Academy387. All rights reserved.
//

#import "ViewController.h"
#import "MemoryStorage.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)saveData:(id)sender {
    NSString *webAddress = @"https://someaddress/element";
    NSURL *serverUrl = [[NSURL alloc] initWithString:webAddress];
    
    NSString* formData = [[NSString alloc] initWithFormat:@"key=%@&value=%@&group=%@", @"Very Random Key", @"Very Random Value", @"SomeGroup"];
    NSData* data = [formData dataUsingEncoding:NSASCIIStringEncoding];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:serverUrl];
    [request setHTTPBody:data];
    [request setHTTPMethod:@"POST"];
    
    // Connection
    [NSURLConnection sendAsynchronousRequest:request queue:[[NSOperationQueue alloc] init] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        NSLog(@"%@", @"Okay");
    }];
}

- (IBAction)getData:(id)sender {
    NSString *webAddress = @"https://someaddress/";
    NSURL *serverUrl = [[NSURL alloc] initWithString:webAddress];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:serverUrl];
    
    // Connection
    [NSURLConnection sendAsynchronousRequest:request queue:[[NSOperationQueue alloc] init] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        NSDictionary* responseDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        NSLog(@"%@", responseDict);
    }];
}

- (IBAction)getDataOneElmenet:(id)sender {
    NSString *webAddress = @"https://someaddress/elemeent/1";
    NSURL *serverUrl = [[NSURL alloc] initWithString:webAddress];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:serverUrl];
    
    // Connection
    [NSURLConnection sendAsynchronousRequest:request queue:[[NSOperationQueue alloc] init] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        NSDictionary* responseDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        NSLog(@"%@", responseDict);
    }];
}

-(IBAction)getGroupElements:(id)sender {
    NSString *webAddress = @"https://someaddress/group/App1";
    NSURL *serverUrl = [[NSURL alloc] initWithString:webAddress];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:serverUrl];
    
    // Connection
    [NSURLConnection sendAsynchronousRequest:request queue:[[NSOperationQueue alloc] init] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        NSDictionary* responseDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        NSLog(@"%@", responseDict);
    }];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
