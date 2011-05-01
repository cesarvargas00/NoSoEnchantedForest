//
//  Tambaqui.m
//  NoSoEnchantedForest
//
//  Created by Wellington Sousa Matos on 29/04/11.
//  Copyright 2011 Mackenzie. All rights reserved.
//

#import "Tambaqui.h"


@implementation Tambaqui
-(id)init
{
    self = [super init];
    if (self) {
        CCSprite* _sprite = [[CCSprite alloc] initWithFile:@"tambaqui.png"];
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
    if([explorador getVida]<=2)
    [explorador setVida:[explorador getVida]+3];
   else if([explorador getVida]>2)
        [explorador setVida:5];
        
}

@end
