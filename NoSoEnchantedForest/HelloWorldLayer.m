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

//Variáveis Globais de direção
BOOL virarEsquerda = NO;
BOOL virarDireita = NO;
BOOL virarBaixo = NO;
BOOL virarCima = NO;

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
		
        self.isKeyboardEnabled;
         
        
		//Cria e aloca a Floresta.
        Floresta *forest = [[Floresta alloc]init];
        CCSprite* sprite;
        Explorador* explorador = [[Explorador alloc]init];
        
        //Cria um array de Sprites com os Sprites da floresta.
        NSMutableArray* arraySprites = [NSMutableArray arrayWithCapacity:tamanho];
        for (int i=0;i<tamanho;i++)
            [arraySprites addObject:[NSMutableArray array]];
        for(int i=0;i<tamanho;i++)
            for(int j=0;j<tamanho;j++){
                sprite=[[forest getMatoX:i Y:j]getSprite];
                [[arraySprites objectAtIndex:i]addObject:sprite];
                //verificar leaks
            }
        
        //Array Auxiliar Explorador
        NSMutableArray* arrayExplorador = [NSMutableArray arrayWithCapacity:tamanho];
        for (int i=0;i<tamanho;i++)
            [arrayExplorador addObject:[NSMutableArray array]];
        sprite = [explorador getSprite];
        [[arrayExplorador objectAtIndex:0]addObject:sprite];
        
        
        
        // [[arraySprites objectAtIndex:0]removeObjectAtIndex:0];
        
        // [[arraySprites objectAtIndex:0]insertObject:[CCSprite spriteWithFile:@"mato.png"] atIndex:(0)];
        
		// ask director the the window size
		CGSize size = [[CCDirector sharedDirector] winSize];
        
		//Seta a posição dos Sprites na tela.
        for(int i=0;i<tamanho;i++)
            for(int j=0;j<tamanho;j++)
                [[[arraySprites objectAtIndex:i]objectAtIndex:j] setPosition:ccp( size.width /(tamanho+1)*(i+1) , size.height/(tamanho+1)*(j+1) )];
        
        //Seta a posição dos Sprites na tela.
        for(int i=0;i<[arrayExplorador count] ;i++)
            for(int j=0;j<[arrayExplorador count];j++)
                //Bota o EXPLORADOR NA TELA!
                [[[arrayExplorador objectAtIndex:0]objectAtIndex:0] setPosition:ccp( size.width /(tamanho+1)*(0+2) , size.height/(tamanho+1)*(0+2) )];
        
        //Adiciona os Sprites como filhos.
        for(int i=0;i<tamanho;i++)
            for(int j=0;j<tamanho;j++)
                if([[arraySprites objectAtIndex:i]objectAtIndex:j]!=Nil)
                    [self addChild:[[arraySprites objectAtIndex:i]objectAtIndex:j]];
        //Seta o explorador como filho
        [self addChild:[[arrayExplorador objectAtIndex:0]objectAtIndex:0]];
        
        //LOOP DO JOGO
        if (virarDireita) {
            [[[arrayExplorador objectAtIndex:0]objectAtIndex:0] setPosition:ccp( size.width /(tamanho+1)*(0+2) , size.height/(tamanho+1)*(0+2) )];
            virarDireita=NO;
        }
        else  if (virarEsquerda) {
            virarEsquerda=NO;
        }
        else  if (virarCima) {
            virarCima=NO;
        }
        else  if (virarBaixo) {
            virarBaixo=NO;
            
        }

             
        
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

-(BOOL)ccKeyDown:(NSEvent *)event{
    //123 esquerdo
    //124 direito
    //125 baixo
    //126 cima
    if ([event keyCode]==123) {
        NSLog(@"OLA MUNDO , Apertei a tecla:%@",[event characters]);
        virarEsquerda = YES;
    }
    else if ([event keyCode]==124) {
        NSLog(@"OLA MUNDO , Apertei a tecla:%@!",[event characters]);
        virarDireita = YES;
    }
    else if ([event keyCode]==125) {
        NSLog(@"OLA MUNDO , Apertei a tecla:%@!",[event characters]);
        virarBaixo = YES;
    }
    else if ([event keyCode]==126) {
        NSLog(@"OLA MUNDO , Apertei a tecla:%@!",[event characters]);
        virarCima = YES;
    }
    return YES;
}




@end

