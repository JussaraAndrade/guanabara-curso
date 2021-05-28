function verificar(){
    let data = new Date()
    let ano = data.getFullYear()
    let fano= document.getElementById('txtano')
    let res = document.querySelector('div#res')

    if(fano.value.length == 0 || fano.value > ano){
        window.alert(`[ERRO] Verifique os dados e tenta nova`)
    }else{
        window.alert('tudo ok')
    }
}
 