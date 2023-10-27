package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from EWD035001 physical file definition.
* 
* File level identifier is 1130611113454.
* Record format level identifier is 392441CE8F00C.
*/

public class EWD035001Message extends MessageRecord
{
  final static String fldnames[] = {
                                     "EW1FECOPE",
                                     "EW1FECNPL",
                                     "EW1FECACC",
                                     "EW1FECIDN",
                                     "EW1NOMBRE",
                                     "EW1FECTDO",
                                     "EW1FECCCY",
                                     "EW1FECMMO",
                                     "EW1FECPIS",
                                     "EW1OPE"
                                   };
  final static String tnames[] = {
                                   "EW1FECOPE",
                                   "EW1FECNPL",
                                   "EW1FECACC",
                                   "EW1FECIDN",
                                   "EW1NOMBRE",
                                   "EW1FECTDO",
                                   "EW1FECCCY",
                                   "EW1FECMMO",
                                   "EW1FECPIS",
                                   "EW1OPE"
                                 };
  final static String fid = "1130611113454";
  final static String rid = "392441CE8F00C";
  final static String fmtname = "EWD035001";
  final int FIELDCOUNT = 10;
  private static Hashtable tlookup = new Hashtable();
  private CharacterField fieldEW1FECOPE = null;
  private DecimalField fieldEW1FECNPL = null;
  private DecimalField fieldEW1FECACC = null;
  private CharacterField fieldEW1FECIDN = null;
  private CharacterField fieldEW1NOMBRE = null;
  private DecimalField fieldEW1FECTDO = null;
  private CharacterField fieldEW1FECCCY = null;
  private DecimalField fieldEW1FECMMO = null;
  private CharacterField fieldEW1FECPIS = null;
  private CharacterField fieldEW1OPE = null;

  /**
  * Constructor for EWD035001Message.
  */
  public EWD035001Message()
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
    recordsize = 119;
    fileid = fid;
    recordid = rid;
    message = new byte[getByteLength()];
    formatname = fmtname;
    fieldnames = fldnames;
    tagnames = tnames;
    fields = new MessageField[FIELDCOUNT];

    fields[0] = fieldEW1FECOPE =
    new CharacterField(message, HEADERSIZE + 0, 2, "EW1FECOPE");
    fields[1] = fieldEW1FECNPL =
    new DecimalField(message, HEADERSIZE + 2, 7, 0, "EW1FECNPL");
    fields[2] = fieldEW1FECACC =
    new DecimalField(message, HEADERSIZE + 9, 13, 0, "EW1FECACC");
    fields[3] = fieldEW1FECIDN =
    new CharacterField(message, HEADERSIZE + 22, 25, "EW1FECIDN");
    fields[4] = fieldEW1NOMBRE =
    new CharacterField(message, HEADERSIZE + 47, 45, "EW1NOMBRE");
    fields[5] = fieldEW1FECTDO =
    new DecimalField(message, HEADERSIZE + 92, 2, 0, "EW1FECTDO");
    fields[6] = fieldEW1FECCCY =
    new CharacterField(message, HEADERSIZE + 94, 3, "EW1FECCCY");
    fields[7] = fieldEW1FECMMO =
    new DecimalField(message, HEADERSIZE + 97, 17, 2, "EW1FECMMO");
    fields[8] = fieldEW1FECPIS =
    new CharacterField(message, HEADERSIZE + 114, 4, "EW1FECPIS");
    fields[9] = fieldEW1OPE =
    new CharacterField(message, HEADERSIZE + 118, 1, "EW1OPE");

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
  * Set field EW1FECOPE using a String value.
  */
  public void setEW1FECOPE(String newvalue)
  {
    fieldEW1FECOPE.setString(newvalue);
  }

  /**
  * Get value of field EW1FECOPE as a String.
  */
  public String getEW1FECOPE()
  {
    return fieldEW1FECOPE.getString();
  }

  /**
  * Set field EW1FECNPL using a String value.
  */
  public void setEW1FECNPL(String newvalue)
  {
    fieldEW1FECNPL.setString(newvalue);
  }

  /**
  * Get value of field EW1FECNPL as a String.
  */
  public String getEW1FECNPL()
  {
    return fieldEW1FECNPL.getString();
  }

