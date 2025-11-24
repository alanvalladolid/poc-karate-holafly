package runners;

import com.intuit.karate.junit5.Karate;

class GetCustomerCardTestRunner {

    @Karate.Test
    Karate testGetCustomerCard() {
        return Karate.run("classpath:features/customers/get-customer-card.feature").relativeTo(getClass());
    }
}
