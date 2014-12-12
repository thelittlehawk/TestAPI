//
//  MyManager.h
//  TestAPI
//
//  Created by Faik Catibusic on 12/11/14.
//  Copyright (c) 2014 Academy387. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MemoryStorage : NSObject

@property NSString *someProperty;

@property NSMutableArray *array;

+ (id)sharedManager;

@end
