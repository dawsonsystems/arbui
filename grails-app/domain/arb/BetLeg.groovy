package arb

class BetLeg {
  Bet bet
  Bookie bookie
  BigDecimal input
  BigDecimal output
  BigDecimal profit
  BigDecimal totalReturn
  BigDecimal endProfit
  static belongsTo = Bet
  static constraints = {
    output(nullable:true)
    profit(nullable:true)
    totalReturn(nullable:true)
    endProfit(nullable:true)
  }

  void recordLoss() {
    bookie.transaction(new BookieTransaction(moneyIn:input))
    endProfit = 0
    totalReturn = 0
    output = 0
  }

  void recordWin() {
    bookie.transaction(new BookieTransaction(moneyIn:input))
    endProfit = 0
    totalReturn = 0
    output = 0
  }
}
