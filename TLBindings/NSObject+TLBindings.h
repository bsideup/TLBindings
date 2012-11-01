//
// Created by bsideup on 01.11.12.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>
#import "WhenObserver.h"

@interface NSObject (TLBindings)

- ( WhenObserver * ) bindProperty:(NSString *)sourcePropertyKeyPath
			 toProperty:(NSString *)targetPropertyKeyPath
					 of:(id)targetPropertyOwner
	 withTransformation:(id (^)(id))aValueBlock;

- ( WhenObserver * ) bindProperty:(NSString *)sourcePropertyKeyPath
			 toProperty:(NSString *)targetPropertyKeyPath
					 of:(id)targetPropertyOwner;

- ( WhenObserver * ) bindStringProperty:(NSString *)sourcePropertyKeyPath
				   toProperty:(NSString *)targetPropertyKeyPath
						   of:(id)targetPropertyOwner
			 withStringFormat:(NSString *)stringFormat;

- ( void ) unbindProperty:(NSString *)sourcePropertyKeyPath;
@end