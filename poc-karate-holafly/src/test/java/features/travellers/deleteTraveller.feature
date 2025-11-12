Feature: sample karate test script

    Background:
        * url 'https://srv.pre.plat.mnvop.net/traveller'

        # Get passed values
        * def passedTokenId = karate.get('tokenId')
        * def passedTravellerId = karate.get('travellerId')

        # Create Token
        * def resultToken = passedTokenId == null ? karate.call('classpath:features/createToken.feature') : null
        * def tokenId = passedTokenId == null ? resultToken.tokenId : passedTokenId

        # Create Traveller
        * def resultTraveller = passedTravellerId == null ? karate.call('classpath:features/travellers/getAllTraveller.feature') : null
        * def travellerId = passedTravellerId == null ? resultTraveller.travellerId : passedTravellerId

    Scenario: Delete traveller by id and verify delete
        Given path '/api/travellers/', travellerId, ''
        And header Authorization = 'Bearer ' + tokenId
        And header User-Agent = 'hly--avv--dev'
        When method delete
        Then status 204

        Given path '/api/travellers/', travellerId, ''
        And header Authorization = 'Bearer ' + tokenId
        And header User-Agent = 'hly--avv--dev'
        When method get
        Then status 404
        And match response.message == 'Resource not found'