package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from ESS025004 physical file definition.
* 
* File level identifier is 1140909094821.
* Record format level identifier is 5CACA9AA9B55F.
*/

public class ESS025004Message extends MessageRecord
{
  final static String fldnames[] = {
                                     "USUARIO",
                                     "FLAGMAS",
                                     "MESPROCES",
                                     "DIAPROCES",
                                     "ANOPROCES",
                                     "HORAPROCE",
                                     "CLIENTE",
                                     "NOMBRE",
                                     "CUENTA",
                                     "REFEREN",
                                     "OPERADOR",
                                     "NOMBREOPE",
                                     "SUPERVIS",
                                     "NOMBRESUP",
                                     "APLICACI",
                                     "PRODUCTO",
                                     "EVENTO",
                                     "DIRECCIP",
                                     "ARCHIVO",
                                     "PROGRAMA",
                                     "DSCEVENTO",
                                     "CAMPO",
                                     "DSCCAMPO",
                                     "VALANTES",
                                     "VALDESPUES"
                                   };
  final static String tnames[] = {
                                   "USUARIO",
                                   "FLAGMAS",
                                   "MESPROCES",
                                   "DIAPROCES",
                                   "ANOPROCES",
                                   "HORAPROCE",
                                   "CLIENTE",
                                   "NOMBRE",
                                   "CUENTA",
                                   "REFEREN",
                                   "OPERADOR",
                                   "NOMBREOPE",
                                   "SUPERVIS",
                                   "NOMBRESUP",
                                   "APLICACI",
                                   "PRODUCTO",
                                   "EVENTO",
                                   "DIRECCIP",
                                   "ARCHIVO",
                                   "PROGRAMA",
                                   "DSCEVENTO",
                                   "CAMPO",
                                   "DSCCAMPO",
                                   "VALANTES",
                                   "VALDESPUES"
                                 };
  final static String fid = "1140909094821";
  final static String rid = "5CACA9AA9B55F";
  final static String fmtname = "ESS025004";
  final int FIELDCOUNT = 25;
  private static Hashtable tlookup = new Hashtable();
  private CharacterField fieldUSUARIO = null;
  private CharacterField fieldFLAGMAS = null;
  private DecimalField fieldMESPROCES = null;
  private DecimalField fieldDIAPROCES = null;
  private DecimalField fieldANOPROCES = null;
  private CharacterField fieldHORAPROCE = null;
  private DecimalField fieldCLIENTE = null;
  private CharacterField fieldNOMBRE = null;
  private DecimalField fieldCUENTA = null;
  private DecimalField fieldREFEREN = null;
  private CharacterField fieldOPERADOR = null;
  private CharacterField fieldNOMBREOPE = null;
  private CharacterField fieldSUPERVIS = null;
  private CharacterField fieldNOMBRESUP = null;
  private CharacterField fieldAPLICACI = null;
  private CharacterField fieldPRODUCTO = null;
  private CharacterField fieldEVENTO = null;
  private CharacterField fieldDIRECCIP = null;
  private CharacterField fieldARCHIVO = null;
  private CharacterField fieldPROGRAMA = null;
  private CharacterField fieldDSCEVENTO = null;
  private CharacterField fieldCAMPO = null;
  private CharacterField fieldDSCCAMPO = null;
  private CharacterField fieldVALANTES = null;
  private CharacterField fieldVALDESPUES = null;

  /**
  * Constructor for ESS025004Message.
  */
  public ESS025004Message()
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
    recordsize = 955;
    fileid = fid;
    recordid = rid;
    message = new byte[getByteLength()];
    formatname = fmtname;
    fieldnames = fldnames;
    tagnames = tnames;
    fields = new MessageField[FIELDCOUNT];

