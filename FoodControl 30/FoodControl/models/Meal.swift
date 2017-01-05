//class Meal.swift

import Foundation


//Protocolo NSCoding padrão do iOS para serializar um objeto

class Meal: NSObject, NSCoding{
    
    
    //Atributos - Obs: Os atributos estao sendo inicializados no construtor
    let name:      String
    let happiness: Int
    let items:     Array<Item>


    
    
    //Utilizando um construtor para a classe.
    //Quando tenho um construtor que inicializa todos os atributos, eu nao preciso informar o valor inicial nos atributos e nem dizer que sao opcionais. Com execao do itemsRecebidos que foi inicializado com vazio. O que permite a criacao do objeto sem items.
    init( nameRecebido: String, hapinessRecebido: Int, itemsRecebidos: Array<Item> = []){
        
        
        self.name      = nameRecebido
        self.happiness = hapinessRecebido
        self.items     = itemsRecebidos
    
    }//init
    
    
    
    
    //Calcula o total de calorias de uma Meal
    func calculaTotalCalorias() -> Double{
        
        var total: Double = 0.0
        
        
        //Percorrer todas as posicoes do array
        for i in items{
            
            total = total + i.calories
        }
        
        return total
    
    }//calculaTotalCalorias
    
    
    
    
    
    //Prepara uma String com informacoes a serem mostradas na janela de alerta ao clicar em um item da tabela da tela "MealsTableViewConstroller"
    func mensagemDaJanelaDeAlerta() -> String{
    
     
        
        //mensagem que vai aparecer na janela de popup
        var mensagemDaJanela: String = "Happiness: \(happiness) \n\nItens dessa refeição:\n"
        
        
        
        //Adicionando as informacoes de todos os items da meal na String que criei acima
        for aux in items {
            
            mensagemDaJanela += "\n \(aux.name) - Calories: \(aux.calories)"
            
        }//for
    
        
    
        return mensagemDaJanela
        
        
    }//mensagemDaJanelaDeAlerta
    

    
    
    
    //Funcao com implementacao obrigatoria ao herdar o protocolo "NSCoding"
    func encode( with aCoder: NSCoder ) {
        
        print("\nSerializando o arquivo\n")
        
        aCoder.encode( name,      forKey: "chaveName"      )
        aCoder.encode( happiness, forKey: "chaveHappiness" )
        aCoder.encode( items,     forKey: "chaveItems"     )
  
    }//encode
    
    
    
    
    //Deserializador
    required init?( coder aDecoder: NSCoder ) {
        
        print("\nDeserializando o arquivo\n")
        
        
        self.name      = aDecoder.decodeObject ( forKey: "chaveName"     ) as! String
        self.happiness = aDecoder.decodeInteger( forKey: "chaveHappiness") 
        self.items     = aDecoder.decodeObject ( forKey: "chaveItems"    ) as! Array
        
        
    }//Deserializador
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

}//class
