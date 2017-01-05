// ContatoDao.h


#import <Foundation/Foundation.h>
#import "Contato.h"

@interface ContatoDao : NSObject


    //Declarando um Array como propriedade para o objeto.
    //Ai da para usar como se fosse uma variavel global
    @property NSMutableArray *arrayDeContatos;




    //Declarando uma assinatura de metodo. A implementacao esta no .m
    - (void) adicionaContato: ( Contato *) contatoRecebido;



    //Declarando uma assinatura de metodo. A implementacao esta no .m
    - ( NSInteger) getTamanhoDoArray;




    //Declarando uma assinatura de metodo. A implementacao esta no .m
    - ( Contato * ) getContatoDaPosicaoDoIndice: (NSInteger) indiceRecebido;


    - (void) removeContato: (Contato *) contato;



    //Declarando uma assinatura de metodo que retorna um objeto static, por isso tem que usar o caracter "+". A implementacao esta no .m
    + ( ContatoDao * ) contatoDaoInstance;


@end