    fields[0] = fieldUSUARIO =
    new CharacterField(message, HEADERSIZE + 0, 10, "USUARIO");
    fields[1] = fieldFLAGMAS =
    new CharacterField(message, HEADERSIZE + 10, 1, "FLAGMAS");
    fields[2] = fieldMESPROCES =
    new DecimalField(message, HEADERSIZE + 11, 3, 0, "MESPROCES");
    fields[3] = fieldDIAPROCES =
    new DecimalField(message, HEADERSIZE + 14, 3, 0, "DIAPROCES");
    fields[4] = fieldANOPROCES =
    new DecimalField(message, HEADERSIZE + 17, 5, 0, "ANOPROCES");
    fields[5] = fieldHORAPROCE =
    new CharacterField(message, HEADERSIZE + 22, 26, "HORAPROCE");
    fields[6] = fieldCLIENTE =
    new DecimalField(message, HEADERSIZE + 48, 10, 0, "CLIENTE");
    fields[7] = fieldNOMBRE =
    new CharacterField(message, HEADERSIZE + 58, 60, "NOMBRE");
    fields[8] = fieldCUENTA =
    new DecimalField(message, HEADERSIZE + 118, 13, 0, "CUENTA");
    fields[9] = fieldREFEREN =
    new DecimalField(message, HEADERSIZE + 131, 13, 0, "REFEREN");
    fields[10] = fieldOPERADOR =
    new CharacterField(message, HEADERSIZE + 144, 10, "OPERADOR");
    fields[11] = fieldNOMBREOPE =
    new CharacterField(message, HEADERSIZE + 154, 45, "NOMBREOPE");
    fields[12] = fieldSUPERVIS =
    new CharacterField(message, HEADERSIZE + 199, 10, "SUPERVIS");
    fields[13] = fieldNOMBRESUP =
    new CharacterField(message, HEADERSIZE + 209, 45, "NOMBRESUP");
    fields[14] = fieldAPLICACI =
    new CharacterField(message, HEADERSIZE + 254, 25, "APLICACI");
    fields[15] = fieldPRODUCTO =
    new CharacterField(message, HEADERSIZE + 279, 4, "PRODUCTO");
    fields[16] = fieldEVENTO =
    new CharacterField(message, HEADERSIZE + 283, 10, "EVENTO");
    fields[17] = fieldDIRECCIP =
    new CharacterField(message, HEADERSIZE + 293, 25, "DIRECCIP");
    fields[18] = fieldARCHIVO =
    new CharacterField(message, HEADERSIZE + 318, 10, "ARCHIVO");
    fields[19] = fieldPROGRAMA =
    new CharacterField(message, HEADERSIZE + 328, 10, "PROGRAMA");
    fields[20] = fieldDSCEVENTO =
    new CharacterField(message, HEADERSIZE + 338, 35, "DSCEVENTO");
    fields[21] = fieldCAMPO =
    new CharacterField(message, HEADERSIZE + 373, 10, "CAMPO");
    fields[22] = fieldDSCCAMPO =
    new CharacterField(message, HEADERSIZE + 383, 60, "DSCCAMPO");
    fields[23] = fieldVALANTES =
    new CharacterField(message, HEADERSIZE + 443, 256, "VALANTES");
    fields[24] = fieldVALDESPUES =
    new CharacterField(message, HEADERSIZE + 699, 256, "VALDESPUES");

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
  * Set field USUARIO using a String value.
  */
  public void setUSUARIO(String newvalue)
  {
    fieldUSUARIO.setString(newvalue);
  }

  /**
  * Get value of field USUARIO as a String.
  */
  public String getUSUARIO()
  {
    return fieldUSUARIO.getString();
  }

  /**
  * Set field FLAGMAS using a String value.
  */
  public void setFLAGMAS(String newvalue)
  {
    fieldFLAGMAS.setString(newvalue);
  }

  /**
  * Get value of field FLAGMAS as a String.
  */
  public String getFLAGMAS()
  {
    return fieldFLAGMAS.getString();
  }

  /**
  * Set field MESPROCES using a String value.
  */
  public void setMESPROCES(String newvalue)
  {
    fieldMESPROCES.setString(newvalue);
  }

  /**
  * Get value of field MESPROCES as a String.
  */
  public String getMESPROCES()
  {
    return fieldMESPROCES.getString();
  }

