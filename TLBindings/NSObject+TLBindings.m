//
// Created by bsideup on 01.11.12.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <objc/runtime.h>
#import "NSObject+TLBindings.h"

static char bindingsKey;

@implementation NSObject (TLBindings)

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

- ( WhenObserver * ) bindProperty:(NSString *)sourcePropertyKeyPath
			 toProperty:(NSString *)targetPropertyKeyPath
					 of:(id)targetPropertyOwner
{
	return [self bindProperty:sourcePropertyKeyPath toProperty:targetPropertyKeyPath of:targetPropertyOwner withTransformation:nil];
}

- ( WhenObserver * ) bindStringProperty:(NSString *)sourcePropertyKeyPath
				   toProperty:(NSString *)targetPropertyKeyPath
						   of:(id)targetPropertyOwner
			 withStringFormat:(NSString *)stringFormat
{
	return [self bindProperty:sourcePropertyKeyPath toProperty:targetPropertyKeyPath of:targetPropertyOwner withTransformation:^( id newValue )
	{
		return [NSString stringWithFormat:stringFormat, newValue];
	}];
}

- ( WhenObserver * ) bindProperty:(NSString *)sourcePropertyKeyPath
			 toProperty:(NSString *)targetPropertyKeyPath
					 of:(id)targetPropertyOwner
	 withTransformation:(id (^)(id))aValueBlock
{
	NSMutableDictionary *bindings = self.getBindings;

	WhenObserver *observer = [[WhenObserver alloc] initWithProperty:targetPropertyKeyPath of:targetPropertyOwner doBlock:^( id newValue )
	{
		[self setValue:( aValueBlock ? aValueBlock( newValue ) : newValue ) forKeyPath:sourcePropertyKeyPath];
	}];

	[bindings setObject:observer forKey:sourcePropertyKeyPath];

	return observer;
}

- ( void ) unbindProperty:(NSString *)sourcePropertyKeyPath
{
	NSMutableDictionary *result = objc_getAssociatedObject( self, &bindingsKey );

	if ( result )
	{
		[result removeObjectForKey:sourcePropertyKeyPath];
	}
}

- (void) unbindAll
{
	NSMutableDictionary *result = objc_getAssociatedObject( self, &bindingsKey );

	if ( result )
	{
		[result removeAllObjects];
	}

}

@end