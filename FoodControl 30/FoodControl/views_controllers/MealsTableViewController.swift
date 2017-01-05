//  MealsTableViewController.swift
//Controler da tela inicial da App

import UIKit


//Herdando o protocolo "ViewControllerDelegate"
class MealsTableViewController: UITableViewController, ViewControllerDelegate{

    
    
    //Criando um Array de objetos do tipo "Meal"
    var arrayDeMeals: Array<Meal>  = Array<Meal>()
    
    
    
    
    //0-Metodo chamado pelo iOS apos o carregamento da view. Ou seja, antes de mostrar a tela faca..
    override func viewDidLoad() {
        
        
        print("\nMealsTableViewController - Executando o metodo viewDidLoad()\n")

        
        //Se existir...Carregar o arquivo de Meals com os items da lista da tela
        self.arrayDeMeals = Dao().carregarArquivoDeMeals()
        

    }//viewDidLoad
    
    
    
    
    
    
    
    //1-Metodo chamado pelo iOS para perguntar quantas linhas devem ser criadas na tableView na tela
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int ) -> Int {
        
        print("\nExecutando o Metodo tableView 1\n")
        
        //Digo que o total de linhas da tabela eh o total de posicoes do Array
        return arrayDeMeals.count
    }
    
    
    
    
    
    
    //2-Metodo chamado pelo iOS varias vezes para perguntar qual eh o conteudo, estilo e Longpress func de cada linha da tabela
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath ) -> UITableViewCell {
       
        print("\nExecutando Metodo tableView 2\n")
        
        //pegando o indice da linha que o iOS esta me pedindo o conteudo
        let indiceDaLinha: Int = indexPath.row
        
        
        
        //Extraindo o conteudo do meu array da posicao que preciso
        let conteudo: String = arrayDeMeals [ indiceDaLinha ].name
        
        
        
        //Crio um objeto do tipo "UITableViewCell"para retornar
        // *style          : aparencia da linha
        // *reuseIdentifier: nao sei o que eh rs
        let linhaPreenchidaParaRetornar: UITableViewCell = UITableViewCell( style: UITableViewCellStyle.default, reuseIdentifier: nil)
        
        
        
        
        //Colando o conteudo que veio do meu array na linha
        linhaPreenchidaParaRetornar.textLabel!.text = conteudo
        
        
        
        //Criando um Recognizer (reconhecedor de gestos) para um longPress na linha da tabela
        // - target: Local onde esta o metodo que vai ser executado
        // - action: Metodo a ser executado
        let longPressrecognizer = UILongPressGestureRecognizer( target: self, action: #selector( showDetails) )
        
        
        //Vinculando o Recognizer na linha
        linhaPreenchidaParaRetornar.addGestureRecognizer( longPressrecognizer )
        
        
        
        return linhaPreenchidaParaRetornar
        
    }
    
    
    
    
    
    
    //Funcao executada ao longPress em uma linha da tabela
    func showDetails( recognizerRecebido: UILongPressGestureRecognizer ){
    
        
        
        //Especificando qual state do Gesture LongPress, pois tem varios states (began, ended, etc)
        if( recognizerRecebido.state  == UIGestureRecognizerState.began){
        
            
            //Exraindo a linha que foi teve o longPress na tabela
            //E fazendo um cast pois tenho certeza que o usuario clicou em uma view do tipo UITable Viewcell.
            let linhaSelecionaDaTabela: UITableViewCell = recognizerRecebido.view as! UITableViewCell
            

            
            //Extraindo o indexPath da linha que teve o longPress. Porem como o ".indexPath"eh opcional, devo realizar a validacao
            //Le se: Se o indexPath nao estiver vazio, entao.. 
            if let indexPath = tableView.indexPath ( for: linhaSelecionaDaTabela ){
 
            
                //Extraindo indice da linha selecionada da tabela atraves do indexPath
                let indiceDaLinhaSelecionada = indexPath.row
            
            
                //Pegando o objeto meal do "arrayDeMeals"
                let meal = arrayDeMeals[ indiceDaLinhaSelecionada ]
            
            
                print( "LongPress na linha: \(indiceDaLinhaSelecionada) - \( meal.name )" )
                
                
                
                
                /*Nessa etapa eu estou criando um objeto do tipo "RemoveMealController". Esse objeto vai mostrar a janela de alerta
                com as opcoes "ok" e "remover" quando o usuario der um clique longo em um item da tabela.
                
                 Entao, apartir do objeto "RemoveMealController" eu chamo o metodo "showJanelaDeAlerta()" que recebe:
                 
                   - mealRecebida   : E a meal no qual a linha da tabela faz referencia
                   - handlerRecebido: Aqui eh meio estranho e ao meu ver desnecessario, mas eu estou passando por parametro "Instrucoes para serem executadas" (closure) :0
                 
                 Esse conceito ai de passar instrucoes por parametro pode ser chamado de closure
                */
                RemoveMealController( controllerRecebido: self ).showJanelaDeAlerta( mealRecebida: meal, handlerRecebido: { action in
                    
                    
                                                                            //Removendo a Meal da linha selecionada do ArrayDeMeals
                                                                            self.arrayDeMeals.remove( at: indiceDaLinhaSelecionada )
                    
                                                                            //Refresh dos dados
                                                                            self.tableView.reloadData()
                    
                    
                                                                            print("Meal removida: \(meal.name) ")
                    
                                                                                                    }//acao do handler 
                                                                                    )
            }//if-let
            
        
        }//if
        
        
        
    }//showDetails
    
    
    
    
    
    
    /* Essa funcao eh executada pelo iOS ao ir para outra tela. Ou seja, quando o usuario clicar em qualquer botao que vai para outra tela, entao essa funcao sera executada e depois disso vai seguir para a proxima tela.
     
        segue  -> Eh a seta de ligacao no Storyboard no aponta para a tela que sera aberta no App
        sender ->                                                   */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        
        //Verifico se a seta recebida eh do identificador que vai para para a "tela ViewController"
        //Se eu ficar em duvida, basta ir no Storyboard e ver se seta tem esse identifier :)
        if ( segue.identifier == "vai_para_tela_viewcontroller" ){
        
            
            
            
            //Extraio uma referencia para a tela de destino, que nesse caso sera a tela com o nome "ViewController" do tipo "ViewController".
            let telaDeDestino: ViewController = segue.destination as! ViewController
            
            
            
            
            
            //Por fim, passo uma referencia desta classe/tela para a tela destino que tem um atributo chamado "delegate" do tipo da tela de destino :.
            //E como dizer "Oi tela de destino, sei que vc vai me chamar de volta, ai se vc quiser alterar algo, use essa referencia ai"
           
            telaDeDestino.delegate = self
        
        
        }//if
        
        

    }//prepare
    
    
    
    
    
    //Funcao para adicionar um objeto do tipo Meal no Array[]
    func add( _ refeicaoRecebida: Meal ){
        
        
        //Adicionando a Meal no Array
        arrayDeMeals.append ( refeicaoRecebida )
        
        
        print("***Nova Meal foi adicionada com sucesso :) ***")
        
        
        //Salvando o arrayDeMeals em um arquivo atraves de um objeto Dao
        Dao().salvarMealsEmUmArquivo( arrayDeMealsRecebido: arrayDeMeals )

        
        
        
        //Refresh dos dados dessa tela
        tableView.reloadData()
    
    }//add
    
    
    
    
    
    
    
    

    
    
    

}//class
