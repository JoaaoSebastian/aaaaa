<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<!DOCTYPE html>
<html>
    <head>
        <style>
            th{ background-color: #ff8306; border-style: groove; font-size: 30px;}
            
        </style>
  <title>SegSeguro</title>
  <meta charset="utf-8">
   <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
</head>
    <body>
        <% 
             double casc = 0;
             double vista = 0;
             double tresx = 3;
             double seisx = 6;
             double dezx = 10;
             double dozex = 12;
             double tresxb = 3;
             double seisxb = 6;
             double dezxb = 10;
             double dozexb = 12;
             double vistab = 0;
             double idde = 0;
             double ecivil = 0;
             double fmaior = 0;
             double uveic = 0;
             double estu= 0;
             double gper = 0;
             double gtrab = 0;
             double gest = 0;
             double ass = 0;
             double cat = 0;
             double ads = 0;
             double val = 0;
             double txi = 0;
             double mense = 0;
             double subt = 0;
             
             
            try{
                if(request.getParameter("enviar")!= null){
                double casco = Double.parseDouble(request.getParameter("casco"));
                int idd = Integer.parseInt(request.getParameter("idade"));
                String estcivil = (request.getParameter("estcivil"));
                String filhosm = (request.getParameter("filhosm"));
                String usovei = (request.getParameter("usovei"));
                String estudante = (request.getParameter("estudante"));
                String garper = (request.getParameter("garper"));
                String gartrab = (request.getParameter("gartrab"));
                String garest = (request.getParameter("garest"));
                int adesao = Integer.parseInt(request.getParameter("adesao"));
                String assist = (request.getParameter("assist"));
                double mensequip = Double.parseDouble(request.getParameter("mensequip"));
                double txinst = Double.parseDouble(request.getParameter("txinst"));
                int categoria = Integer.parseInt(request.getParameter("categoria"));
                
                String data = request.getParameter("data");
                String[] s = data.split("-");
                String novaData = s[2] + "/" + s[1] + "/" + s[0];
                System.out.println(data);
                
                //Date data = rs.getDate("Data");
                //SimpleDateFormat formato = new SimpleDateFormat("dd/MM/yyyy");
                //String dataformatada = formato.format(data);
                
                if(idd >= 18 && idd <= 25){
                    idde = 1.027;
                }else if(idd >= 26 && idd <= 30){
                    idde = 1.023;
                }else if(idd >= 31 && idd <= 40){
                    idde = 1.012;
                }else if(idd >= 41 && idd <= 50){
                    idde = 1.003;
                }else if(idd > 51){
                    idde = 1.003;
                }
                
                if(estcivil.equals("CASADO")){
                    ecivil = 1.001;
                }else if(estcivil.equals("SOLTEIRO")){
                    ecivil = 1.008;
                }
                
                if(filhosm.equals("SIM")){
                    fmaior = 1.008;
                }else if(filhosm.equals("NAO")){
                    fmaior = 1.001;
                }
                
                if(usovei.equals("LASER")){
                    uveic = 1.0011;  
                }else if(usovei.equals("DIARIO")){
                    uveic = 1.0028;
                }else if(usovei.equals("TRANSPORTE")){
                    uveic = 1.0056;
                }else if(usovei.equals("CARGA")){
                    uveic = 1.0063;
                }else if(usovei.equals("TAXI/UBER")){
                    uveic = 1.0092;
                }
                
                if(estudante.equals("SIM")){
                    estu = 1.009;
                }else if(estudante.equals("NAO")){
                    estu = 1.001;
                }
                
                if(garper.equals("PREDIO FECHADA")){
                    gper = 1.001;
                }else if(garper.equals("PREDIO ABERTA")){
                    gper = 1.012;
                }else if(garper.equals("CASA")){
                    gper = 1.017;
                }else if(garper.equals("ESTACIONAMENTO")){
                    gper = 1.009;
                }else if(garper.equals("S/GARAGEM")){
                    gper = 1.0390;
                }
                
                if(gartrab.equals("ESTACIONAMENTO")){
                    gtrab = 1.001;
                }else if(gartrab.equals("S/GARAGEM")){
                    gtrab = 1.014;
                }else if(gartrab.equals("N/D")){
                    gtrab = 1.009;
                }
                
                if(garest.equals("ESTACIONAMENTO")){
                    gest = 1.003;
                }else if(garest.equals("S/GARAGEM")){
                    gest = 1.009;
                }else if(garest.equals("N/D")){
                    gest = 1.009;
                }
                
                if(assist.equals("3 ASSISTENCIAS")){
                    ass = 1.0109;
                }else if(assist.equals("5 ASSISTENCIAS")){
                    ass = 1.0152;
                }else if(assist.equals("N/D")){
                    ass = 1.001;
                }
                
                if(categoria == 1){
                    cat = 0.019;
                }else if(categoria == 2){
                    cat = 0.025;
                }else if(categoria == 3){
                    cat = 0.038;
                }else if(categoria == 4){
                    cat = 0.0505;
                }
                
                if(adesao == 1){
                    ads = 150;
                }else if(adesao == 2){
                    ads = 250;
                }else if(adesao == 3){
                    ads = 299;
                }else if(adesao == 4){
                    ads = 0;
                }
                mense = mensequip;
                mensequip = mensequip * 12;
                casc = casco;
                subt = casc * cat;
                vista = (subt*idde*ecivil*fmaior*uveic*estu*gper*gtrab*gest*ass) + mensequip + ads ;
                txi = txinst;
             tresx = vista / tresx;
             seisx = (vista / seisx)* 1.0128;
             dezx = (vista / dezx) * 1.0249;
             dozex = (vista / dozex) * 1.0659;
             vistab = vista + 238;
             tresxb = vistab / tresxb;
             seisxb = (vistab / seisxb) * 1.0128;
             dezxb = (vistab / dezxb) * 1.0249;
             dozexb = (vistab / dozexb) * 1.0659;
             
             
                }
                }
            catch(Exception ex){
                out.println("<b><center><span style='color:red;font-size:30px;'>Você não preencheu as opções necessárias. Tente novamente. </span></b></center><br>");
               
            }
        %>
        
        <div >
    <center><img src="imgs/Segpainel.jpg" align="center"/>
        <form method="POST"><table>
            <tr>
                <th colspan='7'><center>PROPONENTE</center></th>
            </tr>
            <tr>
                <td colspan = '7'></br></td> 
            </tr>
            <tr>       
                <td colspan='2'><b>CORRETOR*</b></td><td colspan='2'><b>N°COTAÇÃO*</b></td><td><b>DATA*</b></td><td><b>VALIDADE*</b></td><td><b>COD/FIPE*</b></td>
            </tr>
            <tr>
                <td colspan='2'><input type ="text" name="corretor" value="" size='40'></td> 
                <td colspan='2'><input type ="text" name="ncotacao" value="" size='40'></td>         
                <td><input type ="date" name="data" value="" size='20'>                </td>
                <td><input type ="date" name="validade" value="" size='20'>            </td>
                <td><input type ="text" name="codfipe" value="" size='20'>             </td>
            </tr>
            <tr>
                <td colspan='2'><b>CONTRATANTE*</b></td><td colspan='2'><b>ENDEREÇO*</b></td><td><b>CIDADE*</b></td><td><b>CEP*</b></td><td><b>ESTADO*</b></td>
            </tr>
            <tr>
                <td colspan='2'><input type ="text" name="contratante" value="" size='40'></td>
                <td colspan='2'><input type ="text" name="endereco" value="" size='40'>   </td>
                <td><input type ="text" name="cidade" value="" size='20'>                 </td>
                <td><input type ="text" name="cep" value="" size='20'>                    </td>
                <td><input type ="text" name="estado" value="" size='20'>                 </td>
            </tr>
            <tr>
                <td colspan='2'><b>CPF/CNPJ*</b></td><td colspan='2'><b>E-MAIL*</b></td><td><b>CEL*</b></td><td><b>TEL(1)</b></td><td><b>TEL(2)</b></td>
            </tr>
            <tr>
                <td colspan='2'><input type ="text" name="cpf" value="" size='40'>  </td>
                <td colspan='2'><input type ="email" name="email" value="" size='40'></td>
                <td><input type ="text" name="cel" value="" size='20'>              </td>
                <td><input type ="text" name="tel1" value="" size='20'>             </td>
                <td><input type ="text" name="tel2" value="" size='20'>             </td>
            </tr>
            <tr>
                <td colspan = '7'></br></td> 
            </tr>
            <tr >
            <th colspan='7'><center>PERFIL</center></th>
            </tr>
            <tr>
                <td colspan = '7'></br></td> 
            </tr>
            <tr>
                <td><b>IDADE*</b></td><td><b>PROFISSÃO*</b></td><td><b>CONDUTOR I*</b></td><td><b>CONDUTOR II</b></td><td colspan='2'><b>TIPO MORADIA*</b></td><td><b>EST/CIVIL*</b></td>
            </tr>
            <tr>
                <td><input type ="text" name="idade" value="" size='20'></td>
                <td><input type ="text" name="profissao" value="" size='20'></td>
                <td><input type ="text" name="condt1" value="" size='20'></td>
                <td><input type ="text" name="condt2" value="" size='20'></td>
                <td colspan='2'><input type ="text" name="tipomor" value="" size='40'></td>
                <td><input type ="radio" name="estcivil" value="SOLTEIRO" size='20'>SOLTEIRO</td>
            </tr>
            <tr>
                <td colspan="6"></td>
                <td><input type ="radio" name="estcivil" value="CASADO" size='20'>CASADO</td>
            </tr>
                <td colspan = '7'></br></td> 
            </tr>
            <tr>
                <td colspan='2'><b>FILHOS DE 18 Á 25 ANOS*</b></td><td><b>USO VEÍCULO*</b></td><td><b>ESTUDANTE*</b></td><td><b>GAR/PERNOITE*</b></td><td><b>GAR/TRABALHO*</b></td><td><b>GAR/ESTUDO*</b></td>
            </tr>
            <tr>
                <td colspan='2'><input type ="radio" name="filhosm" value="SIM" size='20'>SIM</td>
                <td><input type ="radio" name="usovei" value="LASER" size='20'>LASER</td>
                <td><input type ="radio" name="estudante" value="SIM" size='20'>SIM</td>
                <td><input type ="radio" name="garper" value="PREDIO FECHADA" size='20'>PRÉDIO/FECHADA</td>
                <td><input type ="radio" name="gartrab" value="ESTACIONAMENTO" size='20'>ESTACIONAMENTO</td>
                <td><input type ="radio" name="garest" value="ESTACIONAMENTO" size='40'>ESTACIONAMENTO</td>
            </tr>
            <tr>
                <td colspan='2'><input type ="radio" name="filhosm" value="NAO" size='20'>NÃO</td>
                <td><input type ="radio" name="usovei" value="DIARIO" size='20'>DIÁRIO</td>
                <td><input type ="radio" name="estudante" value="NAO" size='20'>NÃO</td>
                <td><input type ="radio" name="garper" value="PREDIO ABERTA" size='20'>PRÉDIO/ABERTA</td>
                <td><input type ="radio" name="gartrab" value="S/GARAGEM" size='20'>S/GARAGEM</td>
                <td><input type ="radio" name="garest" value="S/GARAGEM" size='40'>S/GARAGEM</td>
            </tr>
            <tr>
                <td colspan='2'></td>
                <td><input type ="radio" name="usovei" value="TRANSPORTE" size='20'>TRANSPORTE</td>
                <td></td>
                <td><input type ="radio" name="garper" value="CASA" size='20'>CASA</td>
                <td><input type ="radio" name="gartrab" value="N/D" size='20'>N/D</td>
                <td><input type ="radio" name="garest" value="N/D" size='40'>N/D</td>
            </tr>
            <tr>
                <td colspan='2'></td>
                <td><input type ="radio" name="usovei" value="CARGA" size='20'>CARGA</td>
                <td></td>
                <td><input type ="radio" name="garper" value="ESTACIONAMENTO" size='20'>ESTACIONAMENTO</td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td colspan='2'></td>
                <td><input type ="radio" name="usovei" value="TAXI/UBER" size='20'>TAXI/UBER</td>
                <td></td>
                <td><input type ="radio" name="garper" value="S/GARAGEM" size='20'>S/GARAGEM</td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td colspan = '7'></br></td> 
            </tr>
            <tr>
            <th colspan='7'><center>VEÍCULO</center></th>
            </tr>
            <tr>
                <td colspan = '7'></br></td> 
            </tr>
            <tr>
                <td colspan='2'><b>FAB/MODELO*</b></td><td><b>COR</b></td><td><b>ANO*</b></td><td><b>PLACA*</b></td><td><b>RENAVAM</b></td><td><b>CHASSI</b></td>
            </tr>
            <tr>
                <td colspan='2'><input type='text' name='fabmodel' value='' size='40'></td>
                <td><input type='text' name='cor' value='' size='20'></td>
                <td><input type='text' name='ano' value='' size='20'></td>
                <td><input type='text' name='placa' value='' size='20'></td>
                <td><input type='text' name='renavam' value='' size='20'></td>
                <td><input type='text' name='chassi' value='' size='20'></td>
            </tr>
            <tr>
                <td colspan = '7'></br></td> 
            </tr>
            <tr class="dif">
            <th colspan='7'><center>CONTRATAÇÃO</center></th>
            </tr>
            <tr>
                <td colspan = '7'></br></td> 
            </tr>
            <tr>
                <td colspan='2'><b>CASCO*</b></td><td><b>ADESÃO*</b></td><td><b>CATEGORIA*</b></td><td><b>ASSISTÊNCIAS*<b></td><td colspan='2'><b>OPCIONAIS</b></td>
            </tr>
            <tr>
                <td colspan='2'><input type='number' name='casco' value='' size='40'></td>
                <td><input type='radio' name='adesao' value='1'>R$150,00</td>
                <td><input type='radio' name='categoria' value='1'>NÍVEL 1</td>
                <td><input type='radio' name='assist' value='3 ASSISTENCIAS'>3 ASSISTÊNCIAS</td>
                <td colspan='2'><input type='text' name='opcionais' value='' size='40'></td>
            </tr>
            <tr>
                <td colspan='2'></td>
                <td><input type='radio' name='adesao' value='2'>R$250,00</td>
                <td><input type='radio' name='categoria' value='2'>NÍVEL 2</td>
                <td><input type='radio' name='assist' value='5 ASSISTENCIAS'>5 ASSISTÊNCIAS</td>
                <td colspan='2'></td>
            </tr>
            <tr>
                <td colspan='2'></td>
                <td><input type='radio' name='adesao' value='3'>R$299,00</td>
                <td><input type='radio' name='categoria' value='3'>NÍVEL 3</td>
                <td><input type='radio' name='assist' value='N/D'>N/D</td>
                <td colspan='2'></td>
            </tr>
            <tr>
                <td colspan='2'></td>
                <td><input type='radio' name='adesao' value='4'>N/D</td>
                <td><input type='radio' name='categoria' value='4'>NÍVEL 4</td>
                <td></td>
                <td colspan='2'></td>
            </tr>
            <tr>
                <td colspan='7'></br></td>
            </tr>
            <tr>
                <td colspan='2'><b>MENSALIDADE EQUIP*</b></td><td><b>TAXA INSTALAÇÃO*</b></td><td><b>COBERTURA MÁX*</b></td><td><b>TEMPO*</b></td><td colspan='2'><b>FRANQUIA*</b></td>
            </tr>
            <tr>
                <td colspan='2'><input type='number' step='0.01' name='mensequip' value='' size='40'></td>
                <td><input type='number' name='txinst' value='' size='20'></td>
                <td><input type='string' name='cobermax' value='' size='20'></td>
                <td><input type='string' name='temp' value='' size='20'></td>
                <td colspan='2'><input type='string' name='franquia' value='' size='40'></td>
            </tr>
            <tr>
                <td colspan='7'></br></td>
            </tr>
            <tr>
                <td colspan = '7'><center><input type='submit' name='enviar' value='ENVIAR' size='100'></center></td>
            </tr>
            
            </table></form></center>
        </div>
        <%if(request.getParameter("enviar") != null){%>
        </br></br>
    <center><img src="imgs/SegIcon.png" align="center"/>
        <table class="table table-bordered table-hover">
            <tr>
                <th colspan='7' style='font-size:18px'><center>PROPONENTE</center></th>
            </tr>
            <tr align="center">       
                <th colspan='2'style='font-size:18px;background-color:#E6E6E6'><center>CORRETOR</center></th>
                <th colspan='2'style='font-size:18px;background-color:#E6E6E6'><center>N° COTAÇÃO</center></th>
                <th style='font-size:18px;background-color:#E6E6E6'><center>DATA</center></th>
                <th style='font-size:18px;background-color:#E6E6E6'><center>VALIDADE</center></th>
                <th style='font-size:18px;background-color:#E6E6E6'><center>COD FIPE</center></th>
            </tr>
            <tr align="center">
                <td colspan='2'><%=request.getParameter("corretor")%></td> 
                <td colspan='2'><%=request.getParameter("ncotacao")%></td>         
                <td><%=request.getParameter("data")%></td>
                <td><%=request.getParameter("validade")%></td>
                <td><%=request.getParameter("codfipe")%></td>
            </tr>
            <tr align="center">
                <th colspan='2'style='font-size:18px;background-color:#E6E6E6'><center>CONTRATANTE</center></th>
                <th colspan='2'style='font-size:18px;background-color:#E6E6E6'><center>ENDEREÇO</center></th>
                <th style='font-size:18px;background-color:#E6E6E6'><center>CIDADE</center></th>
                <th style='font-size:18px;background-color:#E6E6E6'><center>CEP</center></th>
                <th style='font-size:18px;background-color:#E6E6E6'><center>ESTADO</center></th>
            </tr>
            <tr align="center">
                <td colspan='2'><%=request.getParameter("contratante")%></td> 
                <td colspan='2'><%=request.getParameter("endereco")%></td>         
                <td><%=request.getParameter("cidade")%></td>
                <td><%=request.getParameter("cep")%></td>
                <td><%=request.getParameter("estado")%></td>
            </tr>
            <tr align="center" >
                <th colspan='2'style='font-size:18px;background-color:#E6E6E6'><center>CPF/CNPJ</center></th>
                <th colspan='2'style='font-size:18px;background-color:#E6E6E6'><center>E-MAIL</center></th>
                <th style='font-size:18px;background-color:#E6E6E6'><center>CELULAR</center></th>
                <th style='font-size:18px;background-color:#E6E6E6'><center>TELEFONE I</center></th>
                <th style='font-size:18px;background-color:#E6E6E6'><center>TELEFONE II</center></th>
            </tr>
            <tr align="center">
                <td colspan='2'><%=request.getParameter("cpf")%></td> 
                <td colspan='2'><%=request.getParameter("email")%></td>
                <td><%=request.getParameter("cel")%></td>
                <td><%=request.getParameter("tel1")%></td>
                <td><%=request.getParameter("tel2")%></td>
            </tr>
        </table>
            <table class="table table-bordered table-hover">
            <tr>
                <th colspan='6' style='font-size:18px'><center>PERFIL</center></th>
            </tr>
             <tr align="center">
                 <th style='font-size:18px;background-color:#E6E6E6'><center>IDADE</center></th>
                 <th style='font-size:18px;background-color:#E6E6E6'><center>EST/CIVIL</center></th>
                 <th style='font-size:18px;background-color:#E6E6E6'><center>PROFISSÃO</center></th>
                 <th style='font-size:18px;background-color:#E6E6E6'><center>CONDUTOR I</center></th>
                 <th style='font-size:18px;background-color:#E6E6E6'><center>CONDUTOR II</center></th>
                 <th style='font-size:18px;background-color:#E6E6E6'><center>MORADIA</center></th>
            </tr>
            <tr align="center">
                <td><%=request.getParameter("idade")%> ANOS </td> 
                <td><%=request.getParameter("estcivil")%></td>
                <td><%=request.getParameter("profissao")%></td>
                <td><%=request.getParameter("condt1")%></td>
                <td><%=request.getParameter("condt2")%></td>
                <td><%=request.getParameter("tipomor")%></td>
            </tr>
            <tr align="center">
                <th style='font-size:18px;background-color:#E6E6E6'><center>FILHOS DE 18 Á 25 ANOS</center></th>
                <th style='font-size:18px;background-color:#E6E6E6'><center>USO VEÍCULO</center></th>
                <th style='font-size:18px;background-color:#E6E6E6'><center>ESTUDANTE</center></th>
                <th style='font-size:18px;background-color:#E6E6E6'><center>GARAGEM PERNOITE</center></th>
                <th style='font-size:18px;background-color:#E6E6E6'><center>GARAGEM TRABALHO</center></th>
                <th style='font-size:18px;background-color:#E6E6E6'><center>GARAGEM ESTUDO</center></th>
                </tr>
            <tr align="center">
                <td><%=request.getParameter("filhosm")%></td> 
                <td><%=request.getParameter("usovei")%></td>
                <td><%=request.getParameter("estudante")%></td>
                <td><%=request.getParameter("garper")%></td>
                <td><%=request.getParameter("gartrab")%></td>
                <td><%=request.getParameter("garest")%></td>
            </tr>
            </table>
            <table class="table table-bordered table-hover">
             <tr>
                <th colspan='7' style='font-size:18px'><center>VEÍCULO</center></th>
            </tr>
            <tr align="center">
                <th colspan='2'style='font-size:18px;background-color:#E6E6E6'><center>FAB/MODELO</center></th>
                <th style='font-size:18px;background-color:#E6E6E6'><center>COR</center></th>
                <th style='font-size:18px;background-color:#E6E6E6'><center>ANO</center></th>
                <th style='font-size:18px;background-color:#E6E6E6'><center>PLACA</center></th>
                <th style='font-size:18px;background-color:#E6E6E6'><center>RENAVAM</center></th>
                <th style='font-size:18px;background-color:#E6E6E6'><center>CHASSI</center></th>
            </tr>
            <tr align="center" >
                <td colspan="2"><%=request.getParameter("fabmodel")%></td> 
                <td><%=request.getParameter("cor")%></td>
                <td><%=request.getParameter("ano")%></td>
                <td><%=request.getParameter("placa")%></td>
                <td><%=request.getParameter("renavam")%></td>
                <td><%=request.getParameter("chassi")%></td>
            </tr>
            </table>
            <table class="table table-bordered table-hover">
            <tr>
                <th colspan='6' style='font-size:18px'><center>CONTRATAÇÃO</center></th>
            </tr>
             <tr align="center">
                 <th style='font-size:18px;background-color:#E6E6E6'><center>ADESÃO</center></th>
                 <th style='font-size:18px;background-color:#E6E6E6'><center>FRANQUIA</center></th>
                 <th style='font-size:18px;background-color:#E6E6E6'><center>ASSISTÊNCIAS</center></th>
                 <th colspan='2' style='font-size:18px;background-color:#E6E6E6'><center>OPCIONAIS</center></th>
            </tr>
            <tr align="center">
                <td>R$ <%=new DecimalFormat("0.00").format(ads)%></td> 
                <td ><%=request.getParameter("franquia")%></td>
                <td><%=request.getParameter("assist")%></td>
                <td colspan='2'><%=request.getParameter("opcionais")%></td>
            </tr>
            <tr align="center">
                <th style='font-size:18px;background-color:#E6E6E6'><center>MENSALIDADE/EQUIP</center></th>
                <th style='font-size:18px;background-color:#E6E6E6'><center>TAXA/INSTALAÇÃO</center></th>
                <th style='font-size:18px;background-color:#E6E6E6'><center>COBERTURA MÁXIMA</center></th>
                <th colspan='2' style='font-size:18px;background-color:#E6E6E6'><center>TEMPO</center></th>
            </tr>
            <tr align="center">
                <td>R$ <%=new DecimalFormat("0.00").format(mense)%></td> 
                <td>R$ <%=new DecimalFormat("0.00").format(txi)%></td>
                <td><%=request.getParameter("cobermax")%></td>
                <td colspan='2'><%=request.getParameter("temp")%></td>
            </tr>
            </table>
            <table class="table table-bordered table-hover">
            <tr>
                <th colspan='7' style='font-size:18px'><center>PAGAMENTO</center></th>
            </tr>
            <tr align="center">
                <th colspan='2'style='background-color:#E6E6E6'></th>
            <th style='font-size:18px;background-color:#E6E6E6'><center><b>Á VISTA</b></center></th>
            <th style='font-size:18px;background-color:#E6E6E6'><center><b>3x S/ JUROS</b></center></th>
            <th style='font-size:18px;background-color:#E6E6E6'><center><b>6x </b></center></th>
            <th style='font-size:18px;background-color:#E6E6E6'><center><b>10x </b></center></th>
            <th style='font-size:18px;background-color:#E6E6E6'><center><b>12x </b></center></th>
        </tr>
        <tr align="center">
            <th colspan='2'style='font-size:18px;background-color:#E6E6E6'><center>CARTÃO</center></th>
            <td ><center>R$ <%=new DecimalFormat("0,000.00").format(vista)%> + R$ TAXA/INSTALAÇÃO</center></td>
            <td ><center>R$ <%=new DecimalFormat("0.00").format(tresx)%> + TAXA/INSTALAÇÃO</center></td>
            <td ><center>R$ <%=new DecimalFormat("0.00").format(seisx)%> + TAXA/INSTALAÇÃO</center></td>
            <td ><center>R$ <%=new DecimalFormat("0.00").format(dezx)%> + TAXA/INSTALAÇÃO</center></td>
            <td ><center>R$ <%=new DecimalFormat("0.00").format(dozex)%> + TAXA/INSTALAÇÃO</center></td>
        </tr>
        
        <tr align="center">
            <th colspan='2'style='font-size:18px;background-color:#E6E6E6'><center>BOLETO</center></th>
            <td ><center>R$ <%=new DecimalFormat("0,000.00").format(vistab)%> + TAXA/INSTALAÇÃO</center></td>
            <td ><center>R$ <%=new DecimalFormat("0.00").format(tresxb)%> + TAXA/INSTALAÇÃO</center></td>
            <td ><center>R$ <%=new DecimalFormat("0.00").format(seisxb)%> + TAXA/INSTALAÇÃO</center></td>
            <td ><center>R$ <%=new DecimalFormat("0.00").format(dezxb)%> + TAXA/INSTALAÇÃO</center></td>
            <td ><center>R$ <%=new DecimalFormat("0.00").format(dozexb)%> + TAXA/INSTALAÇÃO</center></td>
        </tr>
        <tr>
        </table></center>    
        <%}%>
    </body>
</html>
