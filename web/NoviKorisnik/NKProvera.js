
function provera(u, p, f){
    var unos = document.getElementById(u)
    var poruka = document.getElementById(p)
    var dobro = "unos je ispravan"
    var nije = "Obavezno polje"
    if(typeof f==='function' && f==='uslovJMBG')
        nije = "Potrebno je uneti 13 cifara"
                
    if(unos.value && typeof f==='function' && f(unos.value)){
        ajaxFunction()
    }else if(unos.value && typeof f==='undefined'){
        if (poruka.innerText) {
            poruka.innerText = dobro
        } else
        if (poruka.textContent) {
            poruka.textContent = dobro
        }
        poruka.style.color = "green"
    } else {
        if (poruka.innerText) {
            poruka.innerText = nije
        } else
        if (poruka.textContent) {
            poruka.textContent = nije
        }
        poruka.style.color = "red"
    }
}            
function uslovJMBG(u){
    var un = u
    if(un.length == 13 && !isNaN(parseFloat(un)))
        return true
}
//            function proveraJMBG() {
//                var unos = document.getElementById("jmbg")
//                var porukaJ = document.getElementById("d")
//                var dobro = "unos je ispravan"
//                var nije = "Potrebno je uneti 13 cifara"
//
//                if (unos.value) {
//                    if (unos.value.length == 13 && !isNaN(parseFloat(unos.value))) {
//                        if (porukaJ.innerText) {
//                            porukaJ.innerText = dobro
//                        } else
//                        if (porukaJ.textContent) {
//                            porukaJ.textContent = dobro
//                        }
//                        porukaJ.style.color = "green"
//                    } else {
//                        if (porukaJ.innerText) {
//                            porukaJ.innerText = nije
//                        } else
//                        if (porukaJ.textContent) {
//                            porukaJ.textContent = nije
//                        }
//                        porukaJ.style.color = "red"
//                    }
//                }
//            }
            
