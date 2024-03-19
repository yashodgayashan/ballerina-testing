
import ballerina/test;

function dataGen() returns map<[int, int, int]>|error {
    map<[int, int, int]> dataSet = {
        "test1": [10, 10, 20],
        "test2": [5, 5, 10]
    };
    return dataSet;
}

@test:Config {
    dataProvider: dataGen
}
function testAddition(int num1, int num2, int expectedTotal) returns error? {
    test:assertEquals(add(num1, num2), expectedTotal, msg = "The sum is not correct");
}
