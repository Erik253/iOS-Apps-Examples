//  ViewController.swift
//  FoodControl


import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, ViewControllerDelegate_to_NewItemViewController {
    
    
    
    //Criando "outlet" para conectar com os textField da tela. O "!" inicializa a variavel.
    @IBOutlet var nameField     : UITextField?
    @IBOutlet var happinessField: UITextField?
    
    
    //Criando uma variavel para refenciar a tabela de itens que esta na tela.
    @IBOutlet var tableViewDeItems: UITableView?
    
    
    //Referencia do protocolo "ViewControllerDelegate" para acesso aos metodos da classe MealsTableViewController
    var delegate: ViewControllerDelegate?
    
    
    
    //Array de Items selecionados inicializado com vazio
    var arrayItemsSelecionados: Array<Item> = Array<Item>()
    
    
    
    //Criando um Array de objetos do tipo "Meal"
    var arrayDeItems: Array<Item> = [
        Item ( nameRecebido: "Vegan Salad",    caloriesRecebido: 10 ),
        Item ( nameRecebido: "Super Tofu",     caloriesRecebido: 11 ),
        Item ( nameRecebido: "Potate Salad",   caloriesRecebido: 12 ),
        Item ( nameRecebido: "Soja Mix",       caloriesRecebido: 13 ),
        Item ( nameRecebido: "Green Apple",    caloriesRecebido: 14 ),
        Item ( nameRecebido: "Rice and Beans", caloriesRecebido: 15 ),
        Item ( nameRecebido: "Mega Lunch",     caloriesRecebido: 16 ),
        Item ( nameRecebido: "Waffer",         caloriesRecebido: 17 ),
        Item ( nameRecebido: "Strawberry",     caloriesRecebido: 18 ),
        Item ( nameRecebido: "Eggs",           caloriesRecebido: 19 )
    ]
    
    
    
    
    //0-Metodo chamado pelo iOS apos o carregamento da view. Ou seja, antes de mostrar a tela faca..
    override func viewDidLoad() {
        
        print("\nViewController - Executando o metodo viewDidLoad()\n")
        
        
        //**Criando o botao de adicionar um item, que fica no canto superior direito da tela**
        //Tem diversos inicializadores, estou usando o que pede o sequinte:
        // Tile  -> Texto que vai aparecer no botao
        // Stylle-> Aparencia do botao
        // Target-> Classe que o metodo que o botao vai executar esta
        // Action-> Metodo que o botao vai executar
        let botaoCantoSupDireito: UIBarButtonItem = UIBarButtonItem(
                                                                title: "Add New item",
                                                                style: UIBarButtonItemStyle.plain,
                                                                target: self,
                                                                action: #selector(showNewItem)
                                                                   )
        
        
        
        //Adicionando o botao na barra do Navigation Controller no canto superior direito
        navigationItem.rightBarButtonItem = botaoCantoSupDireito
        
        
        
        //Tentando carregar os items da lista pelo arquivo
         self.arrayDeItems =  Dao().carregarArquivoDeItems()
        
        
        
        
    }//viewDidLoad
    
    
    
    
    
    
    //Protocol "UITableViewDataSource"
    //1-Metodo chamado pelo iOS para perguntar quantas linhas devem ser criadas na tableView na tela
    func tableView( _ tableView: UITableView, numberOfRowsInSection section: Int ) -> Int {
        
        
        
        //Digo que o total de linhas da tabela
        return arrayDeItems.count
    
    }//numberOfRowsInSection
    
    
    
    
    
    //Protocol "UITableViewDataSource"
    //2-Metodo chamado pelo iOS varias vezes para perguntar qual eh o conteudo de cada linha da tabela
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath ) -> UITableViewCell {
       
        
        
        //pegando o indice da linha que o iOS esta me pedindo o conteudo
        let indiceDaLinha: Int = indexPath.row
        
        
        //Extraindo o conteudo do meu array da posicao que preciso
        let conteudo: String = arrayDeItems [ indiceDaLinha ].name
        
        
        
        //Crio um objeto do tipo "UITableViewCell"para retornar
        // *style          : aparencia da linha
        // *reuseIdentifier: nao sei o que eh rs
        let linhaPreenchidaParaRetornar: UITableViewCell = UITableViewCell( style: UITableViewCellStyle.default, reuseIdentifier: nil)
        
        
        
        //Colando o conteudo que veio do meu array na linha
        linhaPreenchidaParaRetornar.textLabel!.text = conteudo
        
        
        
        return linhaPreenchidaParaRetornar
        
    
    }//cellForRowAt
    
    
    
    


    //Protocol "UITableViewDelegate" - Funcao executa ao selecionar um item na tabela
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        //Pegando a uma referencia para a linha selecionada na tabela
        //If a linha selecionada existe, entao:
        if let linhaSelecionada: UITableViewCell = tableView.cellForRow(at: indexPath){
        
            
            //Se a linha clicada nao tiver o check icon, entao coloque o check icon e adiciona essa linha no ArrayDeItemsSelecionados
            if ( linhaSelecionada.accessoryType == UITableViewCellAccessoryType.none ){
            
        
                //Colocando um check icon na linha selecionada
                linhaSelecionada.accessoryType = UITableViewCellAccessoryType.checkmark
                
                
                
                //Extraindo o conteudo da linha selecionada e guardando
                let itemExtraidoDaLinha: Item = arrayDeItems[ indexPath.row ]
                
                
                
                //Adicionando o conteudo extraido no arrayDeItemsSelecionados
                arrayItemsSelecionados.append( itemExtraidoDaLinha )
                
                
                print("Linha selecionada e checked: \(itemExtraidoDaLinha.name)")
                
        
            }//Se a linha selecionada ja tiver o check icon, entao delete ele do ArrayDeItemsSelecionados
            else{
                
                //Retirando o check icon da linha selecionada
                linhaSelecionada.accessoryType = UITableViewCellAccessoryType.none
                
                
                //Extraindo o Item do arrayDeItems que eh fonte dos items exibidos na tabela na tela
                let itemExtraidoDaLinha: Item = arrayDeItems[ indexPath.row ]
                
                
                
                /* Pegando a posicao do "itemExtraidoDaLinha" no "arrayItemsSelecionados
                O .index() retorna um Int opcional, por isso valido ele com "if let"
                E so da pra usar essa funcao index() pois foi implementado o protocol "Equatable" na classe "Item" e tambem implementado a funcao "=="  
                 */
                if let posicaoDoItemAserDeletado: Int = arrayItemsSelecionados.index(of: itemExtraidoDaLinha ){
                
                
                    //E finalmente removendo o item que foi descelecionado
                    arrayItemsSelecionados.remove (at: posicaoDoItemAserDeletado )
                    
                    
                    print("Linha descelecionada e unchecked: \(itemExtraidoDaLinha.name)")
            
                }else{
                
                    //Criando um objeto do tipo "JanelaDeAlerta" e chamando o metodo "show()" para mostrar uma janela de alerta na tela.
                    JanelaDeAlerta( controllerRecebido: self).show()
                    
                }//else-2
                
                
                
            }//else
    
            
            
        }//if-1
        else{
        
            //Criando um objeto do tipo "JanelaDeAlerta" e chamando o metodo "show()" para mostrar uma janela de alerta na tela.
            JanelaDeAlerta( controllerRecebido: self).show( )
        
        }//else
        
        
        
    }//didSelectRowAt
    
    

    
    
    
    

    
    
    
    //Funcao ligada com o botao da tela.
    @IBAction func add(){
        
        
        //Pegando o conteudo dos dois textFields da preenchidos na tela e criando um objeto Meal
        if let mealRecebida: Meal = getMealDoFormularioDaTela(){
            
            
            //Se a variavel opcional "delegate" nao estiver com valor nulo
            if let auxdelegate: ViewControllerDelegate = delegate{
                
                

                //Adicionando uma nova refeicao la no Array de Meals da tela anterior
                auxdelegate.add( mealRecebida )
                    

                
                //O atributo "navigationController" que a view herda eh opcional, por isso realizo a validacao com a boa pratica "if let"
                //le se: se o atributo "navigationController" nao esta nulo, entao...
                if let auxNavigationController: UINavigationController  = navigationController{
                    
                    
                    //Vai para a tela anterior (pop = Desempilhar)
                    auxNavigationController.popViewController( animated: true )
                }else{
                    
                    JanelaDeAlerta( controllerRecebido: self ).show(mensagemRecebida: "Ocorreu um erro")

                }//else
                
            
            }//if do delagate
            
                return
            
        }//if mealRecebida
        
        
            JanelaDeAlerta( controllerRecebido: self ).show(mensagemRecebida: "Faltou preencher os campos ou preencheu errado :(")
        
    }//add

    
    
    
    
    
    
    
        //Pega conteudo dos dois textFields da preenchidos na tela e cria um objeto Meal
        func getMealDoFormularioDaTela() -> Meal?{
            
            
            //Extrai o conteudo do textFiled name da tela. Mas se estiver vazio nao faz nada
            if let nameExtraido: String  = nameField?.text{
            
                
                //Extrai o conteudo do textFiled hapiness da tela. Mas se estiver vazio nao faz nada
                if let hapinnesExtraida: Int = conversaoStrinParaInt( textoRecebido: happinessField?.text ){
                
                    
                    //Criando um obj to tipo "Meal" que recebe uma "String", um "Int" e um "Array de Items" no construtor
                    let mealASerRetornada = Meal( nameRecebido: nameExtraido, hapinessRecebido: hapinnesExtraida, itemsRecebidos: arrayItemsSelecionados )
                    
    
                
                    
                    //Print no log
                    print("\n***Meal description: Name:\(mealASerRetornada.name) Happiness:\(mealASerRetornada.happiness)" )
                    
                    
                    for i in mealASerRetornada.items{
                        print ("***Meal items: \(i.name) \n") }
                    
                    
                    
                    
                    return mealASerRetornada
                    
                }//if-2
            
            }//if-1
            
            
                return nil
            
            
        }//getMealDoFormularioDaTela

    
    
    
    
    
        
    //Funcao para converter String em Int
    func conversaoStrinParaInt( textoRecebido: String? ) -> Int?{
    
        if let aux: String = textoRecebido{
        
            //Converte a Stirng em Int e a retorna
            return Int( aux )
            
        }else{
        
            return nil
            
        }
    
    
    }//conversaoStrinParaInt
    
    
    
    

    
    //Protocol "ViewControllerDelegate_to_NewItemViewController" - Funcao para adicionar um novo item no arrayDeItems dessa class
    func addItem( _ itemRecebido: Item ){
    
        
        
        //Adicionando o item recebido no arrayDeItems
        arrayDeItems.append( itemRecebido )
        
        
        
        
        //Salvando o itemRecebido em um arquivo
        Dao().salvarItemEmUmArquivo( arrayDeItemsRecebido: arrayDeItems )
        
        
        
        //-----PARA TESTE - Forcando o valor da variavel para testar a exibicao da janela de alerta--------//
        //tableViewDeItems = nil
        //------------------------------------------------------------------------------------------------//
        
        //tableViewDeItems eh "opcional", por isso realizo essa validacao 
        //le se: Se "tableViewDeItems" nao for nulo, entao...
        if let auxTableViewDeItems = tableViewDeItems{
        
            
            //Refresh os dados
            auxTableViewDeItems.reloadData()
    
            
        }else{
        
            //Criando um objeto do tipo "JanelaDeAlerta" e chamando o metodo "show()" para mostrar uma janela de alerta na tela.
            JanelaDeAlerta( controllerRecebido: self).show( mensagemRecebida: "Não foi possível adicionar o item :( " )
            
            
        }//else
        
        
    
    }//addItem
    
    
    
    
    
    //Funcao ao clicar no botao "Add a New Item"
    func showNewItem(){
        
        
        //Criando uma estancia de NewItemViewController
        //E passando o delegate para o objeto criado pelo construtor
        let tela_NewItemViewController: NewItemViewController = NewItemViewController( delegateRecebido: self )
        
        
   
        
        //Verificando se o atributo opcional navigationController esta nulo
        //Le se: Se o atributo navigationController nao estiver vazio, entao...
        if let auxnavigationController = navigationController{
            
            
            
            //Indo para a tela NewItemViewController
            auxnavigationController.pushViewController( tela_NewItemViewController, animated: true )
            
            
        }//if

        else{
        
            
            //Criando um objeto do tipo "JanelaDeAlerta" e chamando o metodo "show()" para mostrar uma janela de alerta na tela se a variavel "tableViewDeItems" estiver nula
            JanelaDeAlerta( controllerRecebido: self).show( mensagemRecebida: "Não foi possível ir para a janela de adicionar items :( " )
    
        }//else
        
        
    }//showNewItem
    
    
    
    
    
    
    
    //Cria um endereço e nome para um arquivo
    func pegarEnderecoParaUmArquivo() -> String{
        
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
        let enderecoDoArquivo: String = "\(diretorioDoUsuario)/arquivoDaAplicacao_items.dados"
        
        
        print( "\nRetornando o caminho onde o arquivo sera salvo: \(enderecoDoArquivo)" )
        
        
        return enderecoDoArquivo
        
        
    }//pegarEnderecoParaUmArquivo
    
    
    
    
    
    
    
    
}//class

