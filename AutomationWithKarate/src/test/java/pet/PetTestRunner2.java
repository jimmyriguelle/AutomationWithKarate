package pet;

import com.intuit.karate.junit5.Karate;

public class PetTestRunner2 {
    @Karate.Test
    Karate post() {
        return Karate.run("post-pet").relativeTo(getClass());
    }
    @Karate.Test
    Karate get() {
        return Karate.run("get-pet").relativeTo(getClass());
    } 
}