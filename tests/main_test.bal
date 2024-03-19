import ballerina/test;

@test:Config {
    groups: ["math", "add"],
    after: intAddTest2
}    
function intAddTest() {
    test:assertEquals(add(1, 3), 4);
}

@test:Config {
    groups: ["math", "add"]
}
function intAddTest2() {
    test:assertNotEquals(add(1, 3), 5);
}

@test:Config {
    groups: ["math", "sub"],
    after: intSubTest2
}
function intSubTest() {
    test:assertEquals(subtract(3, 1), 2);
}

@test:Config {
    groups: ["math", "sub"]
}
function intSubTest2() {
    test:assertNotEquals(subtract(3, 1), 3);
}

@test:Config {
    groups: ["math", "mul"],
    after: intMulTest2
}
function intMulTest() {
    test:assertEquals(multiply(2, 3), 6);
}

@test:Config {
    after: intMulTest,
    groups: ["math", "mul"]
}
function intMulTest2() {
    test:assertNotEquals(multiply(2, 3), 7);
}

@test:Config {
    groups: ["math", "div"]
}
function intDivTest() {
    test:assertEquals(divide(6, 3), 2);
}

@test:Config {
    before: intDivTest,
    groups: ["math", "div"],
    enable: false,
    dependsOn: [intMulTest]
}
function intDivTest2() {
    test:assertNotEquals(divide(6, 3), 3);
}