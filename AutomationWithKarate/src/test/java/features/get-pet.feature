Feature: Validate API Call for GET Pet

  Background: 
    * url 'https://petstore.swagger.io/v2'
    * def DataGenerator = Java.type('helpers.DataGenerator')
    #* def responseId = response.id

  #Scenario: GET Pet : Validate status code
    #Given url 'https://petstore.swagger.io/v2/pet/77'
    #When method get
    #Then status 200
    #And print response
    
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
    
  #Scenario: GET Pet : Recuperer dynamiquement un animal
    #* print responseId
    #Given url 'https://petstore.swagger.io/v2/pet/' + responseId
    #When method get
    #Then status 200
    #And print response

  #Scenario: GET Pet : Creer dynamiquement un animal et recuperer ID depuis la reponse pour faire un GET
    #Given path '77'
    #When method get
    #Then status 200
    #And print response
    #* responseId = response.id

  #Scenario: GET Pet : Creer dynamiquement un animal et recuperer ID depuis la reponse pour faire un GET
    #Given path 'response.id'
    #When method get
    #Then status 200
    #And print response
    #* responseId = response.id
