Feature: sample karate test script

  Background:
    * url 'https://petstore.swagger.io/v2/user/'


  Scenario: Create User
    * def myBody =
    """
{
  "id": 32145685224,
  "username": "nesringurr2",
  "firstName": "serkan2",
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

  Scenario: Creating a user with special characters in the username
    * def myBody =
    """
{
  "id": $$$$$$$,
  "username": "$$$$$$$",
  "firstName": "$$$$$$$",
  "lastName": "$$$$$$",
  "email": "$$$$$$$@gmail.com",
  "password": "$$$$$$$$",
  "phone": "$$$$$$$$$",
  "userStatus": $
}
    """
    Given request myBody
    When method post
    And status 404
    Then print response.data

  Scenario: Get User
    Given path 'nesringurr2'
    When method get
    Then status 200
    * print response.data


  Scenario: Creating a user with an empty username
    * def myBody =
    """
{
  "id": 321456852547,
  "username": "",
  "firstName": "serkan2",
  "lastName": "gür2",
  "email": "denemeSerkan2@gmail.com",
  "password": "Deneme-2",
  "phone": "5555555227",
  "userStatus": 1
}
    """
    Given request myBody
    When method post
    And status 404
    Then print response.data

  Scenario: Creating a user with an empty id
    * def myBody =
    """
{
  "id":,
  "username": "serkangur002",
  "firstName": "serkan2",
  "lastName": "gür2",
  "email": "denemeSerkan2@gmail.com",
  "password": "Deneme-2",
  "phone": "5555555227",
  "userStatus": 1
}
    """
    Given request myBody
    When method post
    And status 404
    Then print response.data

  Scenario: Creating a user with an empty lastname
    * def myBody =
    """
{
  "id": 321456852547,
  "username": "serkangur002",
  "firstName": "serkan2",
  "lastName": "",
  "email": "denemeSerkan2@gmail.com",
  "password": "Deneme-2",
  "phone": "5555555227",
  "userStatus": 1
}
    """
    Given request myBody
    When method post
    And status 404
    Then print response.data

  Scenario: Creating a user with an empty e-mail
    * def myBody =
    """
{
  "id": 321456852547,
  "username": "serkangur002",
  "firstName": "serkan2olmadı",
  "lastName": "gür2",
  "email": "",
  "password": "Deneme-2",
  "phone": "5555555227",
  "userStatus": 1
}
    """
    Given request myBody
    When method post
    And status 404
    Then print response.data


  Scenario: Update User
    Given path 'nesringurr2'
    * def myBody =
    """
    {
  "id": 32145685224,
  "username": "serkanguryeni",
  "firstName": "serkan",
  "lastName": "gür",
  "email": "deneme1@gmail.com",
  "password": "deneme-1",
  "phone": "5555555555",
  "userStatus": 0
}
    """
    And request myBody
    When method put
    And status 200
    Then print response.data

  Scenario: Login
    Given path 'login'
    And param username = 'serkanguryeni'
    And param password = 'deneme-1'
    When method get
    Then status 200
    Then print response.data

  Scenario: Login with an incorrect username
    Given path 'login'
    And param username = 'serkangur1902'
    And param password = 'deneme-1'
    When method get
    Then status 404
    Then print response.data

  Scenario: Login with an incorrect password
    Given path 'login'
    And param username = 'serkanguryeni'
    And param password = 'deneme-002'
    When method get
    Then status 404
    Then print response.data

  Scenario: Login with an empty username
    Given path 'login'
    And param username = ''
    And param password = 'deneme-1'
    When method get
    Then status 404
    Then print response.data

  Scenario: Login with an empty password
    Given path 'login'
    And param username = 'serkanguryeni'
    And param password = ''
    When method get
    Then status 404
    Then print response.data

  Scenario: Login with an empty username and password
    Given path 'login'
    And param username = ''
    And param password = ''
    When method get
    Then status 404
    Then print response.data


  Scenario: Logout
    Given path 'logout'
    When method get
    Then status 200
    Then print response.data


  Scenario: User Information Control
    * def myBody =
    """
{
  "id": 32145685224,
  "username": "serkangurdeneme",
  "firstName": "serkan2",
  "lastName": "gür2",
  "email": "denemeSerkan3@gmail.com",
  "password": "Deneme-3",
  "phone": "5555555227",
  "userStatus": 1
}
    """
    Given request myBody
    When method post
    And status 200
    Then print response.data


    # Kullanıcı bilgilerini getirme
    Given path 'serkangurdeneme'
    When method get
    Then status 200
    And match response ==
    """
    {
 "id": 32145685224,
  "username": "serkangurdeneme",
  "firstName": "serkan2",
  "lastName": "gür2",
  "email": "denemeSerkan3@gmail.com",
  "password": "Deneme-3",
  "phone": "5555555227",
  "userStatus": 1
    }
    """

  Scenario: Delete User
    Given path 'serkangurdeneme'
    When method delete
    Then status 200


  Scenario: Deleting a non-existent user
    Given path 'sdfdgfgfhgfh'
    When method delete
    Then status 404














