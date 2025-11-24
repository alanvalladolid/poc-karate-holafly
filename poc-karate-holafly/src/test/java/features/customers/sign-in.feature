Feature: Sign In API

  Background:
    * url 'https://pre-customers-api.holafly.com'
    * configure headers = { 'Content-Type': 'application/json', 'User-Agent': 'f465af363700e43420c7' }

  Scenario: Validate sign in endpoint returns 200
    Given path '/auth/web/signIn'
    And request { email: 'demo@holafly.com', verificationCode: '12345' }
    When method POST
    Then status 200
    # Validate response schema structure
    And match response == { email: '#string', customerId: '#string', verificationCode: '#string', token: '#string' }
    # Validate specific values
    And match response.email == 'demo@holafly.com'
    And match response.verificationCode == '12345'
    And match response.customerId == '#notnull'
    And match response.token == '#notnull'
    # Validate token is a JWT (contains dots)
    And match response.token contains '.'
