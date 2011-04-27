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
#define duracao 0.1

//Variáveis Globais de direção
BOOL turnLeft= NO;
BOOL turnRight= NO;
BOOL goDown = NO;
BOOL goUp= NO;




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
    [[CCEventDispatcher sharedDispatcher] addKeyboardDelegate:self priority:0];
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super" return value
	if( (self=[super init])) {
		forest = [[Floresta alloc]init];
        explorer= [[Explorador alloc]init];
        
        //Cria um array de Sprites com os Sprites da floresta.
        arraySprites = [NSMutableArray arrayWithCapacity:tamanho];
        for (int i=0;i<tamanho;i++)
            [arraySprites addObject:[NSMutableArray array]];
        for(int i=0;i<tamanho;i++)
            for(int j=0;j<tamanho;j++){
                sprite=[[forest getMatoX:i Y:j]getSprite];
                [[arraySprites objectAtIndex:i]addObject:sprite];
                [sprite release];
            }
        
        // ask director the the window size
        size = [[CCDirector sharedDirector] winSize];
        
        //Seta a posição inicial dos Sprites na tela.
        for(int i=0;i<tamanho;i++)
            for(int j=0;j<tamanho;j++)
                [[[arraySprites objectAtIndex:i]objectAtIndex:j] setPosition:ccp( size.width /(tamanho+1)*(i+1) , size.height/(tamanho+1)*(j+1) )];
        
        //Bota o EXPLORADOR NA TELA!
        [[explorer getSprite] setPosition:ccp( size.width /(tamanho+1) , size.height/(tamanho+1))];
        
        //Adiciona os Sprites como filhos.
        for(int i=0;i<tamanho;i++)
            for(int j=0;j<tamanho;j++)
                if([[arraySprites objectAtIndex:i]objectAtIndex:j]!=Nil)
                    [self addChild:[[arraySprites objectAtIndex:i]objectAtIndex:j]];
        //Seta o explorador como filho
        [self addChild:[explorer getSprite]];
        //Começa o loop
        NSLog(@"%lu",[[forest getMatoX:0 Y:0] retainCount]);
        [self schedule:@selector(gameLoop:)];
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

-(BOOL)ccKeyDown:(NSEvent *)event{
    //123 esquerdo
    //124 direito
    //125 baixo
    //126 cima
    if ([event keyCode]==123) {
        NSLog(@"OLA MUNDO , Apertei a tecla:%@",[event characters]);
        turnLeft = YES;
    }
    else if ([event keyCode]==124) {
        NSLog(@"OLA MUNDO , Apertei a tecla:%@!",[event characters]);
        turnRight = YES;
    }
    else if ([event keyCode]==125) {
        NSLog(@"OLA MUNDO , Apertei a tecla:%@!",[event characters]);
        goDown = YES;
    }
    else if ([event keyCode]==126) {
        NSLog(@"OLA MUNDO , Apertei a tecla:%@!",[event characters]);
        goUp = YES;
    }
    return YES;
}

-(void)gameLoop:(ccTime)dt
{
    
    //LOOP DO JOGO
    if (turnRight) {
        //Move explorador para a direita - MOVES EXPLORER TO THE RIGHT
        if([explorer getPos].x < tamanho){
            [explorer setPosX:[explorer getPos].x + 1 Y:[explorer getPos].y];
            id actionMove = [CCMoveTo actionWithDuration:duracao
                                                position:ccp(size.width /(tamanho+1)*[explorer getPos].x,  size.height/(tamanho+1)*[explorer getPos].y)];
            //Realiza efeito no explorador
           // Mato * mato = [forest getMatoX:0 Y:0];
            //ERROR TRYING TO ACCESS THIS!!!!!!
           NSLog(@"%lu",[forest retainCount]);
            NSLog(@"%d",[explorer getVida]);
            [[explorer getSprite] runAction:actionMove];
        }
        turnRight=NO;
    }
    else  if (turnLeft) {
        //Move explorador para a esquerda - MOVES EXPLORER TO THE LEFT
        if([explorer getPos].x > 1){
            [explorer setPosX:[explorer getPos].x - 1 Y:[explorer getPos].y];
            id actionMove = [CCMoveTo actionWithDuration:duracao 
                                                position:ccp(size.width /(tamanho+1)*[explorer getPos].x,  size.height/(tamanho+1)*[explorer getPos].y)];
            
            [[explorer getSprite] runAction:actionMove];
        }
        turnLeft=NO;
    }
    else  if (goUp) {
        //Move explorador para cima  - MOVES EXPLORER UP
        if([explorer getPos].y < tamanho){
            [explorer setPosX:[explorer getPos].x Y:[explorer getPos].y + 1];
            id actionMove = [CCMoveTo actionWithDuration:duracao
                                                position:ccp(size.width /(tamanho+1)*[explorer getPos].x,  size.height/(tamanho+1)*[explorer getPos].y)];
            
            [[explorer getSprite] runAction:actionMove];
        }
        goUp=NO;
    }
    else  if (goDown) {
        //Move explorador para a baixo  - MOVES EXPLORER DOWN
        if([explorer getPos].y >1){
            [explorer setPosX:[explorer getPos].x Y:[explorer getPos].y - 1];
            id actionMove = [CCMoveTo actionWithDuration:duracao
                                                position:ccp(size.width /(tamanho+1)*[explorer getPos].x,  size.height/(tamanho+1)*[explorer getPos].y)];
            [[explorer getSprite] runAction:actionMove];
        }
        
        goDown=NO;
        
    }
}


@end

