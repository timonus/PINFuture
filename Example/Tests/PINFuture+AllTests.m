//
//  UtilTests.m
//  PINFuture
//
//  Created by Chris Danford on 12/5/16.
//  Copyright © 2016 Chris Danford. All rights reserved.
//

// https://github.com/Specta/Specta

#import "PINFuture.h"
#import "TestUtil.h"

SpecBegin(PINFutureAllSpecs)

describe(@"all", ^{
    it(@"resolves if all source promises resolve", ^{
        NSString *value1 = stringFixture();
        NSString *value2 = stringFixture();
        PINFuture<NSString *> *source1 = [PINFuture<NSString *> futureWithValue:value1];
        PINFuture<NSString *> *source2 = [PINFuture<NSString *> futureWithValue:value2];
        PINFuture<NSArray<NSString *> *> *arrayFuture = [PINFuture<NSString *> all:@[source1, source2]];
        expectFutureToResolveWith(self, arrayFuture, @[value1, value2]);
    });

    it(@"rejects if any source promise rejects", ^{
        NSString *value1 = stringFixture();
        NSError *error2 = errorFixture();
        PINFuture<NSString *> *source1 = [PINFuture<NSString *> futureWithValue:value1];
        PINFuture<NSString *> *source2 = [PINFuture<NSString *> futureWithError:error2];
        PINFuture<NSArray<NSString *> *> *arrayFuture = [PINFuture<NSString *> all:@[source1, source2]];
        expectFutureToRejectWith(self, arrayFuture, error2);
    });
});

SpecEnd
