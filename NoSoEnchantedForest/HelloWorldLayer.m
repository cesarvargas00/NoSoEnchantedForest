//
//  HelloWorldLayer.m
//  NoSoEnchantedForest
//
//  Created by Cesar Vargas on 18/04/11.
//  Copyright __MyCompanyName__ 2011. All rights reserved.
//


// Import the interfaces
#define tamanho 5
#import "HelloWorldLayer.h"
#import "Floresta.h"

// HelloWorldLayer implementation
@implementation HelloWorldLayer

+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	HelloWorldLayer *layer = [HelloWorldLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

// on "init" you need to initialize your instance
-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super" return value
	if( (self=[super init])) {
		
		//Cria e aloca a Floresta.
        Floresta *forest = [[Floresta alloc]init];
        CCSprite* sprite;
        
        //Cria um array de Sprites com os Sprites da floresta.
        NSMutableArray* arraySprites = [NSMutableArray arrayWithCapacity:5];
        for (int i=0;i<tamanho;i++)
            [arraySprites addObject:[NSMutableArray array]];
        for(int i=0;i<tamanho;i++)
            for(int j=0;j<tamanho;j++){
                    sprite=[[forest getMatoX:i Y:j]getSprite];
                    [[arraySprites objectAtIndex:i]addObject:sprite];
            }
        
        
       // [[arraySprites objectAtIndex:0]removeObjectAtIndex:0];
        
       // [[arraySprites objectAtIndex:0]insertObject:[CCSprite spriteWithFile:@"mato.png"] atIndex:(0)];
        
		// ask director the the window size
		CGSize size = [[CCDirector sharedDirector] winSize];
        
		//Seta a posição dos Sprites na tela.
        for(int i=0;i<tamanho;i++)
            for(int j=0;j<tamanho;j++)
                [[[arraySprites objectAtIndex:i]objectAtIndex:j] setPosition:ccp( size.width /(tamanho+1)*(i+1) , size.height/(tamanho+1)*(j+1) )];
        		
        //Adiciona os Sprites como filhos.
        for(int i=0;i<tamanho;i++)
            for(int j=0;j<tamanho;j++)
                if([[arraySprites objectAtIndex:i]objectAtIndex:j]!=Nil)
                    [self addChild:[[arraySprites objectAtIndex:i]objectAtIndex:j]];
        
        //releases
        [forest release];
	}
    
	return self;
}

// on "dealloc" you need to release all your retained objects
- (void) dealloc
{
	// in case you have something to dealloc, do it in this method
	// in this particular example nothing needs to be released.
	// cocos2d will automatically release all the children (Label)
	
	// don't forget to call "super dealloc"
	[super dealloc];
}
@end
