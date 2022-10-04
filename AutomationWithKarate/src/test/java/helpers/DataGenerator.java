package helpers;


import com.github.javafaker.Faker;


public class DataGenerator {
	
	public static String getAnimalId() {
		Faker faker = new Faker();
		String id = faker.number().digits(3); 
		return id;
		
	}
	public static String getAnimalName() {
		Faker faker = new Faker();
		String name1 = faker.name().firstName();
		return name1;
		
	}
	public static String getAnimalType() {
		Faker faker = new Faker(); 
		String animalType = faker.animal().name();
		return animalType;	
	}

}
