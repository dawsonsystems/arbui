package arb

class Bet {
  Date start = new Date()
  Date end
  String event

  BetLeg lega
  BetLeg legb

  BetLeg winningLeg

  BigDecimal totalProfit

  static constraints = {
    start(nullable:true)
    end(nullable:true)
    winningLeg(nullable:true)
    lega(nullable:true)
    legb(nullable:true)
    totalProfit(nullable:true)
  }
  static mapping = {
    start column:'start_date'
    end column:'end_date'
  }
}

