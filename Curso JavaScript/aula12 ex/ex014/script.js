function carregar(){
    let msg = window.document.getElementById('msg');
    let image = window.document.getElementById('imagem');

    let data =  new Date();
    let hora = data.getHours();
    //let hora = 23;
    msg.innerHTML = `Agora são ${hora} horas.`

    if(hora >= 0 && hora < 12){
        image.src = 'fotomanha.jpg';
        document.body.style.background = '#e2cd9f'
    }else if(hora >= 12 && hora <= 18){
        image.src = 'fototarde.jpg';
        document.body.style.background = '#b9846f'
    }else {
        image.src = 'fotonoite.jpg';
        document.body.style.background = '#515154'
    }
}
