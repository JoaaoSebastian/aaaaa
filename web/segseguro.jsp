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
             double vista = 1;
             double tresx = 3;
             double seisx = 6;
             double dezx = 10;
             double dozex = 12;
             double tresxb = 3;
             double seisxb = 6;
             double dezxb = 10;
             double dozexb = 12;
             double vistab = 1;
             double idd = 0;
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
            try{
                if(request.getParameter("enviar")!= null){
                double casco = Double.parseDouble(request.getParameter("casco"));
                int idade = Integer.parseInt(request.getParameter("idade"));
                int estcivil = Integer.parseInt(request.getParameter("estcivil"));
                int filhosm = Integer.parseInt(request.getParameter("filhosm"));
                int usovei = Integer.parseInt(request.getParameter("usovei"));
                int estudante = Integer.parseInt(request.getParameter("estudante"));
                int garper = Integer.parseInt(request.getParameter("garper"));
                int gartrab = Integer.parseInt(request.getParameter("gartrab"));
                int garest = Integer.parseInt(request.getParameter("garest"));
                double adesao = Double.parseDouble(request.getParameter("adesao"));
                int assist = Integer.parseInt(request.getParameter("assist"));
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
                
                if(idade == 1){
                    idd = 1.027;
                }else if(idade == 2){
                    idd = 1.023;
                }else if(idade == 3){
                    idd = 1.012;
                }else if(idade == 4){
                    idd = 1.003;
                }else if(idade == 5){
                    idd = 1.003;
                }
                
                if(estcivil == 1){
                    ecivil = 1.001;
                }else if(estcivil == 2){
                    ecivil = 1.008;
                }
                
                if(filhosm == 1){
                    fmaior = 1.008;
                }else if(filhosm == 2){
                    fmaior = 1.001;
                }
                
                if(usovei == 1){
                    uveic = 1.0011;
                }else if(usovei == 2){
                    uveic = 1.0028;
                }else if(usovei == 3){
                    uveic = 0.0056;
                }else if(usovei == 4){
                    uveic = 0.0063;
                }else if(usovei == 5){
                    uveic = 0.0092;
                }
                
                if(estudante == 1){
                    estu = 1.009;
                }else if(estudante == 2){
                    estu = 1.001;
                }
                
                if(garper == 1){
                    gper = 1.001;
                }else if(garper == 2){
                    gper = 1.012;
                }else if(garper == 3){
                    gper = 1.017;
                }else if(garper == 4){
                    gper = 1.009;
                }else if(garper == 5){
                    gper = 1.0390;
                }
                
                if(gartrab == 1){
                    gtrab = 1.001;
                }else if(gartrab == 2){
                    gtrab = 1.014;
                }else if(gartrab == 3){
                    gtrab = 1.009;
                }
                
                if(garest == 1){
                    gest = 1.003;
                }else if(garest == 2){
                    gest = 1.009;
                }else if(garest == 3){
                    gest = 1.009;
                }
                
                if(assist == 1){
                    ass = 1.0109;
                }else if(assist == 2){
                    ass = 1.0152;
                }else if(assist == 3){
                    ass = 1.001;
                }
                
                if(categoria == 1){
                    cat = 0.06;
                }else if(categoria == 2){
                    cat = 0.075;
                }else if(categoria == 3){
                    cat = 0.09;
                }else if(categoria == 4){
                    cat = 0.105;
                }
                ads = adesao;
                mensequip = mensequip * 12;
                casc = casco;
                val = ((casc*cat)*idd*ecivil*fmaior*uveic*estu*gper*gtrab*gest*ass) + mensequip + ads ;
                txi = txinst;
             vista = val;
             tresx = vista / tresx;
             seisx = (vista / seisx)* 1.0128;
             dezx = (vista / dezx) * 1.0249;
             dozex = (vista / dozex) * 1.0309;
             vistab = val + 238;
             tresxb = vistab / tresxb;
             seisxb = (vistab / seisxb) * 1.0128;
             dezxb = (vistab / dezxb) * 1.0249;
             dozexb = (vistab / dozexb) * 1.0309;
             
             
                }
                }
            catch(Exception ex){
                out.println("<span style='color:red;'>Você não preencheu as opções necessárias. Tente novamente: </span><br>");
               
            }
        %>
        
        <div >
    <center> <form><table>
            <tr>
                <th colspan='7'><center>PROPONENTE</center></th>
            </tr>
            <tr>
                <td colspan = '7'></br></td> 
            </tr>
            <tr>       
            <td colspan='2'><b>CORRETOR*</b><td colspan='2'><b>N°COTAÇÃO*</b></td><td><b>DATA*</b></td><td><b>VALIDADE*</b></td><td><b>COD/FIPE*</b></td>
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
                <td><b>IDADE*</b></td><td><b>EST/CIVIL*</b></td><td><b>PROFISSÃO*</b></td><td><b>CONDUTOR I*</b></td><td><b>CONDUTOR II</b></td><td colspan='2'><b>TIPO MORADIA*</b></td>
            </tr>
            <tr>
                <td><input type ="radio" name="idade" value="1" size='20'>DE 18 Á 25 ANOS</td>
                <td><input type ="radio" name="estcivil" value="1" size='20'>CASADO</td>
                <td><input type ="text" name="profissao" value="" size='20'></td>
                <td><input type ="text" name="condt1" value="" size='20'></td>
                <td><input type ="text" name="condt2" value="" size='20'></td>
                <td colspan='2'><input type ="text" name="tipomor" value="" size='40'></td>
            </tr>
            <tr>
                <td><input type ="radio" name="idade" value="2" size='20'>DE 16 Á 30 ANOS</td>
                <td><input type ="radio" name="estcivil" value="0" size='20'>SOLTEIRO</td>
            </tr>
            <tr>
                <td><input type ="radio" name="idade" value="3" size='20'>DE 31 Á 40 ANOS</td>
            </tr>
            <tr>
                <td><input type ="radio" name="idade" value="4" size='20'>DE 41 Á 50 ANOS</td>
            </tr>
            <tr>
                <td><input type ="radio" name="idade" value="5" size='20'>ACIMA DE 51 ANOS</td>
            </tr>
            <tr>
                <td colspan = '7'></br></td> 
            </tr>
            <tr>
                <td colspan='2'><b>FILHOS DE 18 Á 25 ANOS*</b></td><td><b>USO VEÍCULO*</b></td><td><b>ESTUDANTE*</b></td><td><b>GAR/PERNOITE*</b></td><td><b>GAR/TRABALHO*</b></td><td><b>GAR/ESTUDO*</b></td>
            </tr>
            <tr>
                <td colspan='2'><input type ="radio" name="filhosm" value="1" size='20'>SIM</td>
                <td><input type ="radio" name="usovei" value="1" size='20'>LASER</td>
                <td><input type ="radio" name="estudante" value="1" size='20'>SIM</td>
                <td><input type ="radio" name="garper" value="1" size='20'>PRÉDIO/FECHADA</td>
                <td><input type ="radio" name="gartrab" value="1" size='20'>ESTACIONAMENTO</td>
                <td><input type ="radio" name="garest" value="1" size='40'>ESTACIONAMENTO</td>
            </tr>
            <tr>
                <td colspan='2'><input type ="radio" name="filhosm" value="0" size='20'>NÃO</td>
                <td><input type ="radio" name="usovei" value="2" size='20'>DIÁRIO</td>
                <td><input type ="radio" name="estudante" value="0" size='20'>NÃO</td>
                <td><input type ="radio" name="garper" value="2" size='20'>PRÉDIO/ABERTA</td>
                <td><input type ="radio" name="gartrab" value="2" size='20'>S/GARAGEM</td>
                <td><input type ="radio" name="garest" value="2" size='40'>S/GARAGEM</td>
            </tr>
            <tr>
                <td colspan='2'></td>
                <td><input type ="radio" name="usovei" value="3" size='20'>TRANSPORTE</td>
                <td></td>
                <td><input type ="radio" name="garper" value="3" size='20'>CASA</td>
                <td><input type ="radio" name="gartrab" value="3" size='20'>N/D</td>
                <td><input type ="radio" name="garest" value="3" size='40'>N/D</td>
            </tr>
            <tr>
                <td colspan='2'></td>
                <td><input type ="radio" name="usovei" value="4" size='20'>CARGA</td>
                <td></td>
                <td><input type ="radio" name="garper" value="4" size='20'>ESTACIONAMENTO</td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td colspan='2'></td>
                <td><input type ="radio" name="usovei" value="5" size='20'>TAXI/UBER</td>
                <td></td>
                <td><input type ="radio" name="garper" value="5" size='20'>S/GARAGEM</td>
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
                <td><input type='color' name='cor' value='' size=''></td>
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
                <td colspan='2'><b>CASCO*</b></td><td><b>ADESÃO*</b></td><td><b>CATEGORIA*</b></td><td><b>ASSISTÊNCIAS*/<b></td><td colspan='2'><b>OPCIONAIS</b></td>
            </tr>
            <tr>
                <td colspan='2'><input type='number' name='casco' value='' size='40'></td>
                <td><input type='radio' name='adesao' value='1'>R$150,00</td>
                <td><input type='radio' name='categoria' value='1'>NÍVEL 1</td>
                <td><input type='radio' name='assist' value='1'>3 ASSISTÊNCIAS</td>
                <td colspan='2'><input type='text' name='opcionais' value='' size='40'></td>
            </tr>
            <tr>
                <td colspan='2'></td>
                <td><input type='radio' name='adesao' value='2'>R$250,00</td>
                <td><input type='radio' name='categoria' value='2'>NÍVEL 2</td>
                <td><input type='radio' name='assist' value='2'>5 ASSISTÊNCIAS</td>
                <td colspan='2'></td>
            </tr>
            <tr>
                <td colspan='2'></td>
                <td><input type='radio' name='adesao' value='3'>R$299,00</td>
                <td><input type='radio' name='categoria' value='3'>NÍVEL 3</td>
                <td><input type='radio' name='assist' value='3'>N/D</td>
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
                <td colspan='2'><b>MENSALIDADE EQUIP*</b></td><td><b>TAXA INSTALAÇÃO*</b></td><td><b>COBERTURA MÁX*</b></td><td><b>VALIDADE*</b></td><td colspan='2'><b>FRANQUIA*</b></td>
            </tr>
            <tr>
                <td colspan='2'><input type='number' name='mensequip' value='' size='40'></td>
                <td><input type='number' name='txinst' value='' size='20'></td>
                <td><input type='string' name='cobermax' value='' size='20'></td>
                <td><input type='string' name='valid' value='' size='20'></td>
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
    <center><table class="table table-bordered table-hover">
            <tr>
                <th colspan='7' style='font-size:18px'><center>PROPONENTE</center></th>
            </tr>
            <tr align="center">       
                <td colspan='2'><b>CORRETOR</b></td><td colspan='2'><b>N°COTAÇÃO</b></td><td><b>DATA</b></td><td><b>VALIDADE</b></td><td><b>COD/FIPE</b></td>
            </tr>
            <tr>
                <td colspan='2'><%=request.getParameter("corretor")%></td> 
                <td colspan='2'><%=request.getParameter("ncotacao")%></td>         
                <td><%=request.getParameter("data")%></td>
                <td><%=request.getParameter("validade")%></td>
                <td><%=request.getParameter("codfipe")%></td>
            </tr>
            <tr align="center">
                <td colspan='2'><b>CONTRATANTE</b></td><td colspan='2'><b>ENDEREÇO</b></td><td><b>CIDADE</b></td><td><b>CEP</b></td><td><b>ESTADO</b></td>
            </tr>
            <tr>
                <td colspan='2'><%=request.getParameter("contratante")%></td> 
                <td colspan='2'><%=request.getParameter("endereco")%></td>         
                <td><%=request.getParameter("cidade")%></td>
                <td><%=request.getParameter("cep")%></td>
                <td><%=request.getParameter("estado")%></td>
            </tr>
            <tr align="center" >
                <td colspan='2'><b>CPF/CNPJ</b></td><td colspan='2'><b>E-MAIL</b></td><td><b>CEL</b></td><td><b>TEL(1)</b></td><td><b>TEL(2)</b></td>
            </tr>
            <tr>
                <td colspan='2'><%=request.getParameter("cpf")%></td> 
                <td colspan='2'><%=request.getParameter("email")%></td>
                <td><%=request.getParameter("cel")%></td>
                <td><%=request.getParameter("tel1")%></td>
                <td><%=request.getParameter("tel2")%></td>
            </tr>
            <tr>
                <th colspan='7' style='font-size:18px'><center>PERFIL</center></th>
            </tr>
             <tr align="center">
                 <td><b>IDADE</b></td><td><b>EST/CIVIL</b></td><td><b>PROFISSÃO</b></td><td></td><td><b>CONDUTOR I</b></td><td><b>CONDUTOR II</b></td><td><b>MORADIA</b></td>
            </tr>
            <tr>
                <td><%=request.getParameter("idade")%></td> 
                <td><%=request.getParameter("estcivil")%></td>
                <td><%=request.getParameter("profissao")%></td>
                <td></td>
                <td><%=request.getParameter("condt1")%></td>
                <td><%=request.getParameter("condt2")%></td>
                <td><%=request.getParameter("tipomor")%></td>
            </tr>
            <tr align="center">
                <td><b>FILHOS DE 18 Á 25 ANOS</b></td><td><b>USO VEÍCULO</b></td><td><b>ESTUDANTE</b></td><td></td><td><b>GARAGEM PERNOITE</b></td><td><b>GARAGEM TRABALHO</b></td><td><b>GARAGEM ESTUDO</b></td>
            </tr>
            <tr>
                <td><%=request.getParameter("filhosm")%></td> 
                <td><%=request.getParameter("usovei")%></td>
                <td><%=request.getParameter("estudante")%></td>
                <td></td>
                <td><%=request.getParameter("garper")%></td>
                <td><%=request.getParameter("gartrab")%></td>
                <td><%=request.getParameter("garest")%></td>
            </tr>
             <tr>
                <th colspan='7' style='font-size:18px'><center>VEÍCULO</center></th>
            </tr>
            <tr align="center">
                <td colspan="2"><b>FAB/MODELO</b></td><td><b>COR</b></td><td><b>ANO</b></td><td><b>PLACA</b></td><td><b>RENAVAM</b></td><td><b>CHASSI</b></td>
            </tr>
            <tr>
                <td colspan="2"><%=request.getParameter("fabmodelo")%></td> 
                <td style = 'background-color:<%=request.getParameter("cor")%>'> </td>
                <td><%=request.getParameter("ano")%></td>
                <td><%=request.getParameter("placa")%></td>
                <td><%=request.getParameter("renavam")%></td>
                <td><%=request.getParameter("chassi")%></td>
            </tr>
            <tr>
                <th colspan='7' style='font-size:18px'><center>CONTRATAÇÃO</center></th>
            </tr>
             <tr align="center">
                 <td><b>ADESÃO</b></td><td><b>EST/CIVIL</b></td><td><b>PROFISSÃO</b></td><td></td><td><b>CONDUTOR I</b></td><td><b>CONDUTOR II</b></td><td><b>MORADIA</b></td>
            </tr>
            <tr>
                <td><%=request.getParameter("idade")%></td> 
                <td><%=request.getParameter("estcivil")%></td>
                <td><%=request.getParameter("profissao")%></td>
                <td></td>
                <td><%=request.getParameter("condt1")%></td>
                <td><%=request.getParameter("condt2")%></td>
                <td><%=request.getParameter("tipomor")%></td>
            </tr>
            <tr>
            <th style='font-size:18px'><center><b>PAGAMENTO</b></center></th>
            <th style='font-size:18px'><center><b>VALOR CASCO</b></center></th>
            <th style='font-size:18px'><center><b>Á VISTA</b></center></th>
            <th style='font-size:18px'><center><b>3x S/ JUROS</b></center></th>
            <th style='font-size:18px'><center><b>6x </b></center></th>
            <th style='font-size:18px'><center><b>10x </b></center></th>
            <th style='font-size:18px'><center><b>12x </b></center></th>
        </tr>
        <tr>
            <td ><center>CARTÃO</center></td>
            <td ><center>R$ <%=new DecimalFormat("0,000.00").format(casc)%></center></td>
            <td ><center>R$ <%=new DecimalFormat("0,000.00").format(vista)%> + R$ <%=new DecimalFormat("0.00").format(txi)%></center></td>
            <td ><center>R$ <%=new DecimalFormat("0.00").format(tresx)%> + R$ <%=new DecimalFormat("0.00").format(txi)%></center></td>
            <td ><center>R$ <%=new DecimalFormat("0.00").format(seisx)%> + R$ <%=new DecimalFormat("0.00").format(txi)%></center></td>
            <td ><center>R$ <%=new DecimalFormat("0.00").format(dezx)%> + R$ <%=new DecimalFormat("0.00").format(txi)%></center></td>
            <td ><center>R$ <%=new DecimalFormat("0.00").format(dozex)%> + R$ <%=new DecimalFormat("0.00").format(txi)%></center></td>
        </tr>
        
        <tr>
            <td ><center>BOLETO</center></td>
            <td ><center>R$ <%=new DecimalFormat("0,000.00").format(casc)%></center></td>
            <td ><center>R$ <%=new DecimalFormat("0,000.00").format(vistab)%> + R$ <%=new DecimalFormat("0.00").format(txi)%></center></td>
            <td ><center>R$ <%=new DecimalFormat("0.00").format(tresxb)%> + R$ <%=new DecimalFormat("0.00").format(txi)%></center></td>
            <td ><center>R$ <%=new DecimalFormat("0.00").format(seisxb)%> + R$ <%=new DecimalFormat("0.00").format(txi)%></center></td>
            <td ><center>R$ <%=new DecimalFormat("0.00").format(dezxb)%> + R$ <%=new DecimalFormat("0.00").format(txi)%></center></td>
            <td ><center>R$ <%=new DecimalFormat("0.00").format(dozexb)%> + R$ <%=new DecimalFormat("0.00").format(txi)%></center></td>
        </tr>
        <tr>
        </table></center>    
        <%}%>
    </body>
</html>
