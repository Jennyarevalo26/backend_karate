package Backend;
import com.intuit.karate.junit5.Karate;

public class user {
    @Karate.Test
    Karate testSample(){
        return Karate.run("classpath:Backend/user.feature").relativeTo(getClass());
    }
}


