package arb

class Bookie {

  String name
  String login
  String securityAnswer

  BookieTransaction lastTransaction

  def transaction(BookieTransaction transaction) {

    def balance = lastTransaction?.bookieBalance ?:  0
    balance += transaction.moneyIn
    balance -= transaction.moneyIn

    transaction.bookieBalance = balance

    lastTransaction = transaction

    addToTransactions(transaction)
  }

  static hasMany = [transactions:BookieTransaction]

  static constraints = {
    lastTransaction(nullable:true)
  }
}
