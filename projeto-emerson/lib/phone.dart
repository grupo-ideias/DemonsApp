class Phone {
  
  String number;
  bool blocked = false;

  Phone (String number, bool blocked) {
    this.number = number;
    this.blocked = blocked;
  }

  String getNumber() {
    return this.number;
  }

  void setNumber(String number) {
    this.number = number;
  }

  bool isBlocked() {
    return this.blocked;
  }

  void setBlocked(bool blocked) {
    this.blocked = blocked;
  }

  @override
  String toString() {
    return ("{numero: " + this.number + ", " + "bloqueado: " + (this.blocked ? "S" : "N") + "}");
  }

}