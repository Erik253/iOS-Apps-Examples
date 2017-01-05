//  ContatoDao.m


#import "ContatoDao.h"

@implementation ContatoDao


    //Declarando um objeto static.
    //Eh tipo um objeto global
    static ContatoDao *objeto_static_dao = nil;




    //Sobreescrevendo o Construtor que eh o metodo init.
    //Esse metodo init eh o que o comando "new" faz quando crio um objeto.
    -(ContatoDao *) init {
    
        
        
        //Como estou sobreescrevendo o construtor "init"
        //Pois ao sobreescrever esse metodo objeto perde a heranca da classe mae que nesse casao eh a  "NSObject". Entao, eh necessario chamar o construtor da classe mae para continuar a herdar os comportamentos e caracteristicas da classe mae. Complicado de entender :(
        self = [ super init ];
    
    
        
        
        //Esse if eh um misterio. Nao entendi muito bem pra que serve
        if( self ){
        
            
            //inicializando o array que esta no .h
            self.arrayDeContatos = [ NSMutableArray new ];
        
        }//if
        
        
        
        
        //Retorna um objeto do tipo ContatoDao pronto.
        return self;
        
    
    }//init




    //Esse metodo retorna uma variavel static do tipo ContatoDao.
    //objeto static, significa que trata-se de um unico objeto, Eh tipo um objeto global para o App inteiro, tudo mundo pode alterar ou pegar o valor desse objeto.
    //Ai por ser um metodo que retorno um objeto static, tem que por o "+"na declaracao no metodo.
    + ( ContatoDao * ) contatoDaoInstance{
    
        
        
        //Se ja existe
        if( !objeto_static_dao ){
            
            objeto_static_dao = [ ContatoDao new ];
        
        }//if
        
        
        return objeto_static_dao;
        
        
    }//contatoDaoInstance






    //Metodo adiciona para adicionar um item no Array que esta no .h
    - (void) adicionaContato: ( Contato *) contatoRecebido{
    
        
        //adicionando o item recebido no array
        [ self.arrayDeContatos addObject: contatoRecebido];
    

    }//adicionaContato




    //Delecao de contato
    - (void) removeContato: (Contato *) contatoRecebido{
        
        
        //Deletando uma posicao especifica do arrayDeContatos
        [self.arrayDeContatos removeObject: contatoRecebido];
    
        

        
    
    }//removeContato




    //Metodo adiciona para adicionar um item no Array que esta no .h
    - ( NSInteger ) getTamanhoDoArray{
    
    
        //Retornando a quantidade de itens do array
        return self.arrayDeContatos.count;
    
    
    }//getTamanhoDoArray




    //Devolve um obj do tipo Contato que esta dentro de uma posicao do Array
    - ( Contato * ) getContatoDaPosicaoDoIndice: (NSInteger) indiceRecebido {
    
    
        //Retornando a quantidade de itens do array
        return self.arrayDeContatos[ indiceRecebido ];
    
    
    }//getContatoDaPosicaoDoIndice



@end
