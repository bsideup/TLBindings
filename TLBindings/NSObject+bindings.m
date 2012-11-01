//
// Created by bsideup on 01.11.12.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <objc/runtime.h>
#import "NSObject+bindings.h"
#import "WhenObserver.h"


static char bindingsKey;

@implementation NSObject (bindings)

- ( NSMutableDictionary * ) getBindings
{
	NSMutableDictionary *result = objc_getAssociatedObject( self, &bindingsKey );

	if ( result == nil )
	{
		result = [NSMutableDictionary dictionary];
		objc_setAssociatedObject( self, &bindingsKey, result, OBJC_ASSOCIATION_RETAIN );
	}

	return result;
}

- ( void ) bindProperty:(NSString *)sourcePropertyKeyPath
			 toProperty:(NSString *)targetPropertyKeyPath
					 of:(id)targetPropertyOwner
	 withTransformation:(id (^)(id))aValueBlock
{
	NSMutableDictionary *bindings = self.getBindings;

	WhenObserver *observer = [[WhenObserver alloc] initWithProperty:targetPropertyKeyPath of:targetPropertyOwner doBlock:^( id newValue )
	{
		[self setValue:aValueBlock( newValue ) forKeyPath:sourcePropertyKeyPath];
	}];

	[bindings setObject:observer forKey:sourcePropertyKeyPath];
}

- ( void ) unbindProperty:(NSString *)sourcePropertyKeyPath
{
	NSMutableDictionary *result = objc_getAssociatedObject( self, &bindingsKey );

	if ( result )
	{
		[result removeObjectForKey:sourcePropertyKeyPath];
	}
}

@end