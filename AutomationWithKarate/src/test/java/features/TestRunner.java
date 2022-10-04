package features;

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

public class TestRunner {
	@Karate.Test
	Karate post() {
        return Karate.run("post-pet").relativeTo(getClass());
    }
    @Karate.Test
    Karate get() {
        return Karate.run("get-pet").relativeTo(getClass());
    }
    @Karate.Test
    Karate testTags() {
        return Karate.run("post-pet").tags("@tag1").relativeTo(getClass());
    }
    @Karate.Test
    Karate testTag2() {
        return Karate.run("post-pet").tags("@tag2").relativeTo(getClass());
    }
    @Karate.Test
    Karate testTag3() {
        return Karate.run("post-pet").tags("@tag2").relativeTo(getClass());
    }
    
    @Test
    public void testParallel() {
        Results results = Runner.path("classpath:features")
                .outputCucumberJson(true)
                .parallel(5);
        generateReport(results.getReportDir());
        assertTrue(results.getErrorMessages(), results.getFailCount() == 0);
    }

    public static void generateReport(String karateOutputPath) {
        Collection<File> jsonFiles = FileUtils.listFiles(new File(karateOutputPath), new String[] {"json"}, true);
        List<String> jsonPaths = new ArrayList<>(jsonFiles.size());
        jsonFiles.forEach(file -> jsonPaths.add(file.getAbsolutePath()));
        Configuration config = new Configuration(new File("target"), "Pet Store Automation");
        ReportBuilder reportBuilder = new ReportBuilder(jsonPaths, config);
        reportBuilder.generateReports();
    }
}
