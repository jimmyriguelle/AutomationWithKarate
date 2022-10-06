#syntax
#* headers { Authorization: 'special-key'}
#* header Authorization = 'special-key'
@tag1
Feature: Validate API Call for Delete Pet

  Background: 
    * def DataGenerator = Java.type('helpers.DataGenerator')

  @tag2
  Scenario: DELETE Pet : Delete a pet previously created
    #Pet is created by calling 'post-pet-common.feature'
    * def postPetContext = call read('common-create-pet.feature')
    * print 'Debug purpose: ' + postPetContext.animalResponseId
    * configure headers = { Authorization: 'special-key'}
    Given url 'https://petstore.swagger.io/v2/pet/' + postPetContext.animalResponseId
    When method delete
    And print response
    And print 'Debug purpose: ' + response.message
    Then assert response.message == postPetContext.animalResponseId
