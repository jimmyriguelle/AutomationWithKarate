#syntax
#* headers { Authorization: 'special-key'}
#* header Authorization = 'special-key'
Feature: Validate API Call for DELETE Pet

  Background: 
    * def DataGenerator = Java.type('helpers.DataGenerator')
    
  Scenario: DELETE Pet : Delete a pet previously created
  #Pet is created by calling 'post-pet-common.feature'
		* def postPetContext = call read('post-pet-common.feature')
		* print 'Debug purpose: ' + postPetContext.animalResponseId
    * configure headers = { Authorization: 'special-key'}
    Given url 'https://petstore.swagger.io/v2/pet/' + postPetContext.animalResponseId
    When method delete
    And print response
    And print 'Debug purpose: ' + response.message 
