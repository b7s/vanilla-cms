const os = require('os');
const { exec } = require('child_process');

function getPlatform() {
    const platform = os.platform();
    if (platform === 'win32') {
        return 'Windows';
    } else if (platform === 'darwin') {
        return 'MacOS';
    } else {
        return 'Linux';
    }
}

const currentPlatform = getPlatform();
console.log(`Operational system: ${currentPlatform}`);

function executeInstallCommand() {
    // const command = 'php cms.phar install';
    if (currentPlatform === 'Windows') {
        exec(`start cmd /c install-windows.bat`, handleCommandResult);
    } else {
        exec(`open -a Terminal install-mac-linux.sh`, handleCommandResult);
    }
}

function handleCommandResult(error, stdout, stderr) {
    if (error) {
        console.error(`Error executing command: ${error.message}`);
        return;
    }

    console.log(`Command output:\n${stdout}`);

    if (stderr) {
        console.error(`Command standard error:\n${stderr}`);
    }
}

// Call function to execute commands
executeInstallCommand();