  /**
  * Set numeric field MESPROCES using a BigDecimal value.
  */
  public void setMESPROCES(BigDecimal newvalue)
  {
    fieldMESPROCES.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field MESPROCES as a BigDecimal.
  */
  public BigDecimal getBigDecimalMESPROCES()
  {
    return fieldMESPROCES.getBigDecimal();
  }

  /**
  * Set field DIAPROCES using a String value.
  */
  public void setDIAPROCES(String newvalue)
  {
    fieldDIAPROCES.setString(newvalue);
  }

  /**
  * Get value of field DIAPROCES as a String.
  */
  public String getDIAPROCES()
  {
    return fieldDIAPROCES.getString();
  }

  /**
  * Set numeric field DIAPROCES using a BigDecimal value.
  */
  public void setDIAPROCES(BigDecimal newvalue)
  {
    fieldDIAPROCES.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field DIAPROCES as a BigDecimal.
  */
  public BigDecimal getBigDecimalDIAPROCES()
  {
    return fieldDIAPROCES.getBigDecimal();
  }

  /**
  * Set field ANOPROCES using a String value.
  */
  public void setANOPROCES(String newvalue)
  {
    fieldANOPROCES.setString(newvalue);
  }

  /**
  * Get value of field ANOPROCES as a String.
  */
  public String getANOPROCES()
  {
    return fieldANOPROCES.getString();
  }

  /**
  * Set numeric field ANOPROCES using a BigDecimal value.
  */
  public void setANOPROCES(BigDecimal newvalue)
  {
    fieldANOPROCES.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field ANOPROCES as a BigDecimal.
  */
  public BigDecimal getBigDecimalANOPROCES()
  {
    return fieldANOPROCES.getBigDecimal();
  }

  /**
  * Set field HORAPROCE using a String value.
  */
  public void setHORAPROCE(String newvalue)
  {
    fieldHORAPROCE.setString(newvalue);
  }

  /**
  * Get value of field HORAPROCE as a String.
  */
  public String getHORAPROCE()
  {
    return fieldHORAPROCE.getString();
  }

  /**
  * Set field CLIENTE using a String value.
  */
  public void setCLIENTE(String newvalue)
  {
    fieldCLIENTE.setString(newvalue);
  }

  /**
  * Get value of field CLIENTE as a String.
  */
  public String getCLIENTE()
  {
    return fieldCLIENTE.getString();
  }

  /**
  * Set numeric field CLIENTE using a BigDecimal value.
  */
  public void setCLIENTE(BigDecimal newvalue)
  {
    fieldCLIENTE.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field CLIENTE as a BigDecimal.
  */
  public BigDecimal getBigDecimalCLIENTE()
  {
    return fieldCLIENTE.getBigDecimal();
  }

  /**
  * Set field NOMBRE using a String value.
  */
  public void setNOMBRE(String newvalue)
  {
    fieldNOMBRE.setString(newvalue);
  }

  /**
  * Get value of field NOMBRE as a String.
  */
  public String getNOMBRE()
  {
    return fieldNOMBRE.getString();
  }

  /**
  * Set field CUENTA using a String value.
  */
  public void setCUENTA(String newvalue)
  {
    fieldCUENTA.setString(newvalue);
  }

  /**
  * Get value of field CUENTA as a String.
  */
  public String getCUENTA()
  {
    return fieldCUENTA.getString();
  }

  /**
  * Set numeric field CUENTA using a BigDecimal value.
  */
  public void setCUENTA(BigDecimal newvalue)
  {
    fieldCUENTA.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field CUENTA as a BigDecimal.
  */
  public BigDecimal getBigDecimalCUENTA()
  {
    return fieldCUENTA.getBigDecimal();
  }

  /**
  * Set field REFEREN using a String value.
  */
  public void setREFEREN(String newvalue)
  {
    fieldREFEREN.setString(newvalue);
  }

  /**
  * Get value of field REFEREN as a String.
  */
  public String getREFEREN()
  {
    return fieldREFEREN.getString();
  }

  /**
  * Set numeric field REFEREN using a BigDecimal value.
  */
  public void setREFEREN(BigDecimal newvalue)
  {
    fieldREFEREN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field REFEREN as a BigDecimal.
  */
  public BigDecimal getBigDecimalREFEREN()
  {
    return fieldREFEREN.getBigDecimal();
  }

  /**
  * Set field OPERADOR using a String value.
  */
  public void setOPERADOR(String newvalue)
  {
    fieldOPERADOR.setString(newvalue);
  }

  /**
  * Get value of field OPERADOR as a String.
  */
  public String getOPERADOR()
  {
    return fieldOPERADOR.getString();
  }

  /**
  * Set field NOMBREOPE using a String value.
  */
  public void setNOMBREOPE(String newvalue)
  {
    fieldNOMBREOPE.setString(newvalue);
  }

  /**
  * Get value of field NOMBREOPE as a String.
  */
  public String getNOMBREOPE()
  {
    return fieldNOMBREOPE.getString();
  }

  /**
  * Set field SUPERVIS using a String value.
  */
  public void setSUPERVIS(String newvalue)
  {
    fieldSUPERVIS.setString(newvalue);
  }

  /**
  * Get value of field SUPERVIS as a String.
  */
  public String getSUPERVIS()
  {
    return fieldSUPERVIS.getString();
  }

  /**
  * Set field NOMBRESUP using a String value.
  */
  public void setNOMBRESUP(String newvalue)
  {
    fieldNOMBRESUP.setString(newvalue);
  }

  /**
  * Get value of field NOMBRESUP as a String.
  */
  public String getNOMBRESUP()
  {
    return fieldNOMBRESUP.getString();
  }

  /**
  * Set field APLICACI using a String value.
  */
  public void setAPLICACI(String newvalue)
  {
    fieldAPLICACI.setString(newvalue);
  }

  /**
  * Get value of field APLICACI as a String.
  */
  public String getAPLICACI()
  {
    return fieldAPLICACI.getString();
  }

  /**
  * Set field PRODUCTO using a String value.
  */
  public void setPRODUCTO(String newvalue)
  {
    fieldPRODUCTO.setString(newvalue);
  }

  /**
  * Get value of field PRODUCTO as a String.
  */
  public String getPRODUCTO()
  {
    return fieldPRODUCTO.getString();
  }

  /**
  * Set field EVENTO using a String value.
  */
  public void setEVENTO(String newvalue)
  {
    fieldEVENTO.setString(newvalue);
  }

  /**
  * Get value of field EVENTO as a String.
  */
  public String getEVENTO()
  {
    return fieldEVENTO.getString();
  }

  /**
  * Set field DIRECCIP using a String value.
  */
  public void setDIRECCIP(String newvalue)
  {
    fieldDIRECCIP.setString(newvalue);
  }

  /**
  * Get value of field DIRECCIP as a String.
  */
  public String getDIRECCIP()
  {
    return fieldDIRECCIP.getString();
  }

  /**
  * Set field ARCHIVO using a String value.
  */
  public void setARCHIVO(String newvalue)
  {
    fieldARCHIVO.setString(newvalue);
  }

  /**
  * Get value of field ARCHIVO as a String.
  */
  public String getARCHIVO()
  {
    return fieldARCHIVO.getString();
  }

  /**
  * Set field PROGRAMA using a String value.
  */
  public void setPROGRAMA(String newvalue)
  {
    fieldPROGRAMA.setString(newvalue);
  }

  /**
  * Get value of field PROGRAMA as a String.
  */
  public String getPROGRAMA()
  {
    return fieldPROGRAMA.getString();
  }

  /**
  * Set field DSCEVENTO using a String value.
  */
  public void setDSCEVENTO(String newvalue)
  {
    fieldDSCEVENTO.setString(newvalue);
  }

  /**
  * Get value of field DSCEVENTO as a String.
  */
  public String getDSCEVENTO()
  {
    return fieldDSCEVENTO.getString();
  }

  /**
  * Set field CAMPO using a String value.
  */
  public void setCAMPO(String newvalue)
  {
    fieldCAMPO.setString(newvalue);
  }

  /**
  * Get value of field CAMPO as a String.
  */
  public String getCAMPO()
  {
    return fieldCAMPO.getString();
  }

  /**
  * Set field DSCCAMPO using a String value.
  */
  public void setDSCCAMPO(String newvalue)
  {
    fieldDSCCAMPO.setString(newvalue);
  }

  /**
  * Get value of field DSCCAMPO as a String.
  */
  public String getDSCCAMPO()
  {
    return fieldDSCCAMPO.getString();
  }

  /**
  * Set field VALANTES using a String value.
  */
  public void setVALANTES(String newvalue)
  {
    fieldVALANTES.setString(newvalue);
  }

  /**
  * Get value of field VALANTES as a String.
  */
  public String getVALANTES()
  {
    return fieldVALANTES.getString();
  }

  /**
  * Set field VALDESPUES using a String value.
  */
  public void setVALDESPUES(String newvalue)
  {
    fieldVALDESPUES.setString(newvalue);
  }

  /**
  * Get value of field VALDESPUES as a String.
  */
  public String getVALDESPUES()
  {
    return fieldVALDESPUES.getString();
  }

}
