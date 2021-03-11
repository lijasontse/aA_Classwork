Array.prototype.bubbleSort = function() {
  arr = this.slice(0, this.length);

  let sorted = false;
  while (!sorted) {
    for (let i = 0; i < arr.length - 1; i++) {
      sorted = true;
      if (arr[i] > arr[i + 1]) {
        let temp = arr[i + 1];
        arr[i + 1] = arr[i];
        arr[i] = temp;
        sorted = false;
        break;
      }
    }
  }
  return arr;
}

let arr = [8,1,5,3,2,5,7,3,5];
//console.log(arr.bubbleSort());


String.prototype.substrings = function() {
  result = [];

  for(let i = 0; i < this.length; i++) {
    for(let j = i; j < this.length; j++) {
      let temp = this.slice(i, j + 1);
      result.push(temp);
    }
  }
  return result;
}

//cat = ['c', 'ca', 'cat', 'a', 'at', 't']


console.log('cat'.substrings());