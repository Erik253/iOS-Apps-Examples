//  ViewControllerDelegate_to_NewItemViewController.swift
//  FoodControl


import Foundation


//protocolo de comunicacao - Isso faz com que um "objeto dessa classe" possa executar metodos de outras classes. Eh uma forma de comunicao entre as classes do projeto.
protocol ViewControllerDelegate_to_NewItemViewController{
    
    
    //Permitindo acesso a Funcao "addItem()" da classe ViewController
    func addItem( _ itemRecebido: Item )
    
    
}
