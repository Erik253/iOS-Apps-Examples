//Classe Contato.m

#import "Contato.h"

@implementation Contato


    //Sobreescrevendo o metodo "description() hedaddo da classe mae "NSObject"
    -( NSString * ) description{
        
        
        //Formatando a string que vai ser retornada
        NSString *dadosRetornados = [ NSString stringWithFormat: @"\rConteudo preenchido no formulario: \r Nome: %@ \r Endereco: %@ \r Telefone: %@ \r Site: %@ \r E-mail: %@"
                           , self.nome, self.endereco, self.telefone, self.site, self.email];
 
    
        return dadosRetornados;
    }


@end
