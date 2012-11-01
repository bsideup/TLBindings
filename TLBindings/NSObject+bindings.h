//
// Created by bsideup on 01.11.12.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>

@class WhenObserver;

@interface NSObject (bindings)

- ( void ) bindProperty:(NSString *)sourcePropertyKeyPath
			 toProperty:(NSString *)targetPropertyKeyPath
					 of:(id)targetPropertyOwner
	 withTransformation:(id (^)(id))aValueBlock;

- ( void ) unbindProperty:(NSString *)sourcePropertyKeyPath;
@end