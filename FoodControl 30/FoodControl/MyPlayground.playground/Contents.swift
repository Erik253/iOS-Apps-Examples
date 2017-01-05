//: Playground - noun: a place where people can play

import UIKit


//------------------------Variaveis e Constantes--------------//
//Constantes - "let" eh uma forma de declaracao de constantes
let variavelCostante: String = "Variavel constante"
let nameDeUmDoce:String      = "*-Doce-*"
let happinessInt:Int         = 5
let varDouble: Double        = 50.5
let varBollean: Bool         = true


//Variavel
var userName = "Erik"


print(userName)
print(variavelCostante,nameDeUmDoce )





//--------------------Methods/Functions----------------------//


//Creating a method
func helloCalories(){

    print("Test the function/Method :)")
}


//Calling the method
helloCalories()




//Creating a method with parameters
func add( varName:String, varCalories:Double ){

    print("Name: \(varName) - Calories: \(varCalories)" )

}


//Calling the method with parameters
add(varName: "Example", varCalories: 50.5)






//--------------------------Arrays-------------------------//


let calories: Array<Double> = [ 50.5, 100.5, 34,9 ]

let items:Array<Int> = []


//--------------------------for---------------------------//

let myArray: Array<Double> = [ 50.5, 100.5, 34,9, 90.9]


//Exemplo 1 - Le se Imprima da posicao 0 ate 3
for i in 0...3{

    print( myArray[i] )

}//for1



//Exemplo 2
for i in 0...myArray.count - 1{
    
    print( myArray[i] )
    
}//for2




//Exemplo 3 - Le se Imprima todos as posicoes do array
//Nesse caso o "i" fica com o valor da posicao do array
for i in myArray{

    print( i )
    
}//for3



//----------------------Methods with return-------------------------------//

//"-> Double" = Significa que o valor retorno sera do tipo Double
func allCalories( calories: Array<Double> ) -> Double {

    
    var total: Double = 0
    
    
    
    for i in calories{
    
        total = total + i
    }
    
    return total

}


//Caling the func
allCalories( calories: [10.50, 10.50, 10, 10] )






//-------------------------Creating a Class--------------------------//

class Meal{
    
    //Atributos
    var happiness: Int    = 5
    var name:      String = "salada"
}


//Criando um objeto da classe "Meal"
var objetoSalada = Meal()


//Update values
objetoSalada.happiness = 10
objetoSalada.name      = "Salada de tomate"


//Printing values
print( objetoSalada.happiness )
print( objetoSalada.name      )




//-------------------------Creating a Class --------------------------//
//Explicando o termo "?" que significa "opcional"

class objMeal{
    
    
    //Atributos inicializados com "?". Significa que a variavel pode ficar sem valor.
    var happiness: Int?
    var name:      String?
}


var superSalada = objMeal()
superSalada.happiness = 5
superSalada.name      = "Super salada"


//As variavies com "?"correm o risco de nao estarem com o valor nulo no momento que eu desejar imprimir, pois sao "opcionais", o que causaria o crash do app. Entao uso "!" que autoriza o iOS a compilar o codigo mesmo com o risco de crash. Em resumo isso nao eh uma coisa boa de se fazer, melhor evitar!
print( superSalada.happiness!)
print( superSalada.name!.uppercased() )




//----------------Verificacao de valor nulo me variaveis opcionais----------//

class objetoMeal{
    
    var name: String?
}


//Criando um objeto do tipo "objetoMeal"
var mySalad: objetoMeal  = objetoMeal()



//If para verificar valor nulo
//Leitura: Se mySalad.name nao for nulo, entao pegue o conteudo e coloque dentro da constante "name". Caso contrario manda um print dizendo que eh o valor esta nulo
if let conteudoExtraido = mySalad.name {
    
    print( conteudoExtraido.uppercased() )

}else{
    
    print( "Variavel com valor vazio(Nulo)" )

}





//---------------------------Criando o construtor (init)---------------//

class refeicao{
    
    
    var happiness: Int
    var name:      String
    
    
    
    //Utilizando um construtor para a classe.
    //Quando tenho um construtor que inicializa todos os atributos, eu nao preciso informar o valor inicial nos atributos e nem dizer que sao opcionais
    init( happinessRecebido: Int, nameRecebido: String ){
    
        self.happiness = happinessRecebido
        self.name      = nameRecebido
        

    }//init
    
    
}//refeicao



//Criando um objeto do tipo "refeicao"
var novaRefeicao: refeicao = refeicao( happinessRecebido: 5, nameRecebido: "Salada de tomate" )





//------------------------Classe com subitems------video---------------------//
//4-Swift 3 desenvolvendo para iOS no Xcode parte 1\5-Good Citizen e criando classes e aplicativos\video 2


class Item{
    
    var name:     String
    var calories: Double
    
    
    //Construtor para inicializar os atributos - Boa pratica de programacao
    init( nameRecebido: String, caloriesRecebido: Double ){
        
        self.name     = nameRecebido
        self.calories = caloriesRecebido
        
        
    }//init
    
    
}//item


class objrefeicao{
    
    
    var happiness: Int
    var name:      String
    var items:     Array<Item> = []
    
    
    //Utilizando um construtor para a classe.
    //Quando tenho um construtor que inicializa todos os atributos, eu nao preciso informar o valor inicial nos atributos e nem dizer que sao opcionais
    init( happinessRecebido: Int, nameRecebido: String ){
        
        self.happiness = happinessRecebido
        self.name      = nameRecebido
        
        
    }//init
    
    
    //Funcao de calculo de total de calorias
    func calc_totalDeCalorias() ->  Double {
        
        var total: Double = 0.0
    
        
        //Percorra todas posicoes do array
        for i in items{
        
            total = total + i.calories
        }
        
        
    return total
    
    }
    
    
    
}//objrefeicao





//Criando um objeto do tipo "objrefeicao"
var newRefeicao: objrefeicao = objrefeicao( happinessRecebido: 5, nameRecebido: "Salada de tomate" )


//Criando objetos do tipo "Item"
var item1 = Item ( nameRecebido: "Brocolis",   caloriesRecebido: 100)
var item2 = Item ( nameRecebido: "Couve Flor", caloriesRecebido: 200)



//adicionando items no array do objeto do tipo refeicao
newRefeicao.items.append( item1 )
newRefeicao.items.append( item2 )


//Calling a func
print ( newRefeicao.calc_totalDeCalorias() )








