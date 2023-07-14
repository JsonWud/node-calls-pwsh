# node-calls-pwsh

## Install and Run

- clone

- npm install

- npm start

## Expectations

This works as expected on macos Ventura 13.4.1 (22F82) with:

- node v18.7.0

- pwsh v7.3.6
 
 ### Expected output

```
|;|;|;|;|;|   Hello World  |;|;|;|;|;|`
stdout: {
  "prop1": "value1",
  "prop2": "{\"prop1\":\"value1\",\"prop2\":\"xyz\",\"prop3\":{\"array1\":[\"a\",\"b\",\"c\"]}}",
  "prop3": {
    "array1": [
      "a",
      "b",
      "c"
    ]
  }
}

stdout: {
  "prop1": "value1",
  "prop2": "xyz",
  "prop3": {
    "array1": [
      "a",
      "b",
      "c"
    ]
  },
  "status": "success",
  "answer": 42,
  "errors": null
}

|;|;|;|;|;|   pwsh child process exited with code 0  |;|;|;|;|;|
```
