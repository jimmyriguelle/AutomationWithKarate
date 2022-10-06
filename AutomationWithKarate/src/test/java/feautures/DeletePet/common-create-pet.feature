@ignore
Feature: Helper for generate a Pet

  Background: 
    * url 'https://petstore.swagger.io/v2'
    * def DataGenerator = Java.type('helpers.DataGenerator')

  Scenario: POST - Pet : Create a Pet dynamically
    * def randomAnimalId = DataGenerator.getAnimalId()
    * def randomAnimalName = DataGenerator.getAnimalName()
    * def randomAnimalType = DataGenerator.getAnimalType()
    Given path 'pet'
    * print 'Debug purpose: Animal Id will be : ' + randomAnimalId
    * print 'Debug purpose: Animal Name will be : ' + randomAnimalName
    * print 'Debug purpose: Animal Type will be : ' + randomAnimalType
    When request
      """
      {
        "id": "#(randomAnimalId)",
        "category": {
          "id": 0,
          "name": "#(randomAnimalName)"
        },
        "name": "#(randomAnimalType)",
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
    * def animalResponseId = response.id
    * def animalResponseName = response.category.name
    #* print 'Debug purpose ==> : ' + response.id
    #* print 'Debug purpose ==> : ' + response.category.name 
