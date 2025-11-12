Feature: sample karate test script

    Background:
        * url 'https://srv.pre.plat.mnvop.net/traveller'

    Scenario: E2E traveller
        #Create traveller
        * def createResult = call read('classpath:features/travellers/createTraveller.feature')
        * def travellerId = createResult.travellerId
        * def tokenId = createResult.tokenId

        #Search traveller
        * call read('classpath:features/travellers/getTraveller.feature') { tokenId: '#(createResult.tokenId)', travellerId: '#(createResult.travellerId)' }

        #Delete traveller
        * call read('classpath:features/travellers/deleteTraveller.feature') { tokenId: '#(createResult.tokenId)', travellerId: '#(createResult.travellerId)' }

