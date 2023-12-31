package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from EFRM00401 physical file definition.
* 
* File level identifier is 1170202115316.
* Record format level identifier is 474951A9F16C9.
*/

public class EFRM00401Message extends MessageRecord
{
  final static String fldnames[] = {
                                     "PLPNPR",
                                     "PLPRUT",
                                     "PLPRUTD",
                                     "PLPPSR",
                                     "PLPPSRD",
                                     "PLPPTY",
                                     "PLPPTYD",
                                     "PLPEST",
                                     "PLPESTD",
                                     "PLPIPD",
                                     "PLPIPM",
                                     "PLPIPY",
                                     "DTPLPIP",
                                     "PLPBNK",
                                     "PLPBRN",
                                     "PLPBRND",
                                     "PLPEJE",
                                     "PLPEJED",
                                     "PLPCN2",
                                     "PLPCN2D",
                                     "PLPCN3",
                                     "PLPCN3D",
                                     "PLPV23",
                                     "PLPV23D",
                                     "PLPV22",
                                     "PLPV22D",
                                     "PLPCUN",
                                     "CUSIDN",
                                     "CUSNA1",
                                     "CUSNA2",
                                     "CUSNA3",
                                     "CUSNA4",
                                     "CUFCLF",
                                     "CUFCLFD",
                                     "PLPGRP",
                                     "PLPGRPD",
                                     "CUSBDD",
                                     "CUSBDM",
                                     "CUSBDY",
                                     "DTCUSBD",
                                     "CUSMAD",
                                     "CUSMAM",
                                     "CUSMAY",
                                     "DTCUSMA",
                                     "PLPBUC",
                                     "PLPBUCD",
                                     "PLPCL9",
                                     "PLPCL9D",
                                     "PLPUGE",
                                     "PLPUGED",
                                     "XPACOM",
                                     "PLPAM1",
                                     "PLPAM2",
                                     "PLPNFD",
                                     "PLPNFM",
                                     "PLPNFY",
                                     "DTPLPNF",
                                     "E01FLGMAS"
                                   };
  final static String tnames[] = {
                                   "numPropuesta",
                                   "ruta",
                                   "descRuta",
                                   "actividadActual",
                                   "descActivActual",
                                   "tipoSolicitud",
                                   "descTipoSolicitud",
                                   "estadoPropuesta",
                                   "descEstadoPpta",
                                   "fechaApertDiaProp",
                                   "fechaApertMesProp",
                                   "fechaApertAnoProp",
                                   "fechaAperturaProp",
                                   "bancoPropuesta",
                                   "sucursalApertura",
                                   "descSucursalAper",
                                   "codEjecutivo",
                                   "nombreEjecutivo",
                                   "sujetoCredito",
                                   "descSujetoCred",
                                   "destinoCredito",
                                   "descDestinoCred",
                                   "codSubProducto",
                                   "descCodSubProd",
                                   "codSituacion",
                                   "situacionNuevo",
                                   "numeroClientePpta",
                                   "idCliente",
                                   "nombreClientePpta",
                                   "dirCliente1",
                                   "dirCliente2",
                                   "dirCliente3",
                                   "clasificacion",
                                   "descClasificacion",
                                   "grupoEconomico",
                                   "nombreGrupoEcon",
                                   "diaNacOConst",
                                   "mesNacOConst",
                                   "anoNacOConst",
                                   "fechaNacOConst",
                                   "diaVencimCliente",
                                   "mesVencimCliente",
                                   "anoVencimCliente",
                                   "fechaVencimCliente",
                                   "actividadEconom",
                                   "descActivEconom",
                                   "sectorEconomico",
                                   "descSectorEconom",
                                   "ubicGeografica",
                                   "descUbicGeograf",
                                   "capacidadDePago",
                                   "montoSolicitado",
                                   "montoAprobado",
                                   "fechaAprobDia",
                                   "fechaAprobMes",
                                   "fechaAprobAno",
                                   "fechaAprobacion",
                                   "*flagMas"
                                 };
  final static String fid = "1170202115316";
  final static String rid = "474951A9F16C9";
  final static String fmtname = "EFRM00401";
  final int FIELDCOUNT = 58;
  private static Hashtable tlookup = new Hashtable();
  private DecimalField fieldPLPNPR = null;
  private CharacterField fieldPLPRUT = null;
  private CharacterField fieldPLPRUTD = null;
  private DecimalField fieldPLPPSR = null;
  private CharacterField fieldPLPPSRD = null;
  private CharacterField fieldPLPPTY = null;
  private CharacterField fieldPLPPTYD = null;
  private CharacterField fieldPLPEST = null;
  private CharacterField fieldPLPESTD = null;
  private DecimalField fieldPLPIPD = null;
  private DecimalField fieldPLPIPM = null;
  private DecimalField fieldPLPIPY = null;
  private CharacterField fieldDTPLPIP = null;
  private CharacterField fieldPLPBNK = null;
  private DecimalField fieldPLPBRN = null;
  private CharacterField fieldPLPBRND = null;
  private CharacterField fieldPLPEJE = null;
  private CharacterField fieldPLPEJED = null;
  private CharacterField fieldPLPCN2 = null;
  private CharacterField fieldPLPCN2D = null;
  private CharacterField fieldPLPCN3 = null;
  private CharacterField fieldPLPCN3D = null;
  private CharacterField fieldPLPV23 = null;
  private CharacterField fieldPLPV23D = null;
  private CharacterField fieldPLPV22 = null;
  private CharacterField fieldPLPV22D = null;
  private DecimalField fieldPLPCUN = null;
  private CharacterField fieldCUSIDN = null;
  private CharacterField fieldCUSNA1 = null;
  private CharacterField fieldCUSNA2 = null;
  private CharacterField fieldCUSNA3 = null;
  private CharacterField fieldCUSNA4 = null;
  private CharacterField fieldCUFCLF = null;
  private CharacterField fieldCUFCLFD = null;
  private DecimalField fieldPLPGRP = null;
  private CharacterField fieldPLPGRPD = null;
  private DecimalField fieldCUSBDD = null;
  private DecimalField fieldCUSBDM = null;
  private DecimalField fieldCUSBDY = null;
  private CharacterField fieldDTCUSBD = null;
  private DecimalField fieldCUSMAD = null;
  private DecimalField fieldCUSMAM = null;
  private DecimalField fieldCUSMAY = null;
  private CharacterField fieldDTCUSMA = null;
  private CharacterField fieldPLPBUC = null;
  private CharacterField fieldPLPBUCD = null;
  private CharacterField fieldPLPCL9 = null;
  private CharacterField fieldPLPCL9D = null;
  private CharacterField fieldPLPUGE = null;
  private CharacterField fieldPLPUGED = null;
  private CharacterField fieldXPACOM = null;
  private DecimalField fieldPLPAM1 = null;
  private DecimalField fieldPLPAM2 = null;
  private DecimalField fieldPLPNFD = null;
  private DecimalField fieldPLPNFM = null;
  private DecimalField fieldPLPNFY = null;
  private CharacterField fieldDTPLPNF = null;
  private CharacterField fieldE01FLGMAS = null;

