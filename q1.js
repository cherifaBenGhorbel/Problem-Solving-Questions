const fs = require('fs');
const path = './document.txt';

//check if a caracter is a digit
const isDigit = (char) => {
    return char >= '0' && char <= '9';
}



fs.readFile(path, 'utf8', (err, data) => {
    if (err) {
        console.error(err);
        return;
    }


    const lines = data.split('\n');
    let total = 0;


    for (let i = 0; i < lines.length; i++) {
        const line = lines[i];
        let firstDigit = null;
        let lastDigit = null;

        // find the first digit
        for (let j = 0; j < line.length; j++) {
            if (isDigit(line[j])) {
                firstDigit = line[j];
                break;
            }
        }

        //find the last one
        for (let j = line.length - 1; j >= 0; j--) {
            if (isDigit(line[j])) {
                lastDigit = line[j];
                break;
            }
        }

        // now we combine the two digit and add them to the total
        if (firstDigit !== null && lastDigit !== null) {
            total += parseInt(firstDigit + lastDigit); 
        }
    }
    console.log(total);
});
