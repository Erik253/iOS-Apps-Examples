// class Item.swift
import Foundation


//Implementando o Protocol "Equatable" esta debtro da heranca NSObject que permite criar a funcao "==" e comprar objetos do tipo "Item"
//Protocolo NSCoding padrão do iOS para serializar um objeto
class Item: NSObject, NSCoding{
    
    
    //Atributos - Obs: Os atributos estao sendo inicializados no construtor
    let name:     String
    let calories: Double
    
    
    
    //Construtor para inicializar os atributos - Boa pratica de programacao
    init( nameRecebido: String, caloriesRecebido: Double ){
        
        self.name     = nameRecebido
        self.calories = caloriesRecebido
        
        
    }//init
    
    
    
    
    
    
    //Serializador - Funcao com implementacao obrigatoria ao herdar o protocolo "NSCoding"
    //Esse metodo
    func encode( with aCoder: NSCoder ) {
        
        
        aCoder.encode( name,      forKey: "chaveName"     )
        aCoder.encode( calories,  forKey: "chaveCalories" )
        
        
    }//encode
    
    
    
    
    //Deserializador - Funcao com implementacao obrigatoria ao herdar o protocolo "NSCoding"
    required init?( coder aDecoder: NSCoder ) {
        
        self.name     = aDecoder.decodeObject( forKey: "chaveName"     ) as! String
        self.calories = aDecoder.decodeDouble( forKey: "chaveCalories" )
 
        
        
    }//Deserializador
    
    
    
}//item





//Protocol "Equatable" - Funcao de comparacao de entre objetos do tipo "Item"
//E sim eh estranho mesmo!, pois essa funcao esta fora das chaves da classe
func == ( primeiroElemento: Item, segundoElemento: Item) -> Bool{
    
    
    //Se os elementos sao iguais, entao return "Verdadeiro". Se retorna "false"
    return primeiroElemento.name == segundoElemento.name && primeiroElemento.calories == segundoElemento.calories

}//==







