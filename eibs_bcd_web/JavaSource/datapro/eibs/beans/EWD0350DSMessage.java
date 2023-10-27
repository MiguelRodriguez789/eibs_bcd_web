package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from EWD0350DS physical file definition.
* 
* File level identifier is 1130611113454.
* Record format level identifier is 3831897F597BC.
*/

public class EWD0350DSMessage extends MessageRecord
{
  final static String fldnames[] = {
                                     "EWDFECOPE",
                                     "EWDFECNPL",
                                     "EWDFECIDN",
                                     "EWDNOMBRE",
                                     "EWDFECTDO",
                                     "EWDFECCCY",
                                     "EWDFECMMO",
                                     "EWDFECPIS",
                                     "EWDOPE"
                                   };
  final static String tnames[] = {
                                   "EWDFECOPE",
                                   "EWDFECNPL",
                                   "EWDFECIDN",
                                   "EWDNOMBRE",
                                   "EWDFECTDO",
                                   "EWDFECCCY",
                                   "EWDFECMMO",
                                   "EWDFECPIS",
                                   "EWDOPE"
                                 };
  final static String fid = "1130611113454";
  final static String rid = "3831897F597BC";
  final static String fmtname = "EWD0350DS";
  final int FIELDCOUNT = 9;
  private static Hashtable tlookup = new Hashtable();
  private CharacterField fieldEWDFECOPE = null;
  private DecimalField fieldEWDFECNPL = null;
  private CharacterField fieldEWDFECIDN = null;
  private CharacterField fieldEWDNOMBRE = null;
  private DecimalField fieldEWDFECTDO = null;
  private CharacterField fieldEWDFECCCY = null;
  private DecimalField fieldEWDFECMMO = null;
  private CharacterField fieldEWDFECPIS = null;
  private CharacterField fieldEWDOPE = null;

  /**
  * Constructor for EWD0350DSMessage.
  */
  public EWD0350DSMessage()
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
    recordsize = 106;
    fileid = fid;
    recordid = rid;
    message = new byte[getByteLength()];
    formatname = fmtname;
    fieldnames = fldnames;
    tagnames = tnames;
    fields = new MessageField[FIELDCOUNT];

    fields[0] = fieldEWDFECOPE =
    new CharacterField(message, HEADERSIZE + 0, 2, "EWDFECOPE");
    fields[1] = fieldEWDFECNPL =
    new DecimalField(message, HEADERSIZE + 2, 7, 0, "EWDFECNPL");
    fields[2] = fieldEWDFECIDN =
    new CharacterField(message, HEADERSIZE + 9, 25, "EWDFECIDN");
    fields[3] = fieldEWDNOMBRE =
    new CharacterField(message, HEADERSIZE + 34, 45, "EWDNOMBRE");
    fields[4] = fieldEWDFECTDO =
    new DecimalField(message, HEADERSIZE + 79, 2, 0, "EWDFECTDO");
    fields[5] = fieldEWDFECCCY =
    new CharacterField(message, HEADERSIZE + 81, 3, "EWDFECCCY");
    fields[6] = fieldEWDFECMMO =
    new DecimalField(message, HEADERSIZE + 84, 17, 2, "EWDFECMMO");
    fields[7] = fieldEWDFECPIS =
    new CharacterField(message, HEADERSIZE + 101, 4, "EWDFECPIS");
    fields[8] = fieldEWDOPE =
    new CharacterField(message, HEADERSIZE + 105, 1, "EWDOPE");

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
  * Set field EWDFECOPE using a String value.
  */
  public void setEWDFECOPE(String newvalue)
  {
    fieldEWDFECOPE.setString(newvalue);
  }

  /**
  * Get value of field EWDFECOPE as a String.
  */
  public String getEWDFECOPE()
  {
    return fieldEWDFECOPE.getString();
  }

