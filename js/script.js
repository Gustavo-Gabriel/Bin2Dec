var bin = document.getElementById('binario');
var dec = document.getElementById('decimal');

function binToDec(){
    dec.value = parseInt(bin.value, 2);
}