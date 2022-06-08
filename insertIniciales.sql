insert into usuario(`tAliasUsuario`,
  `tPassword`,
  `tNombreUsuario`,
  `bActivo`) values("Josele2015","Josele2015","Herman José García Pacheco",true);

insert into Usuario (
  `tAliasUsuario` ,
  `tPassword` ,
  `tNombreUsuario` ,
  `bActivo`) values("Josele2015","Josele2015","Herman Jose Garcia Pacheco",true);

insert into Cuenta (`iValorInicial`,
`DSaldo`,
`DNumeroCuenta`,
`bActivo`,
`Usuario_iIDUsuario`) 
  values(2000000,'2000000.00','1020782211',true,1);

insert into Cuenta values(1,2000000,'2000000.00',"1020782031",true,1);
insert into Cuenta values(1,2000000,'2000000.00','8166332136',true,1);
    
insert into Movimiento(`dValorMovimiento`,
  `tTipoMovimiento`,
  `bActivo`,
  `Cuenta_iIDCuenta`) values('2000000.00',"Consignación",true,1);
    