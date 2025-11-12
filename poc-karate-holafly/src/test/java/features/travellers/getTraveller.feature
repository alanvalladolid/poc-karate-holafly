Feature: sample karate test script

    Background:
        * url 'https://srv.pre.plat.mnvop.net/traveller'

        # Read json response
        * def travellerResponse = read('classpath:test-data/travellers/travellerResponse.json')

        # Get passed values
        * def passedTokenId = karate.get('tokenId')
        * def passedTravellerId = karate.get('travellerId')

        # Create Token
        * def resultToken = passedTokenId == null ? karate.call('classpath:features/createToken.feature') : null
        * def tokenId = passedTokenId == null ? resultToken.tokenId : passedTokenId

        # Create Traveller
        * def resultTraveller = passedTravellerId == null ? karate.call('classpath:features/travellers/getAllTraveller.feature') : null
        * def travellerId = passedTravellerId == null ? resultTraveller.travellerId : passedTravellerId

    Scenario: Get traveller by id
        Given path '/api/travellers/', travellerId, ''
        And header Authorization = 'Bearer ' + tokenId
        And header User-Agent = 'hly--aavv--dev'
        When method get
        Then status 200
        And match response == travellerResponse