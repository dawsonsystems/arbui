package arb

class MoneyBookersTransactionController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        params.sort = "dateCreated"
        params.order= "desc"
        [moneyBookersTransactionInstanceList: MoneyBookersTransaction.list(params), moneyBookersTransactionInstanceTotal: MoneyBookersTransaction.count()]
    }

    def create = {
        def moneyBookersTransactionInstance = new MBookTX()

        return [moneyBookersTransactionInstance: moneyBookersTransactionInstance]
    }
  
  def doCreate = { MBookTX tx ->
    if(tx.hasErrors()) {
      return render(view:"create", model:[moneyBookersTransactionInstance: tx])
    }

    def moneyBookersTransaction = new MoneyBookersTransaction()

    def lastMoneyBookersTransaction = MoneyBookersTransaction.find("from arb.MoneyBookersTransaction order by dateCreated desc")?.balance

    moneyBookersTransaction.balance = lastMoneyBookersTransaction ?: 0

    moneyBookersTransaction.balance += tx.moneyIn ?: 0
    moneyBookersTransaction.balance -= tx.moneyOut ?: 0
    moneyBookersTransaction.moneyIn = tx.moneyIn
    moneyBookersTransaction.moneyOut = tx.moneyOut
    
    moneyBookersTransaction.save(flush:true)

    if (tx.bookie) {
      println "Saving Bookie Transact"
      //generate a new bookie transaction for this
      def bookieTransaction = new BookieTransaction()
      bookieTransaction.moneyBookersTransaction = moneyBookersTransaction
      bookieTransaction.moneyIn = moneyBookersTransaction.moneyOut
      bookieTransaction.moneyOut = moneyBookersTransaction.moneyIn

      tx.bookie.transaction(bookieTransaction)
      moneyBookersTransaction.bookieTransaction = bookieTransaction
    }
    redirect(action:"list")
  }

    def save = {
        def moneyBookersTransactionInstance = new MoneyBookersTransaction(params)
        if (moneyBookersTransactionInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'moneyBookersTransaction.label', default: 'MoneyBookersTransaction'), moneyBookersTransactionInstance.id])}"
            redirect(action: "show", id: moneyBookersTransactionInstance.id)
        }
        else {
            render(view: "create", model: [moneyBookersTransactionInstance: moneyBookersTransactionInstance])
        }
    }

    def show = {
        def moneyBookersTransactionInstance = MoneyBookersTransaction.get(params.id)
        if (!moneyBookersTransactionInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'moneyBookersTransaction.label', default: 'MoneyBookersTransaction'), params.id])}"
            redirect(action: "list")
        }
        else {
            [moneyBookersTransactionInstance: moneyBookersTransactionInstance]
        }
    }

    def edit = {
        def moneyBookersTransactionInstance = MoneyBookersTransaction.get(params.id)
        if (!moneyBookersTransactionInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'moneyBookersTransaction.label', default: 'MoneyBookersTransaction'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [moneyBookersTransactionInstance: moneyBookersTransactionInstance]
        }
    }

    def update = {
        def moneyBookersTransactionInstance = MoneyBookersTransaction.get(params.id)
        if (moneyBookersTransactionInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (moneyBookersTransactionInstance.version > version) {
                    
                    moneyBookersTransactionInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'moneyBookersTransaction.label', default: 'MoneyBookersTransaction')] as Object[], "Another user has updated this MoneyBookersTransaction while you were editing")
                    render(view: "edit", model: [moneyBookersTransactionInstance: moneyBookersTransactionInstance])
                    return
                }
            }
            moneyBookersTransactionInstance.properties = params
            if (!moneyBookersTransactionInstance.hasErrors() && moneyBookersTransactionInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'moneyBookersTransaction.label', default: 'MoneyBookersTransaction'), moneyBookersTransactionInstance.id])}"
                redirect(action: "show", id: moneyBookersTransactionInstance.id)
            }
            else {
                render(view: "edit", model: [moneyBookersTransactionInstance: moneyBookersTransactionInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'moneyBookersTransaction.label', default: 'MoneyBookersTransaction'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def moneyBookersTransactionInstance = MoneyBookersTransaction.get(params.id)
        if (moneyBookersTransactionInstance) {
            try {
                moneyBookersTransactionInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'moneyBookersTransaction.label', default: 'MoneyBookersTransaction'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'moneyBookersTransaction.label', default: 'MoneyBookersTransaction'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'moneyBookersTransaction.label', default: 'MoneyBookersTransaction'), params.id])}"
            redirect(action: "list")
        }
    }
}

class MBookTX {
  Bookie bookie
  BigDecimal moneyIn = 0
  BigDecimal moneyOut = 0

  static constraints = {
    moneyIn(nullable:true)
    moneyOut(nullable:true)
    bookie(nullable:true)
  }
}
