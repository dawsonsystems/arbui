package arb

class BookieController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [bookieInstanceList: Bookie.list(params), bookieInstanceTotal: Bookie.count()]
    }

    def create = {
        def bookieInstance = new Bookie()
        bookieInstance.properties = params
        return [bookieInstance: bookieInstance]
    }

    def save = {
        def bookieInstance = new Bookie(params)
        if (bookieInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'bookie.label', default: 'Bookie'), bookieInstance.id])}"
            redirect(action: "show", id: bookieInstance.id)
        }
        else {
            render(view: "create", model: [bookieInstance: bookieInstance])
        }
    }

    def show = {
        def bookieInstance = Bookie.get(params.id)
        if (!bookieInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'bookie.label', default: 'Bookie'), params.id])}"
            redirect(action: "list")
        }
        else {
            [bookieInstance: bookieInstance]
        }
    }

    def edit = {
        def bookieInstance = Bookie.get(params.id)
        if (!bookieInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'bookie.label', default: 'Bookie'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [bookieInstance: bookieInstance]
        }
    }

    def update = {
        def bookieInstance = Bookie.get(params.id)
        if (bookieInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (bookieInstance.version > version) {
                    
                    bookieInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'bookie.label', default: 'Bookie')] as Object[], "Another user has updated this Bookie while you were editing")
                    render(view: "edit", model: [bookieInstance: bookieInstance])
                    return
                }
            }
            bookieInstance.properties = params
            if (!bookieInstance.hasErrors() && bookieInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'bookie.label', default: 'Bookie'), bookieInstance.id])}"
                redirect(action: "show", id: bookieInstance.id)
            }
            else {
                render(view: "edit", model: [bookieInstance: bookieInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'bookie.label', default: 'Bookie'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def bookieInstance = Bookie.get(params.id)
        if (bookieInstance) {
            try {
                bookieInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'bookie.label', default: 'Bookie'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'bookie.label', default: 'Bookie'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'bookie.label', default: 'Bookie'), params.id])}"
            redirect(action: "list")
        }
    }
}
