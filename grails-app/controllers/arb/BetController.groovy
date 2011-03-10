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
      BetLeg losingLeg = leg.bet.lega == leg ? leg.bet.lega : leg.bet.legb

      //TODO create a winning TX adding to winning bookie


      //TODO create a losing TX losing bookie
      winningLeg.bookie.transaction(new BookieTransaction())

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
