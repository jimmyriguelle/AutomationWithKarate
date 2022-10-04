@tag
Feature: Validate API Call for POST PET

  Background: 
    * url 'https://petstore.swagger.io/v2'
  @tag1
  Scenario: POST - Pet : Validate status code
    Given url 'https://petstore.swagger.io/v2/pet'
    When request read('post-pet.json')
    And method POST
    Then status 200
    And print response

  Scenario: POST - Pet : Validate status code
    Given path 'pet'
    When request read('post-pet.json')
    And method POST
    Then status 200
    And print response
    And print responseStatus
