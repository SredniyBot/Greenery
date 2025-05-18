var t=document.getElementById('pros');
if(t != null){
document.getElementById('pros').addEventListener('click', function(e) {

   var c= document.getElementById('productNumber');
    if(parseInt(c.value)+1<=20)
    c.setAttribute('value',parseInt(c.value)+1);

    console.log('DDDDDDD');

});

document.getElementById('cons').addEventListener('click', function(e) {
   var c= document.getElementById('productNumber');
        if(parseInt(c.value)-1>=1)
    c.setAttribute('value',parseInt(c.value)-1);

    
    console.log('DDDDDDD');

});
}

