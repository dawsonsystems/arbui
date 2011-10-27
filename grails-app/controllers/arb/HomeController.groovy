package arb

class HomeController {

    def index = {

      def currentArbs = Bet.withCriteria {
        ge("end", new Date())
        eq("voided", false)
        isNull("winningLeg")
      }
      def arbsToClose = Bet.withCriteria {
        lt("end", new Date())
        eq("voided", false)
        isNull("winningLeg")
      }

      [activeArbs:currentArbs, expiredArbs:arbsToClose]
    }
}
