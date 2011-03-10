package arb

class BetLegController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [betLegInstanceList: BetLeg.list(params), betLegInstanceTotal: BetLeg.count()]
    }

    def create = {
        def betLegInstance = new BetLeg()
        betLegInstance.properties = params
        return [betLegInstance: betLegInstance]
    }

    def save = {
        def betLegInstance = new BetLeg(params)
        if (betLegInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'betLeg.label', default: 'BetLeg'), betLegInstance.id])}"
            redirect(action: "show", id: betLegInstance.id)
        }
        else {
            render(view: "create", model: [betLegInstance: betLegInstance])
        }
    }

    def show = {
        def betLegInstance = BetLeg.get(params.id)
        if (!betLegInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'betLeg.label', default: 'BetLeg'), params.id])}"
            redirect(action: "list")
        }
        else {
            [betLegInstance: betLegInstance]
        }
    }

    def edit = {
        def betLegInstance = BetLeg.get(params.id)
        if (!betLegInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'betLeg.label', default: 'BetLeg'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [betLegInstance: betLegInstance]
        }
    }

    def update = {
        def betLegInstance = BetLeg.get(params.id)
        if (betLegInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (betLegInstance.version > version) {
                    
                    betLegInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'betLeg.label', default: 'BetLeg')] as Object[], "Another user has updated this BetLeg while you were editing")
                    render(view: "edit", model: [betLegInstance: betLegInstance])
                    return
                }
            }
            betLegInstance.properties = params
            if (!betLegInstance.hasErrors() && betLegInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'betLeg.label', default: 'BetLeg'), betLegInstance.id])}"
                redirect(action: "show", id: betLegInstance.id)
            }
            else {
                render(view: "edit", model: [betLegInstance: betLegInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'betLeg.label', default: 'BetLeg'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def betLegInstance = BetLeg.get(params.id)
        if (betLegInstance) {
            try {
                betLegInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'betLeg.label', default: 'BetLeg'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'betLeg.label', default: 'BetLeg'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'betLeg.label', default: 'BetLeg'), params.id])}"
            redirect(action: "list")
        }
    }
}
