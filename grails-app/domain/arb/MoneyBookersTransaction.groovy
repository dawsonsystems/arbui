package arb

class MoneyBookersTransaction {
  BigDecimal moneyIn = 0
  BigDecimal moneyOut = 0
  BigDecimal balance

  BookieTransaction bookieTransaction

  Date dateCreated
  Date lastUpdated

  static constraints = {
    bookieTransaction(nullable:true)
  }
}
