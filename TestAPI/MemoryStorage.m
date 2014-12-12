
#import "MemoryStorage.h"

@implementation MemoryStorage

+ (id)sharedManager {
    static MemoryStorage *memoryStorage = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        memoryStorage = [[self alloc] init];
    });
    return memoryStorage;
}

- (id)init {
    if (self = [super init]) {
        self.someProperty = @"Some String";
        self.array = [[NSMutableArray alloc] init];
    }
    return self;
}

@end
