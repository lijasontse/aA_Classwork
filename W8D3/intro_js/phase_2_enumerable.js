Array.prototype.myEach = function(callback) { 
  for (let i = 0; i < this.length; i++) {
    let ele = this[i];
    callback(ele);
  }
}

//callback test case
const addTen = function(ele) {
  return ele + 10;
}

// console.log(arr.myEach(addTen))


Array.prototype.myMap = function(callback) {
  let result = [];

  const closure = function(ele) {
    result.push(callback(ele));
  }
  this.myEach(closure);

  // this.myEach(function(ele) {
  //   result.push(callback(ele);
  // });

  return result;
}

// console.log(arr.myMap(addTen));

Array.prototype.myReduce = function(callback, initialValue) {

  let arr = this

  if (this.length > 0) {
    initialValue = this[0];
    arr = this.slice(1, this.length) //slice(startIdx, endIdx) endIdx is exclusive
  }

  let result = initialValue;

  arr.myEach( function(el) {
    result = callback(result, el)
  })

  return result;
}

let arr = [1, 2, 3, 4];
const addSum = function(a, b) {
  return a + b;
}

//console.log(arr.myReduce(addSum, 0))
