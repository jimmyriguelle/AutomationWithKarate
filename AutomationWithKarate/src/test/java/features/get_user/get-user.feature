Feature: X

  Background: x
    

Scenario: X
    #User is created by calling 'common-create-user.feature'
    * def postUserContext = call read('common-create-user.feature')
    * print 'Debug purpose: ' + postUserContext.username
    Given url 'https://petstore.swagger.io/v2/user/' + postUserContext.username
    When method get
    Then status 200
    And print response
    * print response.username