package arb

class BetController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def legWon = {
      BetLeg leg = BetLeg.get(params.id)

      leg.bet.winningLeg = leg
      leg.bet.totalProfit = leg.profit

      BetLeg winningLeg = leg
      BetLeg losingLeg = leg.bet.lega == leg ? leg.bet.legb : leg.bet.lega

      losingLeg.bookie.transaction(new BookieTransaction(betLeg:losingLeg, moneyOut:losingLeg.input))
      losingLeg.bookie.save(flush:true)
      
      def winnings = losingLeg.input + winningLeg.profit
      winningLeg.bookie.transaction(new BookieTransaction(betLeg:winningLeg, moneyIn:winnings))

      flash.message="Arb result recorded and arb record has been closed"
      redirect(action:"index", controller:"home")
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [betInstanceList: Bet.list(params), betInstanceTotal: Bet.count()]
    }

    def create = {
        def betInstance = new Bet()
        betInstance.properties = params
        return [betInstance: betInstance]
    }

    def save = {
        def betInstance = new Bet(params)

        betInstance.lega.save()
        betInstance.legb.save()
        betInstance.lega.bet = betInstance
        betInstance.legb.bet = betInstance

        if (betInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'bet.label', default: 'Bet'), betInstance.id])}"
            redirect(action: "index", controller:"home")
        }
        else {
            render(view: "create", model: [betInstance: betInstance])
        }
    }

    def show = {
        def betInstance = Bet.get(params.id)
        if (!betInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'bet.label', default: 'Bet'), params.id])}"
            redirect(action: "list")
        }
        else {
            [betInstance: betInstance]
        }
    }

    def edit = {
        def betInstance = Bet.get(params.id)
        if (!betInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'bet.label', default: 'Bet'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [betInstance: betInstance]
        }
    }

    def update = {
        def betInstance = Bet.get(params.id)
        if (betInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (betInstance.version > version) {
                    
                    betInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'bet.label', default: 'Bet')] as Object[], "Another user has updated this Bet while you were editing")
                    render(view: "edit", model: [betInstance: betInstance])
                    return
                }
            }
            betInstance.properties = params
            if (!betInstance.hasErrors() && betInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'bet.label', default: 'Bet'), betInstance.id])}"
                redirect(action: "show", id: betInstance.id)
            }
            else {
                render(view: "edit", model: [betInstance: betInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'bet.label', default: 'Bet'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def betInstance = Bet.get(params.id)
        if (betInstance) {
            try {
                betInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'bet.label', default: 'Bet'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'bet.label', default: 'Bet'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'bet.label', default: 'Bet'), params.id])}"
            redirect(action: "list")
        }
    }
}
