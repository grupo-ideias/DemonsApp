class Telefone {

  String _numero;
  String _descricao;

  String get numero => _numero;
  String get descricao => _descricao;

  set numero(String numero) {
    _numero = numero;
  }

  set descricao(String descricao) {
    _descricao = descricao;
  }
}