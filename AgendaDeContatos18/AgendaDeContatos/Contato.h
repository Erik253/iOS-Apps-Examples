//Classe Contato.h
// - Assinatura de Getters and Setters

#import <Foundation/Foundation.h>


// ":" significa herenca
@interface Contato : NSObject



    //---Declaracao das Properties da clase--//

    //Fazer isso eh o mesmo de declarar um "atrubito nome", "setNome"e "getNome"
    @property NSString * nome;
    @property NSString * endereco;
    @property NSString * telefone;
    @property NSString * site;
    @property NSString * email;

@end
