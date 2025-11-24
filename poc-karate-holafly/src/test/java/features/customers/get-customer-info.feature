Feature: Get Customer Info API

  Background:
    * url 'https://pre-customers-api.holafly.com'
    * configure headers = { 'User-Agent': 'f465af363700e43420c7' }

  Scenario: Get customer info using token from sign-in
    # Call sign-in feature to get authentication data
    * def signInResult = call read('classpath:features/customers/sign-in.feature')
    * def authToken = signInResult.response.token
    * def customerId = signInResult.response.customerId
    
    # Get customer info using the token and customerId
    Given path '/user/' + customerId + '/getInfo'
    And header token = authToken
    When method GET
    Then status 200
    # Validate response time is less than 2 seconds (2000ms)
    And assert responseTime < 2000
    # Validate response schema and values
    And match response == { id: '#string', first_name: '#string', last_name: '#string', email: '#string' }
    And match response.id == customerId
    And match response.email == 'demo@holafly.com'