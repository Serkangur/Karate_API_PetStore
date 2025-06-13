package examples.tests;

import com.intuit.karate.junit5.Karate;

class TestsRunner {
    
    @Karate.Test
    Karate testUsers() {
        return Karate.run("tests").relativeTo(getClass());
    }    

}
