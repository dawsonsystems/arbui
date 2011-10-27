package com.dawsonsystems.arbui

import grails.plugin.spock.UnitSpec

class SomethingSpec extends UnitSpec {

  def "first test"() {
    when: "something"
      def edge = "wibble"

    then:
      edge=="wibble"
  }

}
