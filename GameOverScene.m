//
//  GameOverScene.m
//  NoSoEnchantedForest
//
//  Created by Cesar Vargas on 01/05/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "GameOverScene.h"
#import "HelloWorldLayer.h"

@implementation GameOverScene
@synthesize layer = _layer;

- (id)init {
    
    if ((self = [super init])) {
        self.layer = [GameOverLayer node];
        [self addChild:_layer];
    }
    return self;
}

- (void)dealloc {
    [_layer release];
    _layer = nil;
    [super dealloc];
}

@end

@implementation GameOverLayer
@synthesize label = _label;

-(id) init
{
    if( (self=[super initWithColor:ccc4(255,255,255,255)] )) {
        
        CGSize winSize = [[CCDirector sharedDirector] winSize];
        self.label = [CCLabelTTF labelWithString:@"" fontName:@"Arial" fontSize:32];
        _label.color = ccc3(0,0,0);
        _label.position = ccp(winSize.width/2, winSize.height/2);
        [self addChild:_label];
        [self runAction:[CCSequence actions:
                         [CCDelayTime actionWithDuration:5],
                         [CCCallFunc actionWithTarget:self selector:@selector(gameOverDone)],
                         nil]];
    }	
    return self;
}

- (void)gameOverDone {
    [[CCEventDispatcher sharedDispatcher]removeAllKeyboardDelegates];
    [[CCEventDispatcher sharedDispatcher] addKeyboardDelegate:[[HelloWorldLayer scene]getChildByTag:1] priority:0];
    [[CCDirector sharedDirector] replaceScene:[HelloWorldLayer scene]];
    
}

- (void)dealloc {
    [_label release];
    _label = nil;
    [super dealloc];
}

@end