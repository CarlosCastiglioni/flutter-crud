# flutter_crud

Projeto Flutter Crud

## Iniciando


O sistema de rotas do projeto está localizado no arquivo main.dart.

Lá é invocada a página /welcome como rota inicial, e é nela que é feito o teste de
login do usuário. Caso o usuário esteja com token ativo será direcionado à /home,
caso não esteja, será direcionado à /login.

## Login

Na página de login serão feitas as validações de e-mail e senha do usuário,  o corpo
do e-mail deve conter ao menos um .com e um @.
Caso tudo esteja OK, ao clicar em Entrar o usuário é direcionado à /home.

O controller responsável pela Login page é o login_store.dart, e ele que realiza
a chamada da rota de login.

## Home Page

Na home page é feita uma chamada inicialmente, a função getusers (que é responsável
por alimentar a lista de usuários), nela, é feita a validação de token do usuário novamente,
para não haver risco de a lista vir em branco devido a uma resposta http 403, também foi criado
um timer, para direcionar o usuário até a login page a cada 5 minutos para novamente, não recebermos
uma lista em branco, devido ao token que é apagado de tempos em tempos.
Na home page também foi criado o botão "Sair", que redireciona o usuário até /login e exclúi seu token 
no aplicativo e o botão "+ Novo Usuário" onde será feito o cadastro de um novo usuário.

Os componentes utilizados na homepage são: 

- new_user_dialog - onde será feito o cadastro do novo usuário, e este widget é invocado ao
clicar no botão "+ Novo Usuário", localizado no topo da homepage. Este widget possúi 4 inputs componentizados
para serem inseridos o Nome, E-mail, Senha e Cpf do usuário a ser cadastrado.
Todos os inserts tem um validator, onde são inseridas as regras de cada um, como número de caracteres do cpf, do nome,
do cpf e da senha. Todos os inputs também possuem arquivos de teste para reforçar a checagem. 


- user_tile - é o componente que popula a lista localizada na home page, nele temos as informações de Nome,
ID e E-mail dos usuários.

O controller responsável pela Home page é o home_store.dart , nele temos as funções:

- getToken - Que fará a checagem de token do usuário no applicativo, utilizando SharedPreferences (que é
utilizado tanto para armazenar, quanto para manter o token salvo e poder reutilizá-lo).

- logout - Que realiza a exclusão de tokens salvos no SharedPreferences.

- getUsers - Que realiza a chamada http get para popular a lista de usuários da homepage, nela também foi
criado um critério de segurança para deslogar o usuário em caso de resposta http diferente de 200.

- deleteUser - Que realiza a chamada http delete, para fazer a deleção de usuários no banco.

- addUser - Que realiza a chamada http post para criar novos usuários no banco, também é feita a checagem de login
do usuário, em caso de resposta 403 o usuário é imediatamente deslogado e direcionado à /login.

## Testes

Foram criados testes para todos os inputs do projeto. Onde são checadas as regras necessárias para cada
validação.











