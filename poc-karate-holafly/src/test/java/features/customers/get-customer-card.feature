Feature: Get Customer Card API - minimal

	Background:
		* url 'https://pre-customers-api.holafly.com'
		* configure headers = { 'User-Agent': 'f465af363700e43420c7' }

	Scenario: Get customer cards - status and response time only
		# reuse sign-in to obtain token and customerId
		* def signInResult = call read('classpath:features/customers/sign-in.feature')
		* def authToken = signInResult.response.token
		* def customerId = signInResult.response.customerId

		Given path '/api/customerCard/getByCustomerId/' + customerId
		And header token = authToken
		And param perPage = 1
		When method GET
		Then status 200
		And assert responseTime < 2000

