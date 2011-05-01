//
//  Cidade.m
//  NoSoEnchantedForest
//
//  Created by Cesar Vargas on 01/05/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Cidade.h"


@implementation Cidade

- (id)init
{
    self = [super init];
    if (self) {
        CCSprite* _sprite = [[CCSprite alloc] initWithFile:@"cidade.png"];
        sprite=[_sprite retain];
        [_sprite release];
    }
    
    return self;
}

- (void)dealloc
{
    [super dealloc];
}

@end
