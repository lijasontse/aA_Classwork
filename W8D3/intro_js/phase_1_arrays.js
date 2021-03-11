Array.prototype.uniq = function() {
    result = [];
    for (let i = 0; i < this.length; i++) {
        el = this[i];
        if (!result.includes(el)) {
            result.push(el);
        }
    }
    return result;
}

arr = [1, 2, 2, 3, 3, 3]
console.log(arr.uniq())

Array.prototype.twoSum = function() {
    result = [];
    for (let i = 0; i < this.length - 1; i++) {
        for (let j = i + 1; j < this.length; j++) {
            if (this[i] + this[j] === 0) {
                result.push([i, j]);
            }
        }
    }
    return result;
}

arr = [1, -2, 2, 3, -3, 3]
console.log(arr.twoSum())

Array.prototype.transpose = function() {
    result = [];
    for (let i = 0; i < this[0].length; i++) {
        let newSub = [];
        for (let j = 0; j < this.length; j++) {
            newSub.push(this[j][i]);
        }
        result.push(newSub);
    }
    return result;
}

matrix = [
    [1, 2, 3, 4],
    [4, 5, 6],
    [7, 8, 9]
]
console.log(matrix.transpose())
