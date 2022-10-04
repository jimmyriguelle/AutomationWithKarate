Feature: Validate API Call for GET Pet

Background:
* url 'https://petstore.swagger.io/v2/pet' 


Scenario: GET Pet : Validate status code
	Given url 'https://petstore.swagger.io/v2/pet/77' 
	When method get 
	Then status 200
	And print response
	
Scenario: GET Pet : Creer et Recuperer dynamiquement un animal
	Given path '77' 
	When method get 
	Then status 200
	And print response 

Scenario: GET Pet : Creer dynamiquement un animal et recuperer ID depuis la reponse pour faire un GET
	Given path '77' 
	When method get 
	Then status 200
	And print response
	* responseId = response.id

Scenario: GET Pet : Creer dynamiquement un animal et recuperer ID depuis la reponse pour faire un GET
	Given path 'response.id' 
	When method get 
	Then status 200
	And print response
	* responseId = response.id
