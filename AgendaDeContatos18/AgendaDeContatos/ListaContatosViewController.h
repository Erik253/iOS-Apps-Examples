//  ListaContatosViewController.h

#import <UIKit/UIKit.h>
#import "ContatoDao.h"
#import "ViewController.h"

//Heranca de UITableViewController" tem caracteristicas de uma tabela
//Entre <> vao os protocolos implementados
@interface ListaContatosViewController : UITableViewController <ViewControllerDelegate>


    //Declarando um objeto como propriedade.Lembrando que esse objeto tem um Array dentro dele
    @property ContatoDao *dao;


    @property Contato *contatoSelecionado;


    //Assinatura de metodos
    -(void) contatoAdicionado: (Contato *) contato;

    -(void) contatoAtualizado: (Contato *) contato;



@end
