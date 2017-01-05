//  Dao.swift
import Foundation


class Dao{
    
    let pegarEnderecoArquivoDeMeals: String
    let pegarEnderecoArquivoDeItems: String
    
    
    
    
    
    init(){
        
        
        print( "\nDefinindo o diretorio e nome do arquivo a ser salvo" )
        
        /*Capturando um local onde o arquivo que vou criar vai ser armazanado no Iphone
         1º Parametro: Qual diretorio do Iphone vou guardar o arquivo que estou criando
         2º Parametro: Digo que o diretorio eh do usuario
         3º Parametro: Expandir o diretorio
         */
        let diretoriosDoUsuario = NSSearchPathForDirectoriesInDomains(
            FileManager.SearchPathDirectory.documentDirectory,
            FileManager.SearchPathDomainMask.userDomainMask,
            true
        )
        
        
        //Capturando o endereco so do primeiro diretorio do usuario, pois tem varios
        let diretorioDoUsuario = diretoriosDoUsuario[ 0 ]
        
        
        //Criando o endereco e juntando Nome que quero dar para o arquivo
         pegarEnderecoArquivoDeMeals = "\(diretorioDoUsuario)/arquivoDaAplicacao_meals.dados"
         pegarEnderecoArquivoDeItems = "\(diretorioDoUsuario)/arquivoDaAplicacao_items.dados"
        
        
        
        
        print( "\nRetornando o caminho onde o arquivo sera salvo: \(diretorioDoUsuario)" )

    
    
    
    }//construtor
    
    
    
    
    
    
    
    func salvarMealsEmUmArquivo( arrayDeMealsRecebido: Array<Meal> ){
        
        
        /*Criando o arquivo com o nome "arquivoDaAplicacao_meals.dados", e salvando o "arrayDeMeals" nele, pois o "arrayDeMeals" eh do tipo "Array<Meals>" que pode ser serializada */
        NSKeyedArchiver.archiveRootObject( arrayDeMealsRecebido, toFile: pegarEnderecoArquivoDeMeals  )
        
        
        print( "\nSalvando a refeição no arquivo: \(pegarEnderecoArquivoDeMeals) )" )
    
    
    
    }//salvarRefeicao


    
    
    
    func carregarArquivoDeMeals() -> Array<Meal>{
    
        print( "\nTentando Ler o arquivo: \(pegarEnderecoArquivoDeMeals)\n" )
        
        
        
        /* Pegando o arquivo, chamando o deserializador dele e guardando ele em uma variavel
         O retorno do metodo eh "opcional", pois pode ser que ocorra algum erro como erro de leitura, etc. Entao, eh necessario fazer o "if let" para verificar se a leitura deu certo
         Le se: Se conseguiu ler o arquivo, deseralizar ele e o resultado nao foi nulo, entao...*/
        if let arquivoQueFoiCarregado = NSKeyedUnarchiver.unarchiveObject( withFile: pegarEnderecoArquivoDeMeals ){
            
            
            //Passando o conteudo do arquivo para o meu Array local, e tambem fazendo o cast do arquivo para o formato correto.
            //Lembrado que o "!" esta forcando o cast, pois o "arquivoQueFoiCarregado" teoricamente eh um "opcional"
            let arquivoCarregadoEConvertido: Array<Meal> = arquivoQueFoiCarregado as! Array<Meal>
            
            
            print( "\n Sucesso na Leitura do arquivo: \(pegarEnderecoArquivoDeMeals)\n")
            
        
            return arquivoCarregadoEConvertido
            
        }else{
            
            print( "\nA leitura do arquivo nao deu certo. Talves o arquivo nao esteja no diretorio, ou algum outro problema. Por isso foi mantido a leitura padrao da variavel local ArrayDeMeals :)\n" )
            
            //retorne uma Array vazia
            return Array<Meal>()
            
        }//else

        
        
        
    }//carregarArquivoDeMeals
    
    
    
    
    
    
    
    
    func carregarArquivoDeItems() -> Array<Item> {
        
        
        print( "\nTentando Ler o arquivo: \(pegarEnderecoArquivoDeItems)\n" )
        
        
        
        /* Pegando o arquivo, chamando o deserializador dele e guardando ele em uma variavel
         O retorno do metodo eh "opcional", pois pode ser que ocorra algum erro como erro de leitura, etc. Entao, eh necessario fazer o "if let" para verificar se a leitura deu certo
         Le se: Se conseguiu ler o arquivo, deseralizar ele e o resultado nao foi nulo, entao...*/
        if let arquivoQueFoiCarregado = NSKeyedUnarchiver.unarchiveObject( withFile: pegarEnderecoArquivoDeItems ){
            
            

            //Pegando o contudo do arquivo, desconvertendo ele para o formato correto
            let arquivoQueFoiCarregadoEConvertido: Array<Item> = arquivoQueFoiCarregado as! Array<Item>
            
        
            
            print( "\n Sucesso na Leitura do arquivo: \(pegarEnderecoArquivoDeItems)\n")
            
            
            return arquivoQueFoiCarregadoEConvertido
            
        }else{
            
            print( "\nA leitura do arquivo nao deu certo. Talves o arquivo nao esteja no diretorio, ou algum outro problema. Por isso foi mantido a leitura padrao da variavel local arrayDeItems :)\n" )
            
            
            //Retorna um array vazio
           return Array<Item>()
            
            
        }//else

    

    }//carregarArquivoDeItems
    
    
    
    
    
    
    
    
    
    func salvarItemEmUmArquivo( arrayDeItemsRecebido: Array<Item> ){
        
        
        
        /*Criando o arquivo, e salvando o "arrayDeMeals" nele, pois o "arrayDeMeals" eh do tipo "Array<Item>" que pode ser serializada */
        NSKeyedArchiver.archiveRootObject( arrayDeItemsRecebido, toFile: pegarEnderecoArquivoDeItems  )
        
        
        print("O item salvo com sucesso no arquivo \(pegarEnderecoArquivoDeItems)")
    
        
    }//salvarItemEmUmArquivo

    

    

}//Dao
