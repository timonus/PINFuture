//
//  PINFuture+FlatMapError.h
//  Pods
//
//  Created by Chris Danford on 12/8/16.
//

#import "PINFuture.h"

@interface PINFuture<ObjectType> (FlatMapError)

- (PINFuture<ObjectType> *)context:(PINExecutionContext)context flatMapError:(PINFuture<ObjectType> *(^)(NSError *error))flatMapError;
- (PINFuture<ObjectType> *)flatMapError:(PINFuture<ObjectType> *(^)(NSError *error))flatMapError;

@end
