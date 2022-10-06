Feature: 

  Background: 
    * url 'https://petstore.swagger.io/v2'
    * def DataGenerator = Java.type('helpers.DataGenerator')
@test
  Scenario: 
    * def id = DataGenerator.getRandomId()
    * def username = DataGenerator.getUserName()
    * def firstName = DataGenerator.getFirstName()
    * def lastName = DataGenerator.getLastName()
    * def email = DataGenerator.getEmail()
    * def password = DataGenerator.getPassword()
    * def phone = DataGenerator.getPhoneNumber()
    * def userStatus = DataGenerator.getUserStatus()
    * print 'Debug purpose: user Id will be : ' + id
    Given path 'user'
    When request
      """
      {
        "id": "#(id)",
        "username": "#(username)",
        "firstName": "#(firstName)",
        "lastName": "#(lastName)",
        "email": "#(email)",
        "password": "#(password)",
        "phone": "#(phone)",
        "userStatus": "#(userStatus)"
      }

      """
    And method POST
    Then status 200
    And print response
    And print response.message
