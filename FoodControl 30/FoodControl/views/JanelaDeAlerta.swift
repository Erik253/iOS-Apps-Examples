//  JanelaDeAlerta.swift

import Foundation
import UIKit



class JanelaDeAlerta{
    
    
    //Atributo que eh inicializado no construtor.
    //Esse atributo so vai servir para apresentar a janela na tela
    let referenciaDeController: UIViewController
    
    
    
    //Construtor
    init( controllerRecebido: UIViewController){
    
        self.referenciaDeController = controllerRecebido
    
    }//init
    
    
    
    
    
    //Cria e exibibe uma janela de alerta na tela com a mensagem que foi recebida como paramentro
    func show( mensagemRecebida: String = "Occoreu um erro não espeficado :(" ){
    
    
        //Criando uma janela de alerta para ser exibida na tela
        //  title         : Titulo da janela
        //  message       : mensagem da janela
        //  prefereedStyle: Aparencia da janela
        let janelaDeAlerta: UIAlertController = UIAlertController(
            title         : "Sorry",
            message       : mensagemRecebida,
            preferredStyle: UIAlertControllerStyle.alert )
    
    
    
    
        //Criando o botao para a janela de alerta
        // - tittle: Texto do botao
        // - style : Aparencia do botao
        // - handler: acao adicional a ser realizada apos clicar no botao
        let botaoOk: UIAlertAction = UIAlertAction( title  : "I got it",
                                                    style  : UIAlertActionStyle.cancel,
                                                    handler: nil)
    
    
        //Adicionando o botao na janela de alerta
        janelaDeAlerta.addAction( botaoOk )
    
    
    
        //Mostrar a janela na tela do device
        //  - Qual janela quer chamar
        //  - Animated  : animacao de transicao ao abrir a janela
        //  - completion: Acao a ser realizada depois que a janela foi mostrada na tela
        referenciaDeController.present( janelaDeAlerta, animated:  true, completion: nil )


    }//show
    
    


}//class
