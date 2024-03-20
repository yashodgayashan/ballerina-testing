import ballerina/test;
import ballerina/http;

@test:Mock { functionName: "initializeClient" }
function getMockClient() returns http:Client|error {
    return test:mock(http:Client);
}

function getMockResponse() returns Joke {
    Joke joke = {"value": "When Chuck Norris wants an egg, he cracks open a chicken."};
    return joke;
}

@test:Config {}
public function testGetRandomJoke() {

    test:prepare(clientEndpoint).when("get").thenReturn(getMockResponse());
    
    // invoke the function to test
    string|error result = getRandomJoke("Sheldon");

    // verify that the function returns the mock value after replacing the name
    test:assertEquals(result, "When Sheldon wants an egg, he cracks open a chicken.");
}
