//
//  PINFutureUtil.h
//  Pods
//
//  Created by Chris Danford on 12/5/16.
//
//

#import "PINFuture.h"

NS_ASSUME_NONNULL_BEGIN

@interface PINFuture<ObjectType> (Util)

/**
 * From an array of Futures, create one new future that resolves with an array of the future values.
 * If any of the original futures reject, then the returned future rejects with the error of the first rejection.
 */
+ (PINFuture<NSArray<ObjectType> *> *)all:(NSArray<PINFuture<ObjectType> *> *)sourceFutures;

@end

NS_ASSUME_NONNULL_END