  /**
  * Set numeric field EW1FECNPL using a BigDecimal value.
  */
  public void setEW1FECNPL(BigDecimal newvalue)
  {
    fieldEW1FECNPL.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field EW1FECNPL as a BigDecimal.
  */
  public BigDecimal getBigDecimalEW1FECNPL()
  {
    return fieldEW1FECNPL.getBigDecimal();
  }

  /**
  * Set field EW1FECACC using a String value.
  */
  public void setEW1FECACC(String newvalue)
  {
    fieldEW1FECACC.setString(newvalue);
  }

  /**
  * Get value of field EW1FECACC as a String.
  */
  public String getEW1FECACC()
  {
    return fieldEW1FECACC.getString();
  }

  /**
  * Set numeric field EW1FECACC using a BigDecimal value.
  */
  public void setEW1FECACC(BigDecimal newvalue)
  {
    fieldEW1FECACC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field EW1FECACC as a BigDecimal.
  */
  public BigDecimal getBigDecimalEW1FECACC()
  {
    return fieldEW1FECACC.getBigDecimal();
  }

  /**
  * Set field EW1FECIDN using a String value.
  */
  public void setEW1FECIDN(String newvalue)
  {
    fieldEW1FECIDN.setString(newvalue);
  }

  /**
  * Get value of field EW1FECIDN as a String.
  */
  public String getEW1FECIDN()
  {
    return fieldEW1FECIDN.getString();
  }

  /**
  * Set field EW1NOMBRE using a String value.
  */
  public void setEW1NOMBRE(String newvalue)
  {
    fieldEW1NOMBRE.setString(newvalue);
  }

  /**
  * Get value of field EW1NOMBRE as a String.
  */
  public String getEW1NOMBRE()
  {
    return fieldEW1NOMBRE.getString();
  }

  /**
  * Set field EW1FECTDO using a String value.
  */
  public void setEW1FECTDO(String newvalue)
  {
    fieldEW1FECTDO.setString(newvalue);
  }

  /**
  * Get value of field EW1FECTDO as a String.
  */
  public String getEW1FECTDO()
  {
    return fieldEW1FECTDO.getString();
  }

  /**
  * Set numeric field EW1FECTDO using a BigDecimal value.
  */
  public void setEW1FECTDO(BigDecimal newvalue)
  {
    fieldEW1FECTDO.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field EW1FECTDO as a BigDecimal.
  */
  public BigDecimal getBigDecimalEW1FECTDO()
  {
    return fieldEW1FECTDO.getBigDecimal();
  }

  /**
  * Set field EW1FECCCY using a String value.
  */
  public void setEW1FECCCY(String newvalue)
  {
    fieldEW1FECCCY.setString(newvalue);
  }

  /**
  * Get value of field EW1FECCCY as a String.
  */
  public String getEW1FECCCY()
  {
    return fieldEW1FECCCY.getString();
  }

  /**
  * Set field EW1FECMMO using a String value.
  */
  public void setEW1FECMMO(String newvalue)
  {
    fieldEW1FECMMO.setString(newvalue);
  }

  /**
  * Get value of field EW1FECMMO as a String.
  */
  public String getEW1FECMMO()
  {
    return fieldEW1FECMMO.getString();
  }

  /**
  * Set numeric field EW1FECMMO using a BigDecimal value.
  */
  public void setEW1FECMMO(BigDecimal newvalue)
  {
    fieldEW1FECMMO.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field EW1FECMMO as a BigDecimal.
  */
  public BigDecimal getBigDecimalEW1FECMMO()
  {
    return fieldEW1FECMMO.getBigDecimal();
  }

  /**
  * Set field EW1FECPIS using a String value.
  */
  public void setEW1FECPIS(String newvalue)
  {
    fieldEW1FECPIS.setString(newvalue);
  }

  /**
  * Get value of field EW1FECPIS as a String.
  */
  public String getEW1FECPIS()
  {
    return fieldEW1FECPIS.getString();
  }

  /**
  * Set field EW1OPE using a String value.
  */
  public void setEW1OPE(String newvalue)
  {
    fieldEW1OPE.setString(newvalue);
  }

  /**
  * Get value of field EW1OPE as a String.
  */
  public String getEW1OPE()
  {
    return fieldEW1OPE.getString();
  }

}