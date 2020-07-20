import 'dart:convert' ;
import 'dart:io' ;

class Conta{
  int id;
  int agencia;
  int conta;
  String name;
  int balance;
}

class Agencia {
  int id;
  int balance;
  List<Conta> clientesAgencia;
}

main() async{
  var uri  = "https://igti-film.herokuapp.com/api/accounts";
  var request = await HttpClient().getUrl(Uri.parse(uri));
  // request.headers.set(HttpHeaders.contentTypeHeader, "application/json; charset=UTF-8");
  // request.headers.set("accept", "application/json");
  
  var response = await request.close();
  String textJson = "";
  var result = new StringBuffer();
  await for ( var contents in response.transform(utf8.decoder)) {
    result.write(contents);
  }
  // print(textJson);
  textJson += result.toString();
  List<Conta> listaContas = new List();
  var listJson = jsonDecode(textJson);
  
  for (var item in listJson) {
    Conta conta = new Conta();
    conta.agencia = item["agencia"];
    conta.id = item["id"];
    conta.balance = item["balance"];
    conta.conta = item["conta"];
    conta.name = item["name"];
    listaContas.add(conta);
  }

  // Soma total de todos os depósitos
  print("=== Soma total de todos os depósitos");
  print(listaContas.map((elem) => elem.balance).reduce((value, element) => value+element));

  // Número total de contas com mais de 100 reais
  print("=== Número total de contas com mais de 100 reais");
  print(listaContas.where((elem) => elem.balance > 100).length);

  // Numero de contas com mais de 100 reais na agencia 33
  print("=== Numero de contas com mais de 100 reais na agencia 33");
  print(listaContas.where((elem) => elem.balance > 100).where((elem) => elem.agencia == 33).length);

  // Agencia com maior saldo e Agencia com menor saldo
  List<Agencia> listaAgencia = new List();
  for (Conta conta in listaContas){
    // print(conta.agencia);
    if (listaAgencia.where((elem)=>elem.id ==conta.agencia).isNotEmpty){
      int id = listaAgencia.indexOf(listaAgencia.where((elem)=>elem.id ==conta.agencia).first);
      listaAgencia[id].balance += conta.balance;
      listaAgencia[id].clientesAgencia.add(conta);

    } else {
       Agencia agencia = new Agencia();
       agencia.balance = conta.balance;
       agencia.clientesAgencia = new List();
       agencia.clientesAgencia.add(conta);
       agencia.id = conta.agencia;
       listaAgencia.add(agencia);
    }
  }
  int maxValue = 0;
  int maxId = 0;
  int minValue = 99999999999;
  int minId = 0;
  for(Agencia elem in listaAgencia){
    if(elem.balance > maxValue){
      maxId = listaAgencia.firstWhere((element) => element.balance > maxValue).id;
      maxValue = elem.balance;
    }
    if(elem.balance < minValue){
      minId = listaAgencia.firstWhere((element) => element.balance < minValue).id;
      minValue = elem.balance;

    }
  };
  print("Agencia com maior saldo: ${maxId} com saldo de ${maxValue}");
  print("Agencia com menor saldo: ${minId} com saldo de ${minValue}");

  // Total do saldo (Cliente com maior saldo em cada agencia)
  List<int> maioresSaldo = new List();
  for(Agencia agencia in listaAgencia) {
    agencia.clientesAgencia.sort((a,b) => b.balance.compareTo(a.balance));
    maioresSaldo.add(agencia.clientesAgencia.first.balance);
    print("=== Agencia ${agencia.id}");
    print("O cliente ${agencia.clientesAgencia.first.name} é o que possui o maior saldo.");
    agencia.clientesAgencia.sort((a,b) => a.balance.compareTo(b.balance));
    print("O cliente ${agencia.clientesAgencia.first.name} é o que possui o menor saldo.");
    print("Nome dos 3 clientes com menores saldos: ${agencia.clientesAgencia[0].name},${agencia.clientesAgencia[1].name},${agencia.clientesAgencia[2].name}");
    print("Total de clientes: ${agencia.clientesAgencia.length}");
    if(agencia.id == 47){
      print("Número de clientes com maria no nome: ${agencia.clientesAgencia.where((element) => element.name.contains("Maria")).length}");
    }
    print("\n");
  };
  print("A soma dos maiores saldos de cada agencia é de: ${maioresSaldo.reduce((value, element) => value+element)}");

  // Lista de clientes com menores saldos
  listaContas.sort((a,b)=>a.id.compareTo(b.id));
  print("O próximo ID da lista de contas é o: ${listaContas.last.id+1}");

  
}
 