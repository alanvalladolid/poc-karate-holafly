package runners;

import com.intuit.karate.junit5.Karate;

class GetCustomerInfoTestRunner {

    @Karate.Test
    Karate testGetCustomerInfo() {
        return Karate.run("classpath:features/customers/get-customer-info.feature").relativeTo(getClass());
    }
}