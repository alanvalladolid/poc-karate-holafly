Feature: sample karate test script

    Background:
        * url 'https://hly.eu.auth0.com/oauth'

        # Read json request
        * def tokenBody = read('classpath:test-data/token-data.json')

    Scenario: Create token
        Given path '/token'
        And request tokenBody
        When method post
        Then status 200
        * def tokenId = response.access_token
        * print 'CREATED TOKEN:', tokenId