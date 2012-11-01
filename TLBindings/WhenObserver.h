//
// Created by bsideup on 31.10.12.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>


@interface WhenObserver : NSObject

- ( id ) initWithProperty:(NSString *)aProperty
					   of:(NSObject *)aOf
				  doBlock:(void (^)(id))aBlock;

@end