  /**
  * Constructor for EFRM00401Message.
  */
  public EFRM00401Message()
  {
    createFields();
    initialize();
  }

  /**
  * Create fields for this message.
  * This method implements the abstract method in the MessageRecord superclass.
  */
  protected void createFields()
  {
    recordsize = 1663;
    fileid = fid;
    recordid = rid;
    message = new byte[getByteLength()];
    formatname = fmtname;
    fieldnames = fldnames;
    tagnames = tnames;
    fields = new MessageField[FIELDCOUNT];

    fields[0] = fieldPLPNPR =
    new DecimalField(message, HEADERSIZE + 0, 13, 0, "numPropuesta");
    fields[1] = fieldPLPRUT =
    new CharacterField(message, HEADERSIZE + 13, 4, "ruta");
    fields[2] = fieldPLPRUTD =
    new CharacterField(message, HEADERSIZE + 17, 45, "descRuta");
    fields[3] = fieldPLPPSR =
    new DecimalField(message, HEADERSIZE + 62, 8, 2, "actividadActual");
    fields[4] = fieldPLPPSRD =
    new CharacterField(message, HEADERSIZE + 70, 45, "descActivActual");
    fields[5] = fieldPLPPTY =
    new CharacterField(message, HEADERSIZE + 115, 1, "tipoSolicitud");
    fields[6] = fieldPLPPTYD =
    new CharacterField(message, HEADERSIZE + 116, 45, "descTipoSolicitud");
    fields[7] = fieldPLPEST =
    new CharacterField(message, HEADERSIZE + 161, 2, "estadoPropuesta");
    fields[8] = fieldPLPESTD =
    new CharacterField(message, HEADERSIZE + 163, 45, "descEstadoPpta");
    fields[9] = fieldPLPIPD =
    new DecimalField(message, HEADERSIZE + 208, 3, 0, "fechaApertDiaProp");
    fields[10] = fieldPLPIPM =
    new DecimalField(message, HEADERSIZE + 211, 3, 0, "fechaApertMesProp");
    fields[11] = fieldPLPIPY =
    new DecimalField(message, HEADERSIZE + 214, 5, 0, "fechaApertAnoProp");
    fields[12] = fieldDTPLPIP =
    new CharacterField(message, HEADERSIZE + 219, 25, "fechaAperturaProp");
    fields[13] = fieldPLPBNK =
    new CharacterField(message, HEADERSIZE + 244, 2, "bancoPropuesta");
    fields[14] = fieldPLPBRN =
    new DecimalField(message, HEADERSIZE + 246, 5, 0, "sucursalApertura");
    fields[15] = fieldPLPBRND =
    new CharacterField(message, HEADERSIZE + 251, 45, "descSucursalAper");
    fields[16] = fieldPLPEJE =
    new CharacterField(message, HEADERSIZE + 296, 4, "codEjecutivo");
    fields[17] = fieldPLPEJED =
    new CharacterField(message, HEADERSIZE + 300, 45, "nombreEjecutivo");
    fields[18] = fieldPLPCN2 =
    new CharacterField(message, HEADERSIZE + 345, 4, "sujetoCredito");
    fields[19] = fieldPLPCN2D =
    new CharacterField(message, HEADERSIZE + 349, 45, "descSujetoCred");
    fields[20] = fieldPLPCN3 =
    new CharacterField(message, HEADERSIZE + 394, 4, "destinoCredito");
    fields[21] = fieldPLPCN3D =
    new CharacterField(message, HEADERSIZE + 398, 45, "descDestinoCred");
    fields[22] = fieldPLPV23 =
    new CharacterField(message, HEADERSIZE + 443, 2, "codSubProducto");
    fields[23] = fieldPLPV23D =
    new CharacterField(message, HEADERSIZE + 445, 45, "descCodSubProd");
    fields[24] = fieldPLPV22 =
    new CharacterField(message, HEADERSIZE + 490, 2, "codSituacion");
    fields[25] = fieldPLPV22D =
    new CharacterField(message, HEADERSIZE + 492, 20, "situacionNuevo");
    fields[26] = fieldPLPCUN =
    new DecimalField(message, HEADERSIZE + 512, 10, 0, "numeroClientePpta");
    fields[27] = fieldCUSIDN =
    new CharacterField(message, HEADERSIZE + 522, 25, "idCliente");
    fields[28] = fieldCUSNA1 =
    new CharacterField(message, HEADERSIZE + 547, 60, "nombreClientePpta");
    fields[29] = fieldCUSNA2 =
    new CharacterField(message, HEADERSIZE + 607, 45, "dirCliente1");
    fields[30] = fieldCUSNA3 =
    new CharacterField(message, HEADERSIZE + 652, 45, "dirCliente2");
    fields[31] = fieldCUSNA4 =
    new CharacterField(message, HEADERSIZE + 697, 45, "dirCliente3");
    fields[32] = fieldCUFCLF =
    new CharacterField(message, HEADERSIZE + 742, 4, "clasificacion");
    fields[33] = fieldCUFCLFD =
    new CharacterField(message, HEADERSIZE + 746, 45, "descClasificacion");
    fields[34] = fieldPLPGRP =
    new DecimalField(message, HEADERSIZE + 791, 10, 0, "grupoEconomico");
    fields[35] = fieldPLPGRPD =
    new CharacterField(message, HEADERSIZE + 801, 60, "nombreGrupoEcon");
    fields[36] = fieldCUSBDD =
    new DecimalField(message, HEADERSIZE + 861, 3, 0, "diaNacOConst");
    fields[37] = fieldCUSBDM =
    new DecimalField(message, HEADERSIZE + 864, 3, 0, "mesNacOConst");
    fields[38] = fieldCUSBDY =
    new DecimalField(message, HEADERSIZE + 867, 5, 0, "anoNacOConst");
    fields[39] = fieldDTCUSBD =
    new CharacterField(message, HEADERSIZE + 872, 25, "fechaNacOConst");
    fields[40] = fieldCUSMAD =
    new DecimalField(message, HEADERSIZE + 897, 3, 0, "diaVencimCliente");
    fields[41] = fieldCUSMAM =
    new DecimalField(message, HEADERSIZE + 900, 3, 0, "mesVencimCliente");
    fields[42] = fieldCUSMAY =
    new DecimalField(message, HEADERSIZE + 903, 5, 0, "anoVencimCliente");
    fields[43] = fieldDTCUSMA =
    new CharacterField(message, HEADERSIZE + 908, 25, "fechaVencimCliente");
    fields[44] = fieldPLPBUC =
    new CharacterField(message, HEADERSIZE + 933, 4, "actividadEconom");
    fields[45] = fieldPLPBUCD =
    new CharacterField(message, HEADERSIZE + 937, 45, "descActivEconom");
    fields[46] = fieldPLPCL9 =
    new CharacterField(message, HEADERSIZE + 982, 4, "sectorEconomico");
    fields[47] = fieldPLPCL9D =
    new CharacterField(message, HEADERSIZE + 986, 45, "descSectorEconom");
    fields[48] = fieldPLPUGE =
    new CharacterField(message, HEADERSIZE + 1031, 4, "ubicGeografica");
    fields[49] = fieldPLPUGED =
    new CharacterField(message, HEADERSIZE + 1035, 45, "descUbicGeograf");
    fields[50] = fieldXPACOM =
    new CharacterField(message, HEADERSIZE + 1080, 512, "capacidadDePago");
    fields[51] = fieldPLPAM1 =
    new DecimalField(message, HEADERSIZE + 1592, 17, 2, "montoSolicitado");
    fields[52] = fieldPLPAM2 =
    new DecimalField(message, HEADERSIZE + 1609, 17, 2, "montoAprobado");
    fields[53] = fieldPLPNFD =
    new DecimalField(message, HEADERSIZE + 1626, 3, 0, "fechaAprobDia");
    fields[54] = fieldPLPNFM =
    new DecimalField(message, HEADERSIZE + 1629, 3, 0, "fechaAprobMes");
    fields[55] = fieldPLPNFY =
    new DecimalField(message, HEADERSIZE + 1632, 5, 0, "fechaAprobAno");
    fields[56] = fieldDTPLPNF =
    new CharacterField(message, HEADERSIZE + 1637, 25, "fechaAprobacion");
    fields[57] = fieldE01FLGMAS =
    new CharacterField(message, HEADERSIZE + 1662, 1, "*flagMas");

    synchronized (tlookup)
    {
      if (tlookup.isEmpty())
      {
        for (int i = 0; i < tnames.length; i++)
          tlookup.put(tnames[i], new Integer(i));
      }
    }

    taglookup = tlookup;
  }

