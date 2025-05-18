let docIteratorCart=0;

while (document.getElementById('product'+docIteratorCart)!=null){
    let minusBtn = document.getElementById('product'+docIteratorCart+'minus');
    let plusBtn = document.getElementById('product'+docIteratorCart+'plus');
    let text = document.getElementById('product'+docIteratorCart);
    let del = document.getElementById('product'+docIteratorCart+'del');
    let div = document.getElementById('product'+docIteratorCart+'div');
    let cost = document.getElementById('product'+docIteratorCart+'cost');
    let sumcost = document.getElementById('product'+docIteratorCart+'sumcost');
    let commit = document.getElementById('product'+docIteratorCart+'commit');
    let megacost = document.getElementById('megacost');

    minusBtn.addEventListener('click', function(e) {
        let num = parseInt(text.getAttribute('value'));
        if (num-1 == 0){
            del.click();
        }else {
            text.setAttribute('value',String(num-1));
            let mgcstmin=megacost.innerText.replaceAll(/\s/g, '');
            megacost.textContent=String(parseInt(mgcstmin)-parseInt(cost.innerText.replaceAll(/\s/g, '')));
            sumcost.textContent=String(parseInt(sumcost.innerText.replaceAll(/\s/g, ''))-parseInt(cost.innerText.replaceAll(/\s/g, '')));
        }
        commit.click();
    });
    plusBtn.addEventListener('click', function(e) {
        let num = parseInt(text.getAttribute('value'));
        text.setAttribute('value',String(num+1));
        let mgcstplus=megacost.innerText.replaceAll(/\s/g, '');
        sumcost.textContent=String(parseInt(sumcost.innerText.replaceAll(/\s/g, ''))+parseInt(cost.innerText.replaceAll(/\s/g, '')));
        megacost.textContent=String(parseInt(mgcstplus)+parseInt(cost.innerText.replaceAll(/\s/g, '')));
        commit.click();
    });
    del.addEventListener('click', function(e) {
        let num = parseInt(text.getAttribute('value'));
        text.setAttribute('value',String(num+1));
        let mgcstdel=megacost.innerText.replaceAll(/\s/g, '');
        megacost.textContent=String(parseInt(mgcstdel)-parseInt(sumcost.innerText.replaceAll(/\s/g, '')));
        sumcost.textContent='0';
        text.setAttribute('value','0');

        div.setAttribute('style', 'position: absolute; left: -9999px;');
        commit.click();
    });
    docIteratorCart++;
}
