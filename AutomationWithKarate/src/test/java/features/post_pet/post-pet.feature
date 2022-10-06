Feature: Validate API Call for POST PET

  Background: 
    * url 'https://petstore.swagger.io/v2'
    * def DataGenerator = Java.type('helpers.DataGenerator')

  @test
  Scenario: POST - Pet : Validate status code
    Given url 'https://petstore.swagger.io/v2/pet'
    When request read('post-pet.json')
    And method POST
    Then status 200
    And print response


  Scenario: POST - Pet : Print Status Code
    Given path 'pet'
    When request read('post-pet.json')
    And method POST
    Then status 200
    And print response
    And print 'Le status code est : ' + responseStatus


  Scenario: POST - Pet : Manipuler un ID dynamique dans la requete
    * def id = DataGenerator.getAnimalId()
    * def name = DataGenerator.getAnimalName()
    * def animalType = DataGenerator.getAnimalType()
    Given path 'pet'
    * print 'Debug purpose: Animal Id will be : ' + id
    * print 'Debug purpose: Animal Name will be : ' + name
    * print 'Debug purpose: Animal Type will be : ' + animalType
    When request
      """
      {
        "id": "#(id)",
        "category": {
          "id": 0,
          "name": "#(name)"
        },
        "name": "#(animalType)",
        "photoUrls": [
          "string"
        ],
        "tags": [
          {
            "id": 0,
            "name": "string"
          }
        ],
        "status": "available"
      }
      """
    And method POST
    Then status 200
    And print response

  Scenario: POST - Pet : Manipuler un ID dynamique depuis le fichier json
    Given path 'pet'
    When request read('post-pet.json')
    And method POST
    Then status 200
    And print response
    And print 'Le status code est : ' + responseStatus
