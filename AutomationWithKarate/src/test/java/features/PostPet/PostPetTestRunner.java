package features.PostPet;

import com.intuit.karate.junit5.Karate;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import net.masterthought.cucumber.Configuration;
import net.masterthought.cucumber.ReportBuilder;
import org.apache.commons.io.FileUtils;
import static org.junit.Assert.*;
import org.junit.Test;

public class PostPetTestRunner {
	@Karate.Test
	Karate allPost() {
        return Karate.run("post-pet").relativeTo(getClass());
        //execute tous les tests present dans le feature file
        //il est possible de mettre plusieurs files : return Karate.run("post-pet, get-pet").relativeTo(getClass());
    }
	
    @Karate.Test
    Karate postByTag() {
        return Karate.run("post-pet").tags("@test").relativeTo(getClass());
    }
 
    @Karate.Test
    Karate postMultiTags() {
        return Karate.run("post-pet").tags("@tag1, @tag2").relativeTo(getClass());
    }
}