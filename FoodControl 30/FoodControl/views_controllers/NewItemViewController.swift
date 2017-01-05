//  NewItemViewController.swift
//  FoodControl


import UIKit


class NewItemViewController: UIViewController {
    
    //Outlets com os textFields da tela
    @IBOutlet var nameField    : UITextField?
    @IBOutlet var caloriesField: UITextField?
    
    
    //Variavel Delegate do Protocol "ViewControllerDelegate_to_NewItemViewController" 
    //Para acesssar o metodo "addItem()"
    var delegate: ViewControllerDelegate_to_NewItemViewController?


    
    //Construtor
    init( delegateRecebido: ViewControllerDelegate_to_NewItemViewController ){
    
        //Chamando o construtor da classe mae para nao perder as caracteristicas de um obj UIViewController. Os argumentos pedidos sao padroes.
        super.init( nibName: "NewItemViewController", bundle: nil )
        
        
        //Pegando a referencia do delegate que veio no construtor
        self.delegate = delegateRecebido
    
    }
    
    
    //Esse construtor so foi implementado pois o iOS me obrigou a coloca-lo aqui
    required init?( coder aDecoder: NSCoder ) {
        super.init( coder: aDecoder )
    }
    
    
    
    
    
    
    //Funcao ao clicar no botao add da tela
    @IBAction func addNewItem(){
    
        
        //Extraindo o conteudo dos textFields
        let name     = nameField!.text
        let calories = Double( caloriesField!.text! )
        
        
        //Verificando se os campos estao vazios
        if( name == nil || calories == nil || delegate == nil){
          
            
            //Verificando se o atributo opcional navigationController esta nulo
            //Le se: Se o atributo navigationController nao estiver vazio, entao...
            if let auxNavigationController = navigationController {
                
                
                //Voltar para tela anterior
                auxNavigationController.popViewController(animated: true)
                
            }
            
            return
        
        }
        
        
        
        
    
        //Variavel para receber os dados digitados na tela
        let itemAdicionado: Item = Item( nameRecebido: name!, caloriesRecebido: calories! )
        
        
        //Adicionando o item criado no arrayDeItems da classe ViewController atraves do delegate
        delegate!.addItem( itemAdicionado )
        
        
        
        //Verificando se o atributo opcional navigationController esta nulo
        //Le se: Se o atributo navigationController nao estiver vazio, entao...
        if let auxNavigationController = navigationController {
        
            
            //Voltar para tela anterior
            auxNavigationController.popViewController(animated: true)
        
        }
        
    }//addNewItem
    
    
    


}
