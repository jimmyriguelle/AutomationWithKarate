package helpers;


import com.github.javafaker.Faker;


public class DataGenerator {
	
	public static String getAnimalId() {
		Faker faker = new Faker();
		String id = faker.number().digit(); 
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
	
	public static String getRandomId() {
		Faker faker = new Faker();
		String randomId = faker.number().digit(); 
		return randomId;	
	}
	
	public static String getFirstName() {
		Faker faker = new Faker();
		String firstName = faker.name().firstName();
		return firstName;	
	}
	
	public static String getLastName() {
		Faker faker = new Faker();
		String lastName = faker.name().lastName();
		return lastName;	
	}
	
	public static String getUserName() {
		Faker faker = new Faker();
		String username = faker.name().username();
		return username;	
	}
	
	public static String getEmail() {
		Faker faker = new Faker();
		String email = faker.name().username() + faker.random().nextInt(0, 100) + "@test.com";
		return email;	
	}
		
	public static String getPassword() {
		Faker faker = new Faker();
		String password = faker.code().ean8();
		return password;	
	}
	
	public static String getPhoneNumber() {
		Faker faker = new Faker();
		String phoneNumber = faker.phoneNumber().cellPhone();
		return phoneNumber;	
	}
	
	public static int getUserStatus() {
		Faker faker = new Faker();
		int userStatus = faker.number().numberBetween(1, 9);
		return userStatus;	
	}
	
}
