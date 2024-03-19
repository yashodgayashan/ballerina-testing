import ballerina/test;

@test:Config{}
public function testGreeting(){
    string greeting = printGreeting("Sam");
    test:assertEquals(greeting, "Hello, Sam!");
}
