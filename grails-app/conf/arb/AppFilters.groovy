package arb

class AppFilters {

    def filters = {
        all(controller:'*', action:'*') {
            before = {
              request.moneybookersTotal = 15.99
              request.potSize = 18.99
              request.liabilities = 2.25
            }
        }
    }
    
}
