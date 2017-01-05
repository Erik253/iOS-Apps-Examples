//ViewController.m"
//Aqui eu declaro as acoes que vao ocorrer na tela.

#import "ViewController.h"
#import "Contato.h"


@implementation ViewController


    //Sobreescrevendo o Construtor que eh o metodo init.
    //Porem, como o Design dessa tela esta no storybord, sou obrigado a sobreescrever o construtor espcial "initWithCoder()" que recebe automaticamente um obj aDecoder
    //Se o Design da tela nao estivesse no storybord, ai eu sobreescreveria o metodo init()
    -(ViewController *) initWithCoder: ( NSCoder * ) aDecoder {
    
    
        
        //Como estou sobreescrevendo o construtor "initWithCoder" ao sobreescrever esse metodo objeto perde a heranca de "UIViewController". Entao, eh necessario chamar o construtor da classe mae para continuar a herdar os comportamentos e caracteristicas da classe mae. Complicado de entender :(
    self = [super initWithCoder: aDecoder];
    
        
        
        //Se deu tudo certo/Nao entendi o para que desse if
        if ( self ){
            
            
            
            
            //Inicializando o objeto dao que esta declarado no .h
            //Nesse caso eu estou linkando o objeto dao para acessar o objeto static da classe ContatoDao
            self.dao = [ ContatoDao contatoDaoInstance ];

            
        }//if
        
    
        
            return self;
        
    }//init




    //Sobreescrevendo
    //Metodo executado pelo iOS ao carregar a tela antes do init
    - (void) viewDidLoad{
    
        //Continue com o construtor da classe mae
        [ super viewDidLoad ];
        
        
        
        //Criando um botao
        UIBarButtonItem *botao = nil;
        
        
        //Se a propriedade esta preenchida, significa que devo preparar a tela para alterar o contato e vou colocar o botao "Alterar" na tela.
        if ( self.contato ){
            
            
            //Declarando o botao e allocando ele na memoria
            botao = [ UIBarButtonItem alloc ];
            
            
            
            //Configurando o botao.
            // -Title  -> Titulo do bota "Adicionar"
            // -Style  -> Style do botao sera "simples"
            // -Action -> Quando clicado execute o metodo adiciona()
            // -Target -> Esse metodo esta dentro dessa classe
            botao = [ botao initWithTitle: @"Alterar"
                                    style: UIBarButtonItemStylePlain
                                   target: self
                                   action: @selector(altera) ];
            
            //Titulo que aparece na tela
            self.navigationItem.title = @"Editar Contato";
            
        }
        
        //Significa que vou preparar a tela com o botao de "adicionar"
        else{
            
            //Declarando o botao e allocando ele na memoria
            botao = [ UIBarButtonItem alloc ];
            
            
            
            //Configurando o botao.
            // -Title  -> Titulo do bota "Adicionar"
            // -Style  -> Style do botao sera "simples"
            // -Action -> Quando clicado execute o metodo adiciona()
            // -Target -> Esse metodo esta dentro dessa classe
            botao = [ botao initWithTitle: @"Adicionar"
                                    style: UIBarButtonItemStylePlain
                                   target: self
                                   action: @selector(adiciona) ];
            
            //Titulo que aparece na tela
            self.navigationItem.title = @"Novo Contato";
            
        }//else
        
        
        
        
        
        //Dizendo que o botao vai ficar do lado direito da barra superior(UINavigationController)
        self.navigationItem.rightBarButtonItem = botao;

        
        
        
        //Preenchendo os campos do formulario na tela
        
        
        self.outletNome    .text = self.contato.nome;
        self.outletEndereco.text = self.contato.endereco;
        self.outletSite    .text = self.contato.site;
        self.outletTelefone.text = self.contato.telefone;
        self.outletEmail   .text = self.contato.email;
        
    
    }//viewDidLoad





    //Metodo adiciona do botao "+" da tela
    -(void) adiciona{
    
        
        //Declarando um objeto do tipo Contato
        self.contato = [Contato new];
        
        
        
        [ self pegaDadosFormulario ];
        
        

        
        //Adicionado um item no Array do objeto dao, que foi declarado no arquivo.h
        [ self.dao adicionaContato: self.contato ];
        
        
        
        
        
        
        //--Print no log. Executando o metodo description() que foi subscrito no "Contato.m"--//
        NSLog( @"\r\rDados dos campos: %@", self.dao.arrayDeContatos );
        
    
        
        
        [self.delegate contatoAdicionado: self.contato];
        
        
        
        //Voltar para a tela de Listagem de Contatos
        //Esse comando volta para a tela anterior a atual. Tipo esquema de "pilha
        [self.navigationController popViewControllerAnimated:YES];

    
    }//adiciona




    //Metodo do botao "altera" da tela
    -(void) altera{
    
        NSLog ( @"-Alterando um contato: %@", self.contato);
    
        [ self pegaDadosFormulario ];
        
        
        
        [self.delegate contatoAtualizado: self.contato];
        
        
        
        
        //Voltar para a tela de Listagem de Contatos
        //Esse comando volta para a tela anterior a atual. Tipo esquema de "pilha
        [self.navigationController popViewControllerAnimated:YES];

        
    }//altera


    -(void) pegaDadosFormulario{
    
        self.contato.nome     = self.outletNome    .text;
        self.contato.endereco = self.outletEndereco.text;
        self.contato.site     = self.outletSite    .text;
        self.contato.telefone = self.outletTelefone.text;
        self.contato.email    = self.outletEmail   .text;
        
    
    }//pegaDadosFormulario


@end
