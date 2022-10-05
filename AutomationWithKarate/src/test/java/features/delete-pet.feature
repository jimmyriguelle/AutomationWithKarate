Feature: Validate API Call for DELETE Pet

  Background: 
    * url 'https://petstore.swagger.io/v2'
    * def DataGenerator = Java.type('helpers.DataGenerator')
    

  Scenario: POST/GET/DELETE Pet : Creer/Recuperer/Effacer dynamiquement un animal
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
    And print response.id
    * headers { Authorization: 'special-key'}
    And url 'https://petstore.swagger.io/v2/pet/' + response.id
    When method delete
    And print response
    And url 'https://petstore.swagger.io/v2/pet/' + response.id
    And print response 
