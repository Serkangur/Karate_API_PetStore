Feature: sample karate test script

  Background:
    * url 'https://petstore.swagger.io/v2/user/'


  Scenario: Create User
    * def myBody =
    """
{
  "id": 32145685224,
  "username": "nesringurr2",
  "firstName": "serkan2olmadı",
  "lastName": "gür2",
  "email": "denemeSerkan2@gmail.com",
  "password": "Deneme-2",
  "phone": "5555555227",
  "userStatus": 1
}
    """
    Given request myBody
    When method post
    And status 200
    Then print response.data


  Scenario: Get User
    Given path 'nesringurr2'
    When method get
    Then status 200
    * print response.data















