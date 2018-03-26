let tools = require("./lib");

function swap (arr, x, y)   {
    let temp = arr[x];
    arr[x] = arr[y];
    arr[y] = temp;
}

function bubleSort(arr)    {
    return arr;
}

function insertSort(arr)    {
    return arr;
}

function selectSort(arr)    {
    return arr;
}   

function mergedSort(arr)    {
    return arr;
}

function quickSort(arr) {
    return arr;
}

console.log("buble sort", bubleSort(tools.genRandomArr()));
console.log("insertSort", insertSort(tools.genRandomArr()));
console.log("selectSort", selectSort(tools.genRandomArr()));
console.log("mergedSort", mergedSort(tools.genRandomArr()));
console.log("quickSort", quickSort(tools.genRandomArr()));