  /**
  * Set field EWDFECNPL using a String value.
  */
  public void setEWDFECNPL(String newvalue)
  {
    fieldEWDFECNPL.setString(newvalue);
  }

  /**
  * Get value of field EWDFECNPL as a String.
  */
  public String getEWDFECNPL()
  {
    return fieldEWDFECNPL.getString();
  }

  /**
  * Set numeric field EWDFECNPL using a BigDecimal value.
  */
  public void setEWDFECNPL(BigDecimal newvalue)
  {
    fieldEWDFECNPL.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field EWDFECNPL as a BigDecimal.
  */
  public BigDecimal getBigDecimalEWDFECNPL()
  {
    return fieldEWDFECNPL.getBigDecimal();
  }

  /**
  * Set field EWDFECIDN using a String value.
  */
  public void setEWDFECIDN(String newvalue)
  {
    fieldEWDFECIDN.setString(newvalue);
  }

  /**
  * Get value of field EWDFECIDN as a String.
  */
  public String getEWDFECIDN()
  {
    return fieldEWDFECIDN.getString();
  }

  /**
  * Set field EWDNOMBRE using a String value.
  */
  public void setEWDNOMBRE(String newvalue)
  {
    fieldEWDNOMBRE.setString(newvalue);
  }

  /**
  * Get value of field EWDNOMBRE as a String.
  */
  public String getEWDNOMBRE()
  {
    return fieldEWDNOMBRE.getString();
  }

  /**
  * Set field EWDFECTDO using a String value.
  */
  public void setEWDFECTDO(String newvalue)
  {
    fieldEWDFECTDO.setString(newvalue);
  }

  /**
  * Get value of field EWDFECTDO as a String.
  */
  public String getEWDFECTDO()
  {
    return fieldEWDFECTDO.getString();
  }

  /**
  * Set numeric field EWDFECTDO using a BigDecimal value.
  */
  public void setEWDFECTDO(BigDecimal newvalue)
  {
    fieldEWDFECTDO.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field EWDFECTDO as a BigDecimal.
  */
  public BigDecimal getBigDecimalEWDFECTDO()
  {
    return fieldEWDFECTDO.getBigDecimal();
  }

  /**
  * Set field EWDFECCCY using a String value.
  */
  public void setEWDFECCCY(String newvalue)
  {
    fieldEWDFECCCY.setString(newvalue);
  }

  /**
  * Get value of field EWDFECCCY as a String.
  */
  public String getEWDFECCCY()
  {
    return fieldEWDFECCCY.getString();
  }

  /**
  * Set field EWDFECMMO using a String value.
  */
  public void setEWDFECMMO(String newvalue)
  {
    fieldEWDFECMMO.setString(newvalue);
  }

  /**
  * Get value of field EWDFECMMO as a String.
  */
  public String getEWDFECMMO()
  {
    return fieldEWDFECMMO.getString();
  }

  /**
  * Set numeric field EWDFECMMO using a BigDecimal value.
  */
  public void setEWDFECMMO(BigDecimal newvalue)
  {
    fieldEWDFECMMO.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field EWDFECMMO as a BigDecimal.
  */
  public BigDecimal getBigDecimalEWDFECMMO()
  {
    return fieldEWDFECMMO.getBigDecimal();
  }

  /**
  * Set field EWDFECPIS using a String value.
  */
  public void setEWDFECPIS(String newvalue)
  {
    fieldEWDFECPIS.setString(newvalue);
  }

  /**
  * Get value of field EWDFECPIS as a String.
  */
  public String getEWDFECPIS()
  {
    return fieldEWDFECPIS.getString();
  }

  /**
  * Set field EWDOPE using a String value.
  */
  public void setEWDOPE(String newvalue)
  {
    fieldEWDOPE.setString(newvalue);
  }

  /**
  * Get value of field EWDOPE as a String.
  */
  public String getEWDOPE()
  {
    return fieldEWDOPE.getString();
  }

}
