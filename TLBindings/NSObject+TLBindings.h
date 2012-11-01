//
// Created by bsideup on 01.11.12.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>

@class WhenObserver;

@interface NSObject (TLBindings)

- ( void ) bindProperty:(NSString *)sourcePropertyKeyPath
			 toProperty:(NSString *)targetPropertyKeyPath
					 of:(id)targetPropertyOwner
	 withTransformation:(id (^)(id))aValueBlock;

- ( void ) bindProperty:(NSString *)sourcePropertyKeyPath
			 toProperty:(NSString *)targetPropertyKeyPath
					 of:(id)targetPropertyOwner;

- ( void ) bindStringProperty:(NSString *)sourcePropertyKeyPath
			 toProperty:(NSString *)targetPropertyKeyPath
					 of:(id)targetPropertyOwner
	 withStringFormat:(NSString *)stringFormat;

- ( void ) unbindProperty:(NSString *)sourcePropertyKeyPath;
@end