  /**
  * Set field PLPNPR using a String value.
  */
  public void setPLPNPR(String newvalue)
  {
    fieldPLPNPR.setString(newvalue);
  }

  /**
  * Get value of field PLPNPR as a String.
  */
  public String getPLPNPR()
  {
    return fieldPLPNPR.getString();
  }

  /**
  * Set numeric field PLPNPR using a BigDecimal value.
  */
  public void setPLPNPR(BigDecimal newvalue)
  {
    fieldPLPNPR.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field PLPNPR as a BigDecimal.
  */
  public BigDecimal getBigDecimalPLPNPR()
  {
    return fieldPLPNPR.getBigDecimal();
  }

  /**
  * Set field PLPRUT using a String value.
  */
  public void setPLPRUT(String newvalue)
  {
    fieldPLPRUT.setString(newvalue);
  }

  /**
  * Get value of field PLPRUT as a String.
  */
  public String getPLPRUT()
  {
    return fieldPLPRUT.getString();
  }

  /**
  * Set field PLPRUTD using a String value.
  */
  public void setPLPRUTD(String newvalue)
  {
    fieldPLPRUTD.setString(newvalue);
  }

  /**
  * Get value of field PLPRUTD as a String.
  */
  public String getPLPRUTD()
  {
    return fieldPLPRUTD.getString();
  }

  /**
  * Set field PLPPSR using a String value.
  */
  public void setPLPPSR(String newvalue)
  {
    fieldPLPPSR.setString(newvalue);
  }

  /**
  * Get value of field PLPPSR as a String.
  */
  public String getPLPPSR()
  {
    return fieldPLPPSR.getString();
  }

  /**
  * Set numeric field PLPPSR using a BigDecimal value.
  */
  public void setPLPPSR(BigDecimal newvalue)
  {
    fieldPLPPSR.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field PLPPSR as a BigDecimal.
  */
  public BigDecimal getBigDecimalPLPPSR()
  {
    return fieldPLPPSR.getBigDecimal();
  }

  /**
  * Set field PLPPSRD using a String value.
  */
  public void setPLPPSRD(String newvalue)
  {
    fieldPLPPSRD.setString(newvalue);
  }

  /**
  * Get value of field PLPPSRD as a String.
  */
  public String getPLPPSRD()
  {
    return fieldPLPPSRD.getString();
  }

  /**
  * Set field PLPPTY using a String value.
  */
  public void setPLPPTY(String newvalue)
  {
    fieldPLPPTY.setString(newvalue);
  }

  /**
  * Get value of field PLPPTY as a String.
  */
  public String getPLPPTY()
  {
    return fieldPLPPTY.getString();
  }

  /**
  * Set field PLPPTYD using a String value.
  */
  public void setPLPPTYD(String newvalue)
  {
    fieldPLPPTYD.setString(newvalue);
  }

  /**
  * Get value of field PLPPTYD as a String.
  */
  public String getPLPPTYD()
  {
    return fieldPLPPTYD.getString();
  }

  /**
  * Set field PLPEST using a String value.
  */
  public void setPLPEST(String newvalue)
  {
    fieldPLPEST.setString(newvalue);
  }

  /**
  * Get value of field PLPEST as a String.
  */
  public String getPLPEST()
  {
    return fieldPLPEST.getString();
  }

  /**
  * Set field PLPESTD using a String value.
  */
  public void setPLPESTD(String newvalue)
  {
    fieldPLPESTD.setString(newvalue);
  }

  /**
  * Get value of field PLPESTD as a String.
  */
  public String getPLPESTD()
  {
    return fieldPLPESTD.getString();
  }

  /**
  * Set field PLPIPD using a String value.
  */
  public void setPLPIPD(String newvalue)
  {
    fieldPLPIPD.setString(newvalue);
  }

  /**
  * Get value of field PLPIPD as a String.
  */
  public String getPLPIPD()
  {
    return fieldPLPIPD.getString();
  }

  /**
  * Set numeric field PLPIPD using a BigDecimal value.
  */
  public void setPLPIPD(BigDecimal newvalue)
  {
    fieldPLPIPD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field PLPIPD as a BigDecimal.
  */
  public BigDecimal getBigDecimalPLPIPD()
  {
    return fieldPLPIPD.getBigDecimal();
  }

  /**
  * Set field PLPIPM using a String value.
  */
  public void setPLPIPM(String newvalue)
  {
    fieldPLPIPM.setString(newvalue);
  }

  /**
  * Get value of field PLPIPM as a String.
  */
  public String getPLPIPM()
  {
    return fieldPLPIPM.getString();
  }

  /**
  * Set numeric field PLPIPM using a BigDecimal value.
  */
  public void setPLPIPM(BigDecimal newvalue)
  {
    fieldPLPIPM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field PLPIPM as a BigDecimal.
  */
  public BigDecimal getBigDecimalPLPIPM()
  {
    return fieldPLPIPM.getBigDecimal();
  }

  /**
  * Set field PLPIPY using a String value.
  */
  public void setPLPIPY(String newvalue)
  {
    fieldPLPIPY.setString(newvalue);
  }

  /**
  * Get value of field PLPIPY as a String.
  */
  public String getPLPIPY()
  {
    return fieldPLPIPY.getString();
  }

  /**
  * Set numeric field PLPIPY using a BigDecimal value.
  */
  public void setPLPIPY(BigDecimal newvalue)
  {
    fieldPLPIPY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field PLPIPY as a BigDecimal.
  */
  public BigDecimal getBigDecimalPLPIPY()
  {
    return fieldPLPIPY.getBigDecimal();
  }

  /**
  * Set field DTPLPIP using a String value.
  */
  public void setDTPLPIP(String newvalue)
  {
    fieldDTPLPIP.setString(newvalue);
  }

  /**
  * Get value of field DTPLPIP as a String.
  */
  public String getDTPLPIP()
  {
    return fieldDTPLPIP.getString();
  }

  /**
  * Set field PLPBNK using a String value.
  */
  public void setPLPBNK(String newvalue)
  {
    fieldPLPBNK.setString(newvalue);
  }

  /**
  * Get value of field PLPBNK as a String.
  */
  public String getPLPBNK()
  {
    return fieldPLPBNK.getString();
  }

  /**
  * Set field PLPBRN using a String value.
  */
  public void setPLPBRN(String newvalue)
  {
    fieldPLPBRN.setString(newvalue);
  }

  /**
  * Get value of field PLPBRN as a String.
  */
  public String getPLPBRN()
  {
    return fieldPLPBRN.getString();
  }

  /**
  * Set numeric field PLPBRN using a BigDecimal value.
  */
  public void setPLPBRN(BigDecimal newvalue)
  {
    fieldPLPBRN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field PLPBRN as a BigDecimal.
  */
  public BigDecimal getBigDecimalPLPBRN()
  {
    return fieldPLPBRN.getBigDecimal();
  }

  /**
  * Set field PLPBRND using a String value.
  */
  public void setPLPBRND(String newvalue)
  {
    fieldPLPBRND.setString(newvalue);
  }

  /**
  * Get value of field PLPBRND as a String.
  */
  public String getPLPBRND()
  {
    return fieldPLPBRND.getString();
  }

  /**
  * Set field PLPEJE using a String value.
  */
  public void setPLPEJE(String newvalue)
  {
    fieldPLPEJE.setString(newvalue);
  }

  /**
  * Get value of field PLPEJE as a String.
  */
  public String getPLPEJE()
  {
    return fieldPLPEJE.getString();
  }

  /**
  * Set field PLPEJED using a String value.
  */
  public void setPLPEJED(String newvalue)
  {
    fieldPLPEJED.setString(newvalue);
  }

  /**
  * Get value of field PLPEJED as a String.
  */
  public String getPLPEJED()
  {
    return fieldPLPEJED.getString();
  }

  /**
  * Set field PLPCN2 using a String value.
  */
  public void setPLPCN2(String newvalue)
  {
    fieldPLPCN2.setString(newvalue);
  }

  /**
  * Get value of field PLPCN2 as a String.
  */
  public String getPLPCN2()
  {
    return fieldPLPCN2.getString();
  }

  /**
  * Set field PLPCN2D using a String value.
  */
  public void setPLPCN2D(String newvalue)
  {
    fieldPLPCN2D.setString(newvalue);
  }

  /**
  * Get value of field PLPCN2D as a String.
  */
  public String getPLPCN2D()
  {
    return fieldPLPCN2D.getString();
  }

  /**
  * Set field PLPCN3 using a String value.
  */
  public void setPLPCN3(String newvalue)
  {
    fieldPLPCN3.setString(newvalue);
  }

  /**
  * Get value of field PLPCN3 as a String.
  */
  public String getPLPCN3()
  {
    return fieldPLPCN3.getString();
  }

  /**
  * Set field PLPCN3D using a String value.
  */
  public void setPLPCN3D(String newvalue)
  {
    fieldPLPCN3D.setString(newvalue);
  }

  /**
  * Get value of field PLPCN3D as a String.
  */
  public String getPLPCN3D()
  {
    return fieldPLPCN3D.getString();
  }

  /**
  * Set field PLPV23 using a String value.
  */
  public void setPLPV23(String newvalue)
  {
    fieldPLPV23.setString(newvalue);
  }

  /**
  * Get value of field PLPV23 as a String.
  */
  public String getPLPV23()
  {
    return fieldPLPV23.getString();
  }

  /**
  * Set field PLPV23D using a String value.
  */
  public void setPLPV23D(String newvalue)
  {
    fieldPLPV23D.setString(newvalue);
  }

  /**
  * Get value of field PLPV23D as a String.
  */
  public String getPLPV23D()
  {
    return fieldPLPV23D.getString();
  }

  /**
  * Set field PLPV22 using a String value.
  */
  public void setPLPV22(String newvalue)
  {
    fieldPLPV22.setString(newvalue);
  }

  /**
  * Get value of field PLPV22 as a String.
  */
  public String getPLPV22()
  {
    return fieldPLPV22.getString();
  }

  /**
  * Set field PLPV22D using a String value.
  */
  public void setPLPV22D(String newvalue)
  {
    fieldPLPV22D.setString(newvalue);
  }

  /**
  * Get value of field PLPV22D as a String.
  */
  public String getPLPV22D()
  {
    return fieldPLPV22D.getString();
  }

  /**
  * Set field PLPCUN using a String value.
  */
  public void setPLPCUN(String newvalue)
  {
    fieldPLPCUN.setString(newvalue);
  }

  /**
  * Get value of field PLPCUN as a String.
  */
  public String getPLPCUN()
  {
    return fieldPLPCUN.getString();
  }

  /**
  * Set numeric field PLPCUN using a BigDecimal value.
  */
  public void setPLPCUN(BigDecimal newvalue)
  {
    fieldPLPCUN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field PLPCUN as a BigDecimal.
  */
  public BigDecimal getBigDecimalPLPCUN()
  {
    return fieldPLPCUN.getBigDecimal();
  }

  /**
  * Set field CUSIDN using a String value.
  */
  public void setCUSIDN(String newvalue)
  {
    fieldCUSIDN.setString(newvalue);
  }

  /**
  * Get value of field CUSIDN as a String.
  */
  public String getCUSIDN()
  {
    return fieldCUSIDN.getString();
  }

  /**
  * Set field CUSNA1 using a String value.
  */
  public void setCUSNA1(String newvalue)
  {
    fieldCUSNA1.setString(newvalue);
  }

  /**
  * Get value of field CUSNA1 as a String.
  */
  public String getCUSNA1()
  {
    return fieldCUSNA1.getString();
  }

  /**
  * Set field CUSNA2 using a String value.
  */
  public void setCUSNA2(String newvalue)
  {
    fieldCUSNA2.setString(newvalue);
  }

  /**
  * Get value of field CUSNA2 as a String.
  */
  public String getCUSNA2()
  {
    return fieldCUSNA2.getString();
  }

  /**
  * Set field CUSNA3 using a String value.
  */
  public void setCUSNA3(String newvalue)
  {
    fieldCUSNA3.setString(newvalue);
  }

  /**
  * Get value of field CUSNA3 as a String.
  */
  public String getCUSNA3()
  {
    return fieldCUSNA3.getString();
  }

  /**
  * Set field CUSNA4 using a String value.
  */
  public void setCUSNA4(String newvalue)
  {
    fieldCUSNA4.setString(newvalue);
  }

  /**
  * Get value of field CUSNA4 as a String.
  */
  public String getCUSNA4()
  {
    return fieldCUSNA4.getString();
  }

  /**
  * Set field CUFCLF using a String value.
  */
  public void setCUFCLF(String newvalue)
  {
    fieldCUFCLF.setString(newvalue);
  }

  /**
  * Get value of field CUFCLF as a String.
  */
  public String getCUFCLF()
  {
    return fieldCUFCLF.getString();
  }

  /**
  * Set field CUFCLFD using a String value.
  */
  public void setCUFCLFD(String newvalue)
  {
    fieldCUFCLFD.setString(newvalue);
  }

  /**
  * Get value of field CUFCLFD as a String.
  */
  public String getCUFCLFD()
  {
    return fieldCUFCLFD.getString();
  }

  /**
  * Set field PLPGRP using a String value.
  */
  public void setPLPGRP(String newvalue)
  {
    fieldPLPGRP.setString(newvalue);
  }

  /**
  * Get value of field PLPGRP as a String.
  */
  public String getPLPGRP()
  {
    return fieldPLPGRP.getString();
  }

  /**
  * Set numeric field PLPGRP using a BigDecimal value.
  */
  public void setPLPGRP(BigDecimal newvalue)
  {
    fieldPLPGRP.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field PLPGRP as a BigDecimal.
  */
  public BigDecimal getBigDecimalPLPGRP()
  {
    return fieldPLPGRP.getBigDecimal();
  }

  /**
  * Set field PLPGRPD using a String value.
  */
  public void setPLPGRPD(String newvalue)
  {
    fieldPLPGRPD.setString(newvalue);
  }

  /**
  * Get value of field PLPGRPD as a String.
  */
  public String getPLPGRPD()
  {
    return fieldPLPGRPD.getString();
  }

  /**
  * Set field CUSBDD using a String value.
  */
  public void setCUSBDD(String newvalue)
  {
    fieldCUSBDD.setString(newvalue);
  }

  /**
  * Get value of field CUSBDD as a String.
  */
  public String getCUSBDD()
  {
    return fieldCUSBDD.getString();
  }

  /**
  * Set numeric field CUSBDD using a BigDecimal value.
  */
  public void setCUSBDD(BigDecimal newvalue)
  {
    fieldCUSBDD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field CUSBDD as a BigDecimal.
  */
  public BigDecimal getBigDecimalCUSBDD()
  {
    return fieldCUSBDD.getBigDecimal();
  }

  /**
  * Set field CUSBDM using a String value.
  */
  public void setCUSBDM(String newvalue)
  {
    fieldCUSBDM.setString(newvalue);
  }

  /**
  * Get value of field CUSBDM as a String.
  */
  public String getCUSBDM()
  {
    return fieldCUSBDM.getString();
  }

  /**
  * Set numeric field CUSBDM using a BigDecimal value.
  */
  public void setCUSBDM(BigDecimal newvalue)
  {
    fieldCUSBDM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field CUSBDM as a BigDecimal.
  */
  public BigDecimal getBigDecimalCUSBDM()
  {
    return fieldCUSBDM.getBigDecimal();
  }

  /**
  * Set field CUSBDY using a String value.
  */
  public void setCUSBDY(String newvalue)
  {
    fieldCUSBDY.setString(newvalue);
  }

  /**
  * Get value of field CUSBDY as a String.
  */
  public String getCUSBDY()
  {
    return fieldCUSBDY.getString();
  }

  /**
  * Set numeric field CUSBDY using a BigDecimal value.
  */
  public void setCUSBDY(BigDecimal newvalue)
  {
    fieldCUSBDY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field CUSBDY as a BigDecimal.
  */
  public BigDecimal getBigDecimalCUSBDY()
  {
    return fieldCUSBDY.getBigDecimal();
  }

  /**
  * Set field DTCUSBD using a String value.
  */
  public void setDTCUSBD(String newvalue)
  {
    fieldDTCUSBD.setString(newvalue);
  }

  /**
  * Get value of field DTCUSBD as a String.
  */
  public String getDTCUSBD()
  {
    return fieldDTCUSBD.getString();
  }

  /**
  * Set field CUSMAD using a String value.
  */
  public void setCUSMAD(String newvalue)
  {
    fieldCUSMAD.setString(newvalue);
  }

  /**
  * Get value of field CUSMAD as a String.
  */
  public String getCUSMAD()
  {
    return fieldCUSMAD.getString();
  }

  /**
  * Set numeric field CUSMAD using a BigDecimal value.
  */
  public void setCUSMAD(BigDecimal newvalue)
  {
    fieldCUSMAD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field CUSMAD as a BigDecimal.
  */
  public BigDecimal getBigDecimalCUSMAD()
  {
    return fieldCUSMAD.getBigDecimal();
  }

  /**
  * Set field CUSMAM using a String value.
  */
  public void setCUSMAM(String newvalue)
  {
    fieldCUSMAM.setString(newvalue);
  }

  /**
  * Get value of field CUSMAM as a String.
  */
  public String getCUSMAM()
  {
    return fieldCUSMAM.getString();
  }

  /**
  * Set numeric field CUSMAM using a BigDecimal value.
  */
  public void setCUSMAM(BigDecimal newvalue)
  {
    fieldCUSMAM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field CUSMAM as a BigDecimal.
  */
  public BigDecimal getBigDecimalCUSMAM()
  {
    return fieldCUSMAM.getBigDecimal();
  }

  /**
  * Set field CUSMAY using a String value.
  */
  public void setCUSMAY(String newvalue)
  {
    fieldCUSMAY.setString(newvalue);
  }

  /**
  * Get value of field CUSMAY as a String.
  */
  public String getCUSMAY()
  {
    return fieldCUSMAY.getString();
  }

  /**
  * Set numeric field CUSMAY using a BigDecimal value.
  */
  public void setCUSMAY(BigDecimal newvalue)
  {
    fieldCUSMAY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field CUSMAY as a BigDecimal.
  */
  public BigDecimal getBigDecimalCUSMAY()
  {
    return fieldCUSMAY.getBigDecimal();
  }

  /**
  * Set field DTCUSMA using a String value.
  */
  public void setDTCUSMA(String newvalue)
  {
    fieldDTCUSMA.setString(newvalue);
  }

  /**
  * Get value of field DTCUSMA as a String.
  */
  public String getDTCUSMA()
  {
    return fieldDTCUSMA.getString();
  }

  /**
  * Set field PLPBUC using a String value.
  */
  public void setPLPBUC(String newvalue)
  {
    fieldPLPBUC.setString(newvalue);
  }

  /**
  * Get value of field PLPBUC as a String.
  */
  public String getPLPBUC()
  {
    return fieldPLPBUC.getString();
  }

  /**
  * Set field PLPBUCD using a String value.
  */
  public void setPLPBUCD(String newvalue)
  {
    fieldPLPBUCD.setString(newvalue);
  }

  /**
  * Get value of field PLPBUCD as a String.
  */
  public String getPLPBUCD()
  {
    return fieldPLPBUCD.getString();
  }

  /**
  * Set field PLPCL9 using a String value.
  */
  public void setPLPCL9(String newvalue)
  {
    fieldPLPCL9.setString(newvalue);
  }

  /**
  * Get value of field PLPCL9 as a String.
  */
  public String getPLPCL9()
  {
    return fieldPLPCL9.getString();
  }

  /**
  * Set field PLPCL9D using a String value.
  */
  public void setPLPCL9D(String newvalue)
  {
    fieldPLPCL9D.setString(newvalue);
  }

  /**
  * Get value of field PLPCL9D as a String.
  */
  public String getPLPCL9D()
  {
    return fieldPLPCL9D.getString();
  }

  /**
  * Set field PLPUGE using a String value.
  */
  public void setPLPUGE(String newvalue)
  {
    fieldPLPUGE.setString(newvalue);
  }

  /**
  * Get value of field PLPUGE as a String.
  */
  public String getPLPUGE()
  {
    return fieldPLPUGE.getString();
  }

  /**
  * Set field PLPUGED using a String value.
  */
  public void setPLPUGED(String newvalue)
  {
    fieldPLPUGED.setString(newvalue);
  }

  /**
  * Get value of field PLPUGED as a String.
  */
  public String getPLPUGED()
  {
    return fieldPLPUGED.getString();
  }

  /**
  * Set field XPACOM using a String value.
  */
  public void setXPACOM(String newvalue)
  {
    fieldXPACOM.setString(newvalue);
  }

  /**
  * Get value of field XPACOM as a String.
  */
  public String getXPACOM()
  {
    return fieldXPACOM.getString();
  }

  /**
  * Set field PLPAM1 using a String value.
  */
  public void setPLPAM1(String newvalue)
  {
    fieldPLPAM1.setString(newvalue);
  }

  /**
  * Get value of field PLPAM1 as a String.
  */
  public String getPLPAM1()
  {
    return fieldPLPAM1.getString();
  }

  /**
  * Set numeric field PLPAM1 using a BigDecimal value.
  */
  public void setPLPAM1(BigDecimal newvalue)
  {
    fieldPLPAM1.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field PLPAM1 as a BigDecimal.
  */
  public BigDecimal getBigDecimalPLPAM1()
  {
    return fieldPLPAM1.getBigDecimal();
  }

  /**
  * Set field PLPAM2 using a String value.
  */
  public void setPLPAM2(String newvalue)
  {
    fieldPLPAM2.setString(newvalue);
  }

  /**
  * Get value of field PLPAM2 as a String.
  */
  public String getPLPAM2()
  {
    return fieldPLPAM2.getString();
  }

  /**
  * Set numeric field PLPAM2 using a BigDecimal value.
  */
  public void setPLPAM2(BigDecimal newvalue)
  {
    fieldPLPAM2.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field PLPAM2 as a BigDecimal.
  */
  public BigDecimal getBigDecimalPLPAM2()
  {
    return fieldPLPAM2.getBigDecimal();
  }

  /**
  * Set field PLPNFD using a String value.
  */
  public void setPLPNFD(String newvalue)
  {
    fieldPLPNFD.setString(newvalue);
  }

  /**
  * Get value of field PLPNFD as a String.
  */
  public String getPLPNFD()
  {
    return fieldPLPNFD.getString();
  }

  /**
  * Set numeric field PLPNFD using a BigDecimal value.
  */
  public void setPLPNFD(BigDecimal newvalue)
  {
    fieldPLPNFD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field PLPNFD as a BigDecimal.
  */
  public BigDecimal getBigDecimalPLPNFD()
  {
    return fieldPLPNFD.getBigDecimal();
  }

  /**
  * Set field PLPNFM using a String value.
  */
  public void setPLPNFM(String newvalue)
  {
    fieldPLPNFM.setString(newvalue);
  }

  /**
  * Get value of field PLPNFM as a String.
  */
  public String getPLPNFM()
  {
    return fieldPLPNFM.getString();
  }

  /**
  * Set numeric field PLPNFM using a BigDecimal value.
  */
  public void setPLPNFM(BigDecimal newvalue)
  {
    fieldPLPNFM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field PLPNFM as a BigDecimal.
  */
  public BigDecimal getBigDecimalPLPNFM()
  {
    return fieldPLPNFM.getBigDecimal();
  }

  /**
  * Set field PLPNFY using a String value.
  */
  public void setPLPNFY(String newvalue)
  {
    fieldPLPNFY.setString(newvalue);
  }

  /**
  * Get value of field PLPNFY as a String.
  */
  public String getPLPNFY()
  {
    return fieldPLPNFY.getString();
  }

  /**
  * Set numeric field PLPNFY using a BigDecimal value.
  */
  public void setPLPNFY(BigDecimal newvalue)
  {
    fieldPLPNFY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field PLPNFY as a BigDecimal.
  */
  public BigDecimal getBigDecimalPLPNFY()
  {
    return fieldPLPNFY.getBigDecimal();
  }

  /**
  * Set field DTPLPNF using a String value.
  */
  public void setDTPLPNF(String newvalue)
  {
    fieldDTPLPNF.setString(newvalue);
  }

  /**
  * Get value of field DTPLPNF as a String.
  */
  public String getDTPLPNF()
  {
    return fieldDTPLPNF.getString();
  }

  /**
  * Set field E01FLGMAS using a String value.
  */
  public void setE01FLGMAS(String newvalue)
  {
    fieldE01FLGMAS.setString(newvalue);
  }

  /**
  * Get value of field E01FLGMAS as a String.
  */
  public String getE01FLGMAS()
  {
    return fieldE01FLGMAS.getString();
  }

}
