@tag
Feature: Validate API Call for POST PET

  Background: 
    * url 'https://petstore.swagger.io/v2'
    * def DataGenerator = Java.type('helpers.DataGenerator')

  @tag1
  Scenario: POST - Pet : Validate status code
    Given url 'https://petstore.swagger.io/v2/pet'
    When request read('post-pet.json')
    And method POST
    Then status 200
    And print response

  @tag2
  Scenario: POST - Pet : Print Status Code
    Given path 'pet'
    When request read('post-pet.json')
    And method POST
    Then status 200
    And print response
    And print 'Le status code est : ' + responseStatus

  @tag3
  Scenario: POST - Pet : Manipuler un ID dynamique dans la requete
    * def id = DataGenerator.getAnimalId()
    * def name1 = DataGenerator.getAnimalName()
    * def name2 = DataGenerator.getAnimalType()
    Given path 'pet'
    * print 'Debug: Animal Id will be : ' + id
    * print 'Debug: Animal Name will be : ' + name1
    * print 'Debug: Animal Type will be : ' + name2
    When request
      """
      {
        "id": "#(id)",
        "category": {
          "id": 0,
          "name": "#(name1)"
        },
        "name": "#(name2)",
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
