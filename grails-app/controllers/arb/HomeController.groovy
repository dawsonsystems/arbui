package arb

class HomeController {

    def index = {

      def currentArbs = Bet.findAllByEndGreaterThanEqualsAndWinningLegIsNull(new Date()).sort {it.end}
      def arbsToClose =Bet.findAllByEndLessThanAndWinningLegIsNull(new Date()).sort {it.end}

      [activeArbs:currentArbs, expiredArbs:arbsToClose]
    }
}
