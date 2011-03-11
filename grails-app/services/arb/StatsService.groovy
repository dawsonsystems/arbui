package arb

class StatsService {

  static transactional = true

  def profitOverPreviousDays(int days) {
    return profitOverPeriod(new Date() - days, new Date())
  }

  def profitOverPeriod(Date start, Date end) {

    def betTransactions = BookieTransaction.withCriteria {
      le("dateCreated", end)
      gt("dateCreated", start)
      isNull("moneyBookersTransaction")
    }

    def profit = 0

    betTransactions.each {
      profit += it.moneyIn
      profit -= it.moneyOut
    }
    return profit
  }
}
