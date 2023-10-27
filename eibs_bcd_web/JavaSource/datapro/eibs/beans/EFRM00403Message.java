package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from EFRM00403 physical file definition.
* 
* File level identifier is 1170202115317.
* Record format level identifier is 371684EC162DC.
*/

public class EFRM00403Message extends MessageRecord
{
  final static String fldnames[] = {
                                     "DPDNPR",
                                     "DPDPRD",
                                     "DPDPRDD",
                                     "DPDDOC",
                                     "DPDDOCD",
                                     "DPDCOM",
                                     "DPDTDO",
                                     "DPDTDOD",
                                     "DPDFI1",
                                     "DPDFI1D",
                                     "H03FLGMAS"
                                   };
  final static String tnames[] = {
                                   "*numPropuestaRecDoc",
                                   "codigoProductoDocum",
                                   "descCodigoProdDocum",
                                   "codDocumento",
                                   "descDocumento",
                                   "comDocumento",
                                   "claseDocumento",
                                   "descClaseDoc",
                                   "estadoDocumento",
                                   "descEstDoc",
                                   "*flgMas"
                                 };
  final static String fid = "1170202115317";
  final static String rid = "371684EC162DC";
  final static String fmtname = "EFRM00403";
  final int FIELDCOUNT = 11;
  private static Hashtable tlookup = new Hashtable();
  private DecimalField fieldDPDNPR = null;
  private CharacterField fieldDPDPRD = null;
  private CharacterField fieldDPDPRDD = null;
  private CharacterField fieldDPDDOC = null;
  private CharacterField fieldDPDDOCD = null;
  private CharacterField fieldDPDCOM = null;
  private CharacterField fieldDPDTDO = null;
  private CharacterField fieldDPDTDOD = null;
  private CharacterField fieldDPDFI1 = null;
  private CharacterField fieldDPDFI1D = null;
  private CharacterField fieldH03FLGMAS = null;

  /**
  * Constructor for EFRM00403Message.
  */
  public EFRM00403Message()
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
    recordsize = 405;
    fileid = fid;
    recordid = rid;
    message = new byte[getByteLength()];
    formatname = fmtname;
    fieldnames = fldnames;
    tagnames = tnames;
    fields = new MessageField[FIELDCOUNT];

    fields[0] = fieldDPDNPR =
    new DecimalField(message, HEADERSIZE + 0, 13, 0, "*numPropuestaRecDoc");
    fields[1] = fieldDPDPRD =
    new CharacterField(message, HEADERSIZE + 13, 4, "codigoProductoDocum");
    fields[2] = fieldDPDPRDD =
    new CharacterField(message, HEADERSIZE + 17, 60, "descCodigoProdDocum");
    fields[3] = fieldDPDDOC =
    new CharacterField(message, HEADERSIZE + 77, 4, "codDocumento");
    fields[4] = fieldDPDDOCD =
    new CharacterField(message, HEADERSIZE + 81, 35, "descDocumento");
    fields[5] = fieldDPDCOM =
    new CharacterField(message, HEADERSIZE + 116, 256, "comDocumento");
    fields[6] = fieldDPDTDO =
    new CharacterField(message, HEADERSIZE + 372, 1, "claseDocumento");
    fields[7] = fieldDPDTDOD =
    new CharacterField(message, HEADERSIZE + 373, 15, "descClaseDoc");
    fields[8] = fieldDPDFI1 =
    new CharacterField(message, HEADERSIZE + 388, 1, "estadoDocumento");
    fields[9] = fieldDPDFI1D =
    new CharacterField(message, HEADERSIZE + 389, 15, "descEstDoc");
    fields[10] = fieldH03FLGMAS =
    new CharacterField(message, HEADERSIZE + 404, 1, "*flgMas");

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
  * Set field DPDNPR using a String value.
  */
  public void setDPDNPR(String newvalue)
  {
    fieldDPDNPR.setString(newvalue);
  }

  /**
  * Get value of field DPDNPR as a String.
  */
  public String getDPDNPR()
  {
    return fieldDPDNPR.getString();
  }

  /**
  * Set numeric field DPDNPR using a BigDecimal value.
  */
  public void setDPDNPR(BigDecimal newvalue)
  {
    fieldDPDNPR.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field DPDNPR as a BigDecimal.
  */
  public BigDecimal getBigDecimalDPDNPR()
  {
    return fieldDPDNPR.getBigDecimal();
  }

  /**
  * Set field DPDPRD using a String value.
  */
  public void setDPDPRD(String newvalue)
  {
    fieldDPDPRD.setString(newvalue);
  }

  /**
  * Get value of field DPDPRD as a String.
  */
  public String getDPDPRD()
  {
    return fieldDPDPRD.getString();
  }

  /**
  * Set field DPDPRDD using a String value.
  */
  public void setDPDPRDD(String newvalue)
  {
    fieldDPDPRDD.setString(newvalue);
  }

  /**
  * Get value of field DPDPRDD as a String.
  */
  public String getDPDPRDD()
  {
    return fieldDPDPRDD.getString();
  }

  /**
  * Set field DPDDOC using a String value.
  */
  public void setDPDDOC(String newvalue)
  {
    fieldDPDDOC.setString(newvalue);
  }

  /**
  * Get value of field DPDDOC as a String.
  */
  public String getDPDDOC()
  {
    return fieldDPDDOC.getString();
  }

  /**
  * Set field DPDDOCD using a String value.
  */
  public void setDPDDOCD(String newvalue)
  {
    fieldDPDDOCD.setString(newvalue);
  }

  /**
  * Get value of field DPDDOCD as a String.
  */
  public String getDPDDOCD()
  {
    return fieldDPDDOCD.getString();
  }

  /**
  * Set field DPDCOM using a String value.
  */
  public void setDPDCOM(String newvalue)
  {
    fieldDPDCOM.setString(newvalue);
  }

  /**
  * Get value of field DPDCOM as a String.
  */
  public String getDPDCOM()
  {
    return fieldDPDCOM.getString();
  }

  /**
  * Set field DPDTDO using a String value.
  */
  public void setDPDTDO(String newvalue)
  {
    fieldDPDTDO.setString(newvalue);
  }

  /**
  * Get value of field DPDTDO as a String.
  */
  public String getDPDTDO()
  {
    return fieldDPDTDO.getString();
  }

  /**
  * Set field DPDTDOD using a String value.
  */
  public void setDPDTDOD(String newvalue)
  {
    fieldDPDTDOD.setString(newvalue);
  }

  /**
  * Get value of field DPDTDOD as a String.
  */
  public String getDPDTDOD()
  {
    return fieldDPDTDOD.getString();
  }

  /**
  * Set field DPDFI1 using a String value.
  */
  public void setDPDFI1(String newvalue)
  {
    fieldDPDFI1.setString(newvalue);
  }

  /**
  * Get value of field DPDFI1 as a String.
  */
  public String getDPDFI1()
  {
    return fieldDPDFI1.getString();
  }

  /**
  * Set field DPDFI1D using a String value.
  */
  public void setDPDFI1D(String newvalue)
  {
    fieldDPDFI1D.setString(newvalue);
  }

  /**
  * Get value of field DPDFI1D as a String.
  */
  public String getDPDFI1D()
  {
    return fieldDPDFI1D.getString();
  }

  /**
  * Set field H03FLGMAS using a String value.
  */
  public void setH03FLGMAS(String newvalue)
  {
    fieldH03FLGMAS.setString(newvalue);
  }

  /**
  * Get value of field H03FLGMAS as a String.
  */
  public String getH03FLGMAS()
  {
    return fieldH03FLGMAS.getString();
  }

}
