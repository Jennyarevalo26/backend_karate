Feature: Service Users
  As QA Automation
  I want to consult API of userts
  To validate the status code and response

  Background: consume service
    * url urlregres

  Scenario: Check the service Get Method listUsers
    Given path '/api/users?page=2'
    When method get
    Then status 200
    And assert response.total == 12

  Scenario: Check the service Get Method Users negative
    Given path '/api/users/23'
    When method get
    Then status 404

  Scenario: Check the service Post Method register sucessful

    * def requestRegisterSuccessful = { "email": '#(email)',"password": '#(password)' }
    * def responsePostRegisterSuccessful = read('responsePostRegisterSuccessful.json')

    Given path '/api/register'
    And request requestRegisterSuccessful
    When method post
    Then status 200
    And match response == responsePostRegisterSuccessful
    And assert response.id == 4


  Scenario: Check the service Post Method register unsucessful

    * def requestRegisterUnsuccessful = { "email": '#(email)' }

    Given path '/api/register'
    And request requestRegisterUnsuccessful
    When method post
    Then status 400


  Scenario: Check the service Delete Method user
    Given path '/api/users/2'
    When method delete
    Then status 204

  Scenario: Check the service Delete Method user negative
    Given path '/ai/users/2'
    When method delete
    Then status 404


  Scenario: Check the service Put Method updateuser sucessful

    * def requestUpdateSuccessful = { "name": '#(name)',"job": '#(job)' }


    Given path '/api/users/2'
    And request requestUpdateSuccessful
    When method put
    Then status 200
    And assert response.job == "zion resident"

  Scenario: Check the service Put Method updateuser Unsucessful

    * def requestUpdateUnsuccessful = { "name": '#(name)',"job": '#(job)' }


    Given path '/ai/users/2'
    And request requestUpdateUnsuccessful
    When method put
    Then status 404


