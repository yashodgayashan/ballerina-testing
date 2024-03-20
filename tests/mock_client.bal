import ballerina/http;

public client class MockHttpClient {

    remote function get(string path, map<string|string[]>? headers = (), http:TargetType targetType = http:Response) returns http:Response|anydata|http:ClientError {
        Joke joke = {"value": "Mock When Chuck Norris wants an egg, he cracks open a chicken."};
        return joke;
    }

}