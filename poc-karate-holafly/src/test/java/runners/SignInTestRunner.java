package runners;

import com.intuit.karate.junit5.Karate;

class SignInTestRunner {

    @Karate.Test
    Karate testSignIn() {
        return Karate.run("classpath:features/customers/sign-in.feature").relativeTo(getClass());
    }
}