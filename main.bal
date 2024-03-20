import ballerina/http;

final http:Client clientEndpoint = check initializeClient();

function initializeClient() returns http:Client|error {
    return  new ("https://api.chucknorris.io/jokes/");
};

type Joke readonly & record {
    string value;
};

// This function performs a `get` request to the Chuck Norris API and returns a random joke 
// with the name replaced by the provided name or an error if the API invocation fails.
function getRandomJoke(string name) returns string|error {
    Joke joke = check clientEndpoint->get("/random");
    string replacedText = re `Chuck Norris`.replaceAll(joke.value, name);
    return replacedText;
}
