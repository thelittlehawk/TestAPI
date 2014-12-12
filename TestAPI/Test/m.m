//
//  m.m
//  TestAPI
//
//  Created by Faik Catibusic on 12/9/14.
//  Copyright (c) 2014 Academy387. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Test : NSObject


@end

@implementation Test

-(void)test {
    NSString* formData = [[NSString alloc] initWithFormat:@"key=%@&value=%@&group=%@", @"Very Random Key", @"Very Random Value", @"SomeGroup"];
    NSData* data = [formData dataUsingEncoding:NSASCIIStringEncoding];
    
    NSString* serverPath = [NSString stringWithFormat:@"http://169.254.95.29:8080/element/"];
    NSURL* serverUrl = [[NSURL alloc] initWithString:serverPath];
    
    NSMutableURLRequest* request = [[NSMutableURLRequest alloc] initWithURL:serverUrl];
    [request setHTTPBody:data];
    [request setHTTPMethod:@"POST"];
    
    [NSURLConnection sendAsynchronousRequest:request queue:[[NSOperationQueue alloc] init] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        if(connectionError == nil) {
            //[self.navigationController popViewControllerAnimated:NO];
        }
    }];
}


-(void)normalTest {
    
    NSString* serverPath = [NSString stringWithFormat:@"http://127.0.0.1:8080/"];
    NSURL* serverUrl = [[NSURL alloc] initWithString:serverPath];
    
    NSMutableURLRequest* request = [[NSMutableURLRequest alloc] initWithURL:serverUrl];
    
    [NSURLConnection sendAsynchronousRequest:request queue:[[NSOperationQueue alloc] init] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        if(connectionError == nil) {
            //[self.navigationController popViewControllerAnimated:NO];
        }
        NSDictionary* responseDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        NSLog(@"%@", responseDict);
    }];
}

-(void)syncTest {
    NSString* serverPath = [NSString stringWithFormat:@"http://127.0.0.1:8080/"];
    NSURL* serverUrl = [[NSURL alloc] initWithString:serverPath];
    
    NSMutableURLRequest* request = [[NSMutableURLRequest alloc] initWithURL:serverUrl];
    
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
                               NSDictionary* responseDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
                               NSLog(@"%@", responseDict);
                           }];
}

@end