package features.delete_pet;

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

public class DeletePetTestRunner {
	@Karate.Test
	Karate allDelete() {
        return Karate.run("delete-pet").relativeTo(getClass());
        //execute tous les tests present dans le feature file
        //il est possible de mettre plusieurs files : return Karate.run("post-pet, get-pet").relativeTo(getClass());
    }
	
    @Karate.Test
    Karate deleteByTag() {
        return Karate.run("delete-pet").tags("@tag1").relativeTo(getClass());
    }
 
    @Karate.Test
    Karate deleteMultiTags() {
        return Karate.run("delete-pet").tags("@tag1, @tag2").relativeTo(getClass());
    }
}
