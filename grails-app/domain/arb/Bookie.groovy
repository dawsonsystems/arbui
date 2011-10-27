package arb

class Bookie {

  String name
  String login
  String securityAnswer

  BookieTransaction lastTransaction

  static transients = ['availableBalance']
  
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

  //Total - liability
  def getAvailableBalance() {

    def activeBetLegs = BetLeg.withCriteria {
      eq("bookie", this)
      bet {
        isNull("winningLeg")
        eq("voided", false)
      }
    }

    def liability = activeBetLegs.sum { it.input }

    if (liability == null) {
      liability = 0
    }

    if (lastTransaction) {
      return lastTransaction.bookieBalance - liability
    }
    return 0
  }

  static hasMany = [transactions:BookieTransaction]

  static constraints = {
    lastTransaction(nullable:true)
  }
}
