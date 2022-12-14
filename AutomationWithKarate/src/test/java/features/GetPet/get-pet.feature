Feature: Validate API Call for GET Pet

  Background: 
    * url 'https://petstore.swagger.io/v2'
    * def DataGenerator = Java.type('helpers.DataGenerator')
    #* def responseId = response.id

  Scenario: POST - Pet : Print Status Code
    Given path 'pet'
    When request read('get-pet.json')
    And method POST
    Then status 200
    And print response
    And print 'Le status code est : ' + responseStatus

  Scenario: GET Pet : Validate status code
    Given url 'https://petstore.swagger.io/v2/pet/88'
    When method get
    Then status 200
    And print response
    
  Scenario: GET Pet : Recuperer dynamiquement un animal
    #* def dynamicId = call read('get-pet.feature@tag3')
    * def data = read('get-pet.json')
    * print data
    * def animalIdFromJSON = data.id
    * print animalIdFromJSON
    Given url 'https://petstore.swagger.io/v2/pet/' + animalIdFromJSON
    When method get
    Then status 200
    And print response
    
  @tag3
  Scenario: POST Pet : Creer dynamiquement un animal
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
    
  Scenario: POST/GET Pet : Creer dynamiquement un animal et le recuperer dynamiquement 
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
    And url 'https://petstore.swagger.io/v2/pet/' + response.id
    When method get
    Then status 200
    And print response

