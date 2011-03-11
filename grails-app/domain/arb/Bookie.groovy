package arb

class Bookie {

  String name
  String login
  String securityAnswer

  BookieTransaction lastTransaction

  def transaction(BookieTransaction transaction) {

    def balance = lastTransaction?.bookieBalance ?:  0
    balance += transaction.moneyIn
    balance -= transaction.moneyOut

    transaction.bookieBalance = balance
    transaction.bookie = this

    if (!transaction.validate()) {
      transaction.errors.allErrors.each {
        println it  
      }
    } else {
      transaction.save(flush:true)
    }

    lastTransaction = transaction

    addToTransactions(transaction)
    this.save(flush:true)
  }

  static hasMany = [transactions:BookieTransaction]

  static constraints = {
    lastTransaction(nullable:true)
  }
}
