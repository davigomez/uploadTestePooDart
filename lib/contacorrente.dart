import 'cliente.dart';

class ContaCorrente {

  ContaCorrente(int novaAgencia,this.conta) {
    if(novaAgencia > 0) _agencia = novaAgencia;
    totalDeContascorrentes++;
  }

  static int totalDeContascorrentes = 0;

 late Cliente titular;
  int _agencia = 145;
  int get agencia => _agencia;
  set agencia(int novaAgencia) => {  if(novaAgencia> 0) _agencia = novaAgencia};



  int conta = 0;
  double _saldo = 20.0;
  double chequeEspecial = -100.0;

   double get saldo {
    return _saldo;
  }
  set saldo (double novoSaldo) {
    if(novoSaldo >= chequeEspecial){
      _saldo = novoSaldo;
    } else{
      print("Erro tentei moidificar o valor de saldo para um valor menor que o do cheque especial");
    }
  }



  bool verificaSaldo(double valor ) {
    if(this.saldo - valor < chequeEspecial){
      print("sem saldo sduficiente");
    return false;
    }else {
      print("Moviemntando $valor reais.");
      return true;
    }
  }


bool tranferencia(double valorDeTranferencia, ContaCorrente contaDestino){
  if(!verificaSaldo(valorDeTranferencia)){
    return false;
  }else{
    this.saldo -= valorDeTranferencia;
    contaDestino.deposito(valorDeTranferencia);
    return true;
  }
}

  bool saque(double valorDoSaque) {
    if(!verificaSaldo (valorDoSaque)){
      return false;
    } else{
      this.saldo -= valorDoSaque;
      return true;
    }

  }

  double deposito(double valorDoDeposito) {
    this.saldo += valorDoDeposito;
    return this._saldo;
  }

}