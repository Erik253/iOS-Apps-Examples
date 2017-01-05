
//Aqui eu declaro as assinaturas dos metodos utilizados no "ViewController.h"



#import <UIKit/UIKit.h>
#import "ContatoDao.h"
#import "ListaContatosViewController.h"


//Criando um protocolo.
@protocol ViewControllerDelegate <NSObject>
    @required
    -(void)contatoAdicionado: (Contato *)contato;
    -(void)contatoAtualizado: (Contato *)contato;

@end



@interface ViewController : UIViewController


    //Ligando os textFields da tela com o codigo. Feito isso posso manipular esses objetos no codigo do ViewController.m.
    @property IBOutlet UITextField *outletNome;
    @property IBOutlet UITextField *outletTelefone;
    @property IBOutlet UITextField *outletEndereco;
    @property IBOutlet UITextField *outletSite;
    @property IBOutlet UITextField *outletEmail;



    //Declarando um objeto como propriedade.Lembrando que esse objeto tem um Array dentro dele
    @property ContatoDao *dao;


    //Declarando um objeto como propriedade.
    @property Contato *contato;



    @property id<ViewControllerDelegate> *delegate;




@end

