function range(start, end) {
  if (start > end) {
    return [];
  }

  return [start].concat(range(start + 1, end));
}

//console.log(range(0,5));

function sumRec(arr) {
  if (arr.length === 0) {
    return 0;
  }

  return arr[0] + sumRec(arr.slice(1, arr.length));
}

let arr = [1,2,3,4]; // sum = 10;
// console.log(sumRec(arr));

//Version 1 Exponent Recursion
function exponent(base, exp) {
  if (exp === 0) {
    return 1;
  }

  return base * exponent(base, exp - 1);
}

//Version 2 Exponent Recursion
function exponentV2(base, exp) {
  if (exp === 0) {
    return 1;
  }

  if (exp % 2 === 0) {
    return Math.pow(exponentV2(base, exp / 2), 2);
  }
  else {
    return base * Math.pow(exponentV2(base, (exp - 1) / 2), 2); 
  }
}

//console.log(exponent(2, 3));
// console.log(exponentV2(2, 4));

function fibonacci(n) {
  if (n <= 1) {
    return [1];
  }
  if (n === 2) {
    return [1, 1];
  }

  let prev = fibonacci(n - 1);
  let nextNum = prev.slice(prev.length - 1, prev.length) + prev(prev.length - 2, prev.length //NOT FINISHED
  prev.push(nextNum)

}

console.log(fibonacci(6)); //=[1,1,2,3,5,8]
