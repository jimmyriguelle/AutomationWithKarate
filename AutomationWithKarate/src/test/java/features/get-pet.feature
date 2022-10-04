Feature: Validate API Call for GET Pet

Scenario: GET Pet : Validate status code
	Given url 'https://petstore.swagger.io/v2/pet/77' 
	When method get 
	Then status 200
	And print response 