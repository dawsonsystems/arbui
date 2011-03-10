package arb

class BookieTransactionController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [bookieTransactionInstanceList: BookieTransaction.list(params), bookieTransactionInstanceTotal: BookieTransaction.count()]
    }

    def create = {
        def bookieTransactionInstance = new BookieTransaction()
        bookieTransactionInstance.properties = params
        return [bookieTransactionInstance: bookieTransactionInstance]
    }

    def save = {
        def bookieTransactionInstance = new BookieTransaction(params)
        if (bookieTransactionInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'bookieTransaction.label', default: 'BookieTransaction'), bookieTransactionInstance.id])}"
            redirect(action: "show", id: bookieTransactionInstance.id)
        }
        else {
            render(view: "create", model: [bookieTransactionInstance: bookieTransactionInstance])
        }
    }

    def show = {
        def bookieTransactionInstance = BookieTransaction.get(params.id)
        if (!bookieTransactionInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'bookieTransaction.label', default: 'BookieTransaction'), params.id])}"
            redirect(action: "list")
        }
        else {
            [bookieTransactionInstance: bookieTransactionInstance]
        }
    }

    def edit = {
        def bookieTransactionInstance = BookieTransaction.get(params.id)
        if (!bookieTransactionInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'bookieTransaction.label', default: 'BookieTransaction'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [bookieTransactionInstance: bookieTransactionInstance]
        }
    }

    def update = {
        def bookieTransactionInstance = BookieTransaction.get(params.id)
        if (bookieTransactionInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (bookieTransactionInstance.version > version) {
                    
                    bookieTransactionInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'bookieTransaction.label', default: 'BookieTransaction')] as Object[], "Another user has updated this BookieTransaction while you were editing")
                    render(view: "edit", model: [bookieTransactionInstance: bookieTransactionInstance])
                    return
                }
            }
            bookieTransactionInstance.properties = params
            if (!bookieTransactionInstance.hasErrors() && bookieTransactionInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'bookieTransaction.label', default: 'BookieTransaction'), bookieTransactionInstance.id])}"
                redirect(action: "show", id: bookieTransactionInstance.id)
            }
            else {
                render(view: "edit", model: [bookieTransactionInstance: bookieTransactionInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'bookieTransaction.label', default: 'BookieTransaction'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def bookieTransactionInstance = BookieTransaction.get(params.id)
        if (bookieTransactionInstance) {
            try {
                bookieTransactionInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'bookieTransaction.label', default: 'BookieTransaction'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'bookieTransaction.label', default: 'BookieTransaction'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'bookieTransaction.label', default: 'BookieTransaction'), params.id])}"
            redirect(action: "list")
        }
    }
}
