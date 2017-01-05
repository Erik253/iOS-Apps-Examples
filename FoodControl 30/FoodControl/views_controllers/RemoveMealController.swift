//  RemoveMealController.swift
//  FoodControl


import Foundation
import UIKit




class RemoveMealController{
    
    
    //variavel inicializado no init
    let controllerRecebido: UIViewController
    
    
    
    
    //contrutor
    init( controllerRecebido: UIViewController ){
    
        self.controllerRecebido = controllerRecebido
    
    
    }//init
    
    
    
    
    
    
    /*Essa funca mostra a janela de alerta
     com as opcoes "ok" e "remover" quando o usuario der um clique longo em um item da tabela.
     Esse metodo recebe:
     
     - mealRecebida   : E a meal no qual a linha da tabela faz referencia
     - handlerRecebido: Aqui eh meio estranho e ao meu ver desnecessario, mas eu estou recebendo por parametro "Instrucoes para serem executadas" (closure).
     E essa palavra "@escaping" é só pra dizer que recebi instrucoes por parametro.

      Esse conceito ai de receber/passar instrucoes por parametro pode ser chamado de closure
     */
    func showJanelaDeAlerta( mealRecebida: Meal, handlerRecebido: @escaping ( UIAlertAction ) -> Void     ){
        
        
        
        
        //Criando uma janela popup de alerta
        //  title         : Texto que vai aparecer no titulo
        //  message       : Texto que vai aparecer no corpo da janela
        //  preferredStyle: Estilo da janela
        let janelaDeAlerta: UIAlertController = UIAlertController(
            title         : mealRecebida.name,
            message       : mealRecebida.mensagemDaJanelaDeAlerta(),
            preferredStyle: UIAlertControllerStyle.alert)
        
        

        
        
        
        //Criando um botao de acao para a janela de alerta que foi criada
        // - Title  : Titulo do botao
        // - style  : Aparencia do botao
        // - handler: Acao a ser realizada apos criar no botao
        let botaoRemove: UIAlertAction = UIAlertAction( title  : "Remove",
                                                        style  : UIAlertActionStyle.destructive,
                                                        handler: handlerRecebido )
        
        
        

        //Adicionando o botaoRemove na janela
        janelaDeAlerta.addAction( botaoRemove )
        
        
        
    
        //Criando um botao de acao para a janela de alerta que foi criada
        // - Title  : Titulo do botao
        // - style  : Aparencia do botao
        // - handler: Acao a ser realizada apos criar no botao
        let botaoCancelarDaJanela: UIAlertAction  = UIAlertAction(
            title: "Cancelar",
            style: UIAlertActionStyle.cancel,handler: nil )
        
        
        
        //Adicionando o botaoCancelarDaJanela na janela
        janelaDeAlerta.addAction( botaoCancelarDaJanela )
        
        
    
        
        //Chamando a janela de alerta
        //  - Qual janela quer chamar
        //  - Animated  : animacao de transicao ao abrir a janela
        //  - completion: Acao a ser realizado depois que a janela foi mostrada na tela
        controllerRecebido.present( janelaDeAlerta, animated: true, completion: nil)

    
    
    }




}//RemoveMealController
