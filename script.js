// The script is running!
console.log('|;|;|;|;|;|   Hello World  |;|;|;|;|;|`')
// We will send this JSON object to the pwsh script
testRequest = {
    "prop1": "value1",
    "prop2": "xyz",
    "prop3": {
        "array1": [
            "a",
            "b",
            "c"
        ]
    }
}
// Use node's child_process to spawn a pwsh process to run a script
const { spawn } = require('child_process');
const requestJson = testRequest ? JSON.stringify(testRequest) : '';
const child = spawn('pwsh', ['./script.ps1', requestJson]);
child.stdout.on('data', (data) => {
    console.log(`stdout: ${data}`);
});
child.stderr.on('data', (data) => {
    console.error(`stderr: ${data}`);
});
child.on('close', (code) => {
    console.log(`|;|;|;|;|;|   pwsh child process exited with code ${code}  |;|;|;|;|;|`);
});
