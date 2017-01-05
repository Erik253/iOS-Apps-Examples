//  Delegate_MealsTableViewController.swift


import Foundation


//protocolo de comunicacao - Isso faz com que um "objeto dessa classe" posso executar metodos de outras classes. Eh uma forma de comunicao entre as classes do projeto.
protocol ViewControllerDelegate{


    //Permitindo acesso a Funcao da classe MealsTableViewController
    func add( _ refeicaoRecebida: Meal )


}
