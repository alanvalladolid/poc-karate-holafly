Feature: sample karate test script

    Background:
        * url 'https://srv.pre.plat.mnvop.net/traveller'

        # Create token
        * def resultToken = call read('classpath:features/createToken.feature')
        * def tokenId = resultToken.tokenId

    Scenario: Get traveller by i
        Given path '/api/travellers', ''
        And header Authorization = 'Bearer ' + tokenId
        And header User-Agent = 'hly--avv--dev'
        When method get
        Then status 200
        * def travellerId = response.results[0].id
        * print 'First Traveller ID:', travellerId
