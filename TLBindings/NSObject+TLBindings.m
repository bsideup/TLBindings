//
// Created by bsideup on 01.11.12.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "NSObject+TLBindings.h"
#import "TLWhenObserver.h"

@implementation NSObject (TLBindings)

- ( TLWhenObserver * ) bind:(NSString *)sourcePropertyKeyPath
				 toProperty:(NSString *)targetPropertyKeyPath
						 of:(id)targetPropertyOwner
{
	return [self bind:sourcePropertyKeyPath toProperty:targetPropertyKeyPath of:targetPropertyOwner withTransformation:nil];
}

- ( TLWhenObserver * ) bindString:(NSString *)sourcePropertyKeyPath
					   toProperty:(NSString *)targetPropertyKeyPath
							   of:(id)targetPropertyOwner
				 withStringFormat:(NSString *)stringFormat
{
	return [self bind:sourcePropertyKeyPath toProperty:targetPropertyKeyPath of:targetPropertyOwner withTransformation:^( id newValue )
	{
		return [NSString stringWithFormat:stringFormat, newValue];
	}];
}

- ( TLWhenObserver * ) bind:(NSString *)sourcePropertyKeyPath
				 toProperty:(NSString *)targetPropertyKeyPath
						 of:(id)targetPropertyOwner
		 withTransformation:(id (^)(id))aValueBlock
{
	TLWhenObserver *observer = [[TLWhenObserver alloc] initWithProperty:targetPropertyKeyPath of:targetPropertyOwner doBlock:^( id newValue )
	{
		[self setValue:( aValueBlock ? aValueBlock( newValue ) : newValue ) forKeyPath:sourcePropertyKeyPath];
	}];

	return observer;
}

@end