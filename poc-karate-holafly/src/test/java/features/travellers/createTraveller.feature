Feature: sample karate test script

  Background:
    * url 'https://srv.pre.plat.mnvop.net/traveller'

    # Read json request
    * def travellerRequest = read('classpath:test-data/travellers/travellerRequest.json')

    # Read json response
    * def travellerResponse = read('classpath:test-data/travellers/travellerResponse.json')

    # Create token
    * def resultToken = call read('classpath:features/createToken.feature')
    * def tokenId = resultToken.tokenId

    # Call utils
    * def utils = call read('classpath:utils.js')
    * def email = utils.generateRandomEmail()


  Scenario: Create a traveller and then get it by id
    Given path '/api/travellers', ''
    And header Authorization = 'Bearer ' + tokenId
    And header User-Agent = 'hly--avv--dev'
    And request travellerRequest
    And set travellerRequest.email = email
    When method post
    Then status 201
    And match response == travellerResponse

    * def travellerId = response.id
    * print 'CREATED TRAVELLER ID:', travellerId

