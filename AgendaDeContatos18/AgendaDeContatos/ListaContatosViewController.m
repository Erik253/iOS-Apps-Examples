//  ListaContatosViewController.m
//  Essa classe eh uma tela


#import "ListaContatosViewController.h"

#import "Contato.h"
#import "ContatoDao.h"

@implementation ListaContatosViewController



    //Sobreescrevendo o Construtor que eh o metodo init.
    //Esse metodo init eh o que o comando "new" faz quando crio um objeto.
    -(ListaContatosViewController *) init {
        
        
        //Como estou sobreescrevendo o construtor "init"
        //Pois ao sobreescrever esse metodo objeto perde a heranca de "UITableViewController". Entao, eh necessario chamar o construtor da classe mae para continuar a herdar os comportamentos e caracteristicas da classe mae. Complicado de entender :(
        self = [super init];
        
        
        
        //--Criando um botao para colocar na barra superior(UINavigationController) dessa tela--//
        
        
        //Declarando o botao e allocando ele na memoria
        UIBarButtonItem *botaoForm = [ UIBarButtonItem alloc ];
        
        
        
        //Configurando o botao.
        // -Seja um botao do tipo adicionar, ou seja um botao de "+"
        // -Quando clicado execute o metodo exibeFormulario()
        // -Esse metodo esta dentro dessa classe
        botaoForm = [ botaoForm initWithBarButtonSystemItem: UIBarButtonSystemItemAdd
                                                     target: self
                                                     action: @selector( exibeFormulario ) ];
        
        
        
        //Dizendo que o botao vai ficar do lado direito da barra superior(UINavigationController)
        self.navigationItem.rightBarButtonItem = botaoForm;
        
        
        //Titulo que aparece na tela
        self.navigationItem.title = @"Contatos";
        
        
        
        //Adicionando um botao de "Edit no menu superior
        //Esse botao ja esta pronto, pois eh uma propriedade herdada da classe "UITableViewController"
        //Ao clicar no botao, eh executado o metodo "commitEditingStyle()"
        self.navigationItem.leftBarButtonItem = self.editButtonItem;
        
        
        
        
        //Inicializando o objeto dao que esta declarado no .h
        //Nesse caso eu estou linkando o objeto dao para acessar o objeto static da classe ContatoDao
        self.dao = [ ContatoDao contatoDaoInstance ];

        
        
        
        //Retorna uma tela do tipo ListaContatosViewController pronta.
        return self;
        
        
    }//Construtor init




    //Sobreescrevendo (Nao entendi muito bem a leitura desse metodo)
    //Metodo do botao "Edit", que recebe:
    //tableView          -> Tabela no qual a acao vai ser feita
    //commitEditingStyle -> Tipo de acao a ser feita
    //forRowAtIndexPath  -> Indice da linha da tabela que a acao vai ser feita
    -(void) tableView         :(UITableView *)               tableView
            commitEditingStyle:(UITableViewCellEditingStyle) editingStyle
            forRowAtIndexPath :(NSIndexPath *)               indexPath {
    
        
    //Se o acao recebida for "delecao"
        if( editingStyle == UITableViewCellEditingStyleDelete ){
        
            
            //Pegando o contato de acordo com o indice recebido
            Contato *contato = [ self.dao getContatoDaPosicaoDoIndice: indexPath.row ];
            
            
            //Removendo o item do arrayDeContatos
            [self.dao removeContato: contato];
        
        
            //Deletando o item da lista visualmente da tabela
            //Para isso uso o objeto tableView e o metodo "deleteRowsAtIndexPaths"
            //withRowAnimation - > Animacao que occore ao realizar a delecao
            [self.tableView deleteRowsAtIndexPaths: @[indexPath]
                                  withRowAnimation: UITableViewRowAnimationFade];
        
        }//if
        
    
    }//forRowAtIndexPath





    //Sobreescrevendo (Nao entendi muito bem a leitura desse metodo)
    //Metodo executado ao clicar em um item na lista:
    - (void) tableView              : (nonnull UITableView *) tableView
             didSelectRowAtIndexPath: (nonnull NSIndexPath *) indexPath{
    
    
        //Pegando a linha que foi selecionada. E pegando o conteudo da propriedade declarada no .h
        self.contatoSelecionado = [ self.dao getContatoDaPosicaoDoIndice: indexPath.row ];

        
        
        //Indo para a tela do formulario de contatos
        [ self exibeFormulario ];
        
        
    
    }//didSelectRowAtIndexPath





    //Botao do botao adicionar
    -(void) exibeFormulario{
    
        
        //Crio um obj do tipo "UIStoryboard" e jogo as telas do "Main.storyboard" dentro dele
        UIStoryboard *storyboard = [ UIStoryboard storyboardWithName: @"Main"
                                                              bundle: nil   ];
        
        
        
        //Extraio a tela com o id "Form-Contato" que veio do "Main.storyboard".
        ViewController *tela_form_contato = [ storyboard instantiateViewControllerWithIdentifier: @"Form-Contato"];
        
        
        tela_form_contato.delegate = self;
        
        
        
        //Aqui eu verifico se entre nesse metodo clicando em um item da lista. Nesse caso seria o fluxo de editar um contato ja existente
        if ( self.contatoSelecionado ){
        
            //Guarda o conteudo da linha que foi selecionada
            tela_form_contato.contato = self.contatoSelecionado;
        
        }//if
            
        
        
        //Limpando os dados
        self.contatoSelecionado = nil;
        
        
        
        //-Ao clicar no botao, vai para a tela "tela_Form_Contato"
        //-Ao mudar de tela, "Sim, exiba uma animacao"
        [ self.navigationController pushViewController: tela_form_contato
                                              animated: YES   ];
        
        
    
    }//exibeFormulario






    //1-Metodo executado pelo iOS toda a vez que essa tela aparece no device
    //Sobreescrever.Definir qual o numero de linhas vai aparecer na lista da tela
    -( NSInteger ) tableView: ( nonnull UITableView * )tableView  numberOfRowsInSection: ( NSInteger )section {

        
        //Digo que a quantidade de linhas da tela sera o total de posicoes do array
        return [self.dao getTamanhoDoArray];

    }//numberOfRowsInSection




    //2-Metodo executado pelo iOS toda a vez que essa tela aparece no device.
    //Qual sera o conteudo que sera exibido em cada linha da lista da tela.
    //O iOS chama esse metodo varias vezes para pegar o conteudo a ser exibido em cada linha da tabela.
    -( nonnull UITableViewCell * )tableView: ( nonnull UITableView * )
            tableView cellForRowAtIndexPath: ( nonnull NSIndexPath * )indexPath{
        
        
    
        //-------------Inicio Esquema de reaproveitamento de linha para economizar memoria---------//
        
        //Criando um identificador. Nao entendi para que serve
        NSString *identificador = @"Celula";
        
        

        //Criando uma linha para ser inserida na tabela que sera exibida na tela em um espaco reaproveitado. Isso ajuda a economizar memoria do device.
        UITableViewCell *cell = [ self.tableView dequeueReusableCellWithIdentifier: identificador] ;
        
        
        
        //Se nao precisar de espaco de reaproveitamento, ou seja, se der pra vizualizar todos os contatos em uma so tela sem dar scrool, entao crie uma linha sem reaproveitamento:
        if ( !cell ){
        
            
            //Celula eh o mesmo que linha da lista.
            //***Configurando a linha e seu conteudo
            //  initWithStyle   -> Aparencia da linha
            //  reuseIdentifier -> Digo que essa linha pode ser reaproveitada para ecomizar memoria.
            cell = [ [UITableViewCell alloc ]
                    initWithStyle  : UITableViewCellStyleDefault
                    reuseIdentifier: identificador ];
        
            
        }//if
        
        
        
        //-------------Fim Esquema de reaproveitamento de linha para economizar memoria---------//
        
        
        
        //Extraindo o elemento da posicao atual do array
        //Lembrando que eh o iOS que diz o "indexPath"
        Contato *contatoExtraidoDoArray = [ self.dao getContatoDaPosicaoDoIndice: indexPath.row ];
        
        
        
        //Dizendo que o conteudo da linha vai ser o texto da posicao do array(index contem a posicao atual do array
        cell.textLabel.text = contatoExtraidoDoArray.nome;
        
        
        
        
        return cell;

    }//tableView





    //3-Metodo executado pelo iOS toda a vez que essa tela aparece no device
    //Sobreescrevendo.Recarreque a tela. Ou seja, iniciei a tela novamente e atualize o valor das variaveis, objetos, etc. Fiz isso para que ele possa ler novamente o conteudo do array, e atualizar a tela.
    - (void)viewWillAppear:(BOOL)animated{
        
        
        //atualizar os dados
        [self.tableView reloadData];
    
    
    
    }//viewWillAppear





    -(void) contatoAdicionado: (Contato *) contato{

        NSLog(@"Adicionado: %@", contato);
        
    }//contatoAdicionado




    -(void) contatoAtualizado: (Contato *) contato{
    
        NSLog(@"Atualizado: %@", contato);
    
    }//contatoAtualizado


@end
