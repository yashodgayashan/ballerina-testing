import ballerina/test;
import ballerina/http;

@test:Config {}
public function testGetRandomJoke() {

    // create and assign a test double to the `clientEndpoint` object
    clientEndpoint = test:mock(http:Client, new MockHttpClient());

    // invoke the function to test
    string|error result = getRandomJoke("Sheldon");

    // verify that the function returns the mock value after replacing the name
    test:assertEquals(result, "Mock When Sheldon wants an egg, he cracks open a chicken.");
}
