//
//  Perigo.m
//  NoSoEnchantedForest
//
//  Created by Cesar Vargas on 19/04/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Cobra.h"


@implementation Cobra

-(id)init
{
    self = [super init];
    if (self) {
        CCSprite* _sprite = [[CCSprite alloc] initWithFile:@"perigo.png"];
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
    [explorador setVida:[explorador getVida]-2];
}
@end
