package arb

class AppFilters {
  def statsService

  def filters = {
    all(controller: '*', action: '*') {
      before = {
        calculateTotals(request)
      }

      after = {
        calculateTotals(request)
      }
    }
  }

  def calculateTotals(def request) {
    def potSize = 0
    Bookie.list().each {
      if (it.lastTransaction?.bookieBalance) {
        potSize += it.lastTransaction.bookieBalance
      }
    }

    def liability = 0

    Bet.findAllByWinningLegIsNull().each {
      liability += it.lega.input
      liability += it.legb.input
    }

    MoneyBookersTransaction.find("from arb.MoneyBookersTransaction order by dateCreated")

    request.moneybookersTotal = (MoneyBookersTransaction.find("from arb.MoneyBookersTransaction order by dateCreated desc")?.balance) ?: 0

    request.potSize = potSize + request.moneybookersTotal
    request.liabilities = liability
    request.profit30 = statsService.profitOverPreviousDays(30)
    request.profit14 = statsService.profitOverPreviousDays(14)
    request.profit7 = statsService.profitOverPreviousDays(7)
  }
}
