package arb

class BookieTransaction {

  Bookie bookie

  BetLeg betLeg
  MoneyBookersTransaction moneyBookersTransaction

  BigDecimal moneyIn = 0
  BigDecimal moneyOut = 0
  BigDecimal bookieBalance  = 0

  static belongsTo = Bookie

  Date dateCreated

  static constraints = {
    betLeg(nullable:true)
    moneyBookersTransaction(nullable:true)
  }
}
