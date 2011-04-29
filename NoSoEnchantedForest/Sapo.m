//
//  MyClass.m
//  NoSoEnchantedForest
//
//  Created by Cesar Vargas on 28/04/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Sapo.h"


@implementation Sapo

- (id)init
{
    self = [super init];
    if (self) {
    //TODO falta colocar foto sapo
            CCSprite* _sprite = [[CCSprite alloc] initWithFile:@"sapo.png"];
            sprite=[_sprite retain];
            [_sprite release];
    }
    
    return self;
}

- (void)dealloc
{
    [super dealloc];
}

-(void)efeito:(Explorador*)explorador{
    [explorador setVida:[explorador getVida]-1];
}

@end
