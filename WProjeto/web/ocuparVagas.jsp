<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Ocupar Vagas</title>
    <link rel="stylesheet" type="text/css" href="home.css">
</head>
<body onload="fazerdiv()">
        <header>
                <h1 id="homePage" class="float-l"><a href="HomePage.jsp">OFFICE PARK</a></h1>
                <nav class="float-r">
                    <ul class="list-auto">
                        <li>
                            <a href="loginCliente.jsp" title="Cliente">Cliente</a>
                        </li>
                        <li>
                            <a href="LoginAdm.jsp" title="Adm">Adm</a>
                        </li>
                    </ul>
        
                </nav>
        
            </header>

            <div id="entrada">
            </div>
            <div id="pRes">
            <h1>Ocupar Vaga</h1>
            <div id="vagas">
                
            </div>
        
            <div id="cima">     
                <div id="reservado">
                        
                </div>
                <br><br>
                <p style="color: rgb(0, 0, 0)"><b>Reservado</b></p>
                <p style="color: rgb(255, 0, 0)">-------------</p>
                <div id="livre">
                    
                </div>
                <br><br>
                <p style="color: rgb(0, 0, 0)"><b>Livre</b></p>
            </div>
            
            </div>

            <div class = "formReserva" align="center">
            <form class = "formulario">
                <br><br><br>
                Veículo: 
                <input type="radio" name="tipo" value="Carro" checked>Carro
                <input type="radio" name="tipo" value="Moto">Motocicleta
                <br><br>
                ID Vaga:
                <input type="text" id="idVaga" value="5" readonly>
                <br><br>
                Horario Entrada:
                <input type="datetime-local" id="dataHoraOcup" readonly> 
                <br><br>
                Placa:
                <input type="text" id="placaOcup">
                <br><br>
                <input type="button" id="btnOcupar" value="Ocupar">


            </form>
            </div>
            <script src="script.js"></script>
            <footer>
                    <p id="copy">&copy; 2019 - Office Park</p>
                </footer>
   
            <script>
                    
let div_va, j;
let cor =[]
function fazerdiv() {
        for ( j = 0; j < 60; j++) {
            div_va = document.createElement('div')
            div_va.setAttribute('class', 'vagas_d')
            div_va.setAttribute('id', `div_vaga${j}`)
            div_va.setAttribute("onclick", `ficar_vermelho('div_V${j}')`)
            document.getElementById("vagas").appendChild(div_va)
            cor[j] = 0
    }
}

function ficar_vermelho(nomediv) {
    for(let k=0;k<60;k++){
        if (nomediv == `div_V${k}`) {
            if (cor[k] == 0) {
                document.getElementById(`div_vaga${k}`).style.background = 'red'
                cor[k] =  1
            }else if(cor[k] == 1){
                document.getElementById(`div_vaga${k}`).style.background = '#fff'
                cor[k] = 0
            }
        }
    } 
}


            </script>
            
</body>
    
</html>