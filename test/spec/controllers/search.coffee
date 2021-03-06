'use strict'

describe 'Controller: SearchCtrl', ->

  # load the controller's module
  beforeEach module 'dgsDash'

  SearchCtrl = {}

  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    SearchCtrl = $controller 'SearchCtrl', {
      # place here mocked dependencies
    }

  it 'should attach a list of awesomeThings to the scope', ->
    expect(SearchCtrl.awesomeThings.length).toBe 3
