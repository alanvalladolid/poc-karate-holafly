Feature: sample karate test script

    Background:
        * url 'https://srv.pre.plat.mnvop.net/traveller'

        # Create token
        * def resultToken = call read('classpath:features/createToken.feature')
        * def tokenId = resultToken.tokenId

        # Create traveller
        * def resultTraveller = call read('classpath:features/travellers/getAllTraveller.feature')
        * def travellerId = resultTraveller.travellerId

    Scenario: Update traveller by id
        * def traveller =
            """
            {
                "external_id": "string",
                "name": "string",
                "last_name": "string",
                "email": "user@example.com",
                "phone": "+3453",
                "country": "ABW",
                "preferred_language": "aa",
                "tenant_id": "3fa85f64-5717-4562-b3fc-2c963f66afa6"
            }
            """

        Given path '/api/travellers/', travellerId, ''
        And header Authorization = 'Bearer ' + tokenId
        And header User-Agent = 'hly--avv--dev'
        And request traveller
        When method put
        Then status 200
        And match response == travellerResponse