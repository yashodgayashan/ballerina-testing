import ballerina/test;
import ballerina/http;


@test:Mock { functionName: "initializeClient" }
function getMockClient() returns http:Client|error {
    return test:mock(http:Client, new MockHttpClient());
}

@test:Config {}
public function testGetRandomJoke() {

    // invoke the function to test
    string|error result = getRandomJoke("Sheldon");

    // verify that the function returns the mock value after replacing the name
    test:assertEquals(result, "Mock When Sheldon wants an egg, he cracks open a chicken.");
}
