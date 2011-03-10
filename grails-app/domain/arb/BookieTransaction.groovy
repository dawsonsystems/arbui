package arb

class BookieTransaction {

  Bookie bookie

  BetLeg betLeg

  BigDecimal moneyIn = 0
  BigDecimal moneyOut = 0
  BigDecimal bookieBalance  = 0

  static belongsTo = Bookie
  
  static constraints = {
    betLeg(nullable:true)
  }
}
