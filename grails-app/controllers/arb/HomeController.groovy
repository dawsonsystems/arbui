package arb

class HomeController {

    def index = {

      def currentArbs = Bet.findAllByEndGreaterThanEquals(new Date()).sort {it.end}
      def arbsToClose =Bet.findAllByEndLessThan(new Date()).sort {it.end}

      [activeArbs:currentArbs, expiredArbs:arbsToClose]
    }
}
