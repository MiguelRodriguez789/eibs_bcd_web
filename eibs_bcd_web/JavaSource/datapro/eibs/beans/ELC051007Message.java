package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from ELC051007 physical file definition.
* 
* File level identifier is 1160711064419.
* Record format level identifier is 2344C6C806014.
*/

public class ELC051007Message extends MessageRecord
{
  final static String fldnames[] = {
                                     "H07USERID",
                                     "H07PROGRM",
                                     "H07TIMSYS",
                                     "H07SCRCOD",
                                     "H07OPECOD",
                                     "H07FLGMAS",
                                     "H07FLGWK1",
                                     "H07FLGWK2",
                                     "H07FLGWK3",
                                     "E07LCMACC",
                                     "E07LCMCUN",
                                     "E07CUSNA1",
                                     "E07LCMPRO",
                                     "E07LCMBNK",
                                     "E07LCMATY",
                                     "E07LCMTYP",
                                     "E07LCMD1M",
                                     "E07LCMD1D",
                                     "E07LCMD1Y",
                                     "E07LCMD2M",
                                     "E07LCMD2D",
                                     "E07LCMD2Y",
                                     "E07LCMD3M",
                                     "E07LCMD3D",
                                     "E07LCMD3Y",
                                     "E07LCMRCC",
                                     "E07LCMHCF"
                                   };
  final static String tnames[] = {
                                   "H07USERID",
                                   "H07PROGRM",
                                   "H07TIMSYS",
                                   "H07SCRCOD",
                                   "H07OPECOD",
                                   "H07FLGMAS",
                                   "H07FLGWK1",
                                   "H07FLGWK2",
                                   "H07FLGWK3",
                                   "E07LCMACC",
                                   "E07LCMCUN",
                                   "E07CUSNA1",
                                   "E07LCMPRO",
                                   "E07LCMBNK",
                                   "E07LCMATY",
                                   "E07LCMTYP",
                                   "E07LCMD1M",
                                   "E07LCMD1D",
                                   "E07LCMD1Y",
                                   "E07LCMD2M",
                                   "E07LCMD2D",
                                   "E07LCMD2Y",
                                   "E07LCMD3M",
                                   "E07LCMD3D",
                                   "E07LCMD3Y",
                                   "E07LCMRCC",
                                   "E07LCMHCF"
                                 };
  final static String fid = "1160711064419";
  final static String rid = "2344C6C806014";
  final static String fmtname = "ELC051007";
  final int FIELDCOUNT = 27;
  private static Hashtable tlookup = new Hashtable();
  private CharacterField fieldH07USERID = null;
  private CharacterField fieldH07PROGRM = null;
  private CharacterField fieldH07TIMSYS = null;
  private CharacterField fieldH07SCRCOD = null;
  private CharacterField fieldH07OPECOD = null;
  private CharacterField fieldH07FLGMAS = null;
  private CharacterField fieldH07FLGWK1 = null;
  private CharacterField fieldH07FLGWK2 = null;
  private CharacterField fieldH07FLGWK3 = null;
  private DecimalField fieldE07LCMACC = null;
  private DecimalField fieldE07LCMCUN = null;
  private CharacterField fieldE07CUSNA1 = null;
  private CharacterField fieldE07LCMPRO = null;
  private CharacterField fieldE07LCMBNK = null;
  private CharacterField fieldE07LCMATY = null;
  private CharacterField fieldE07LCMTYP = null;
  private DecimalField fieldE07LCMD1M = null;
  private DecimalField fieldE07LCMD1D = null;
  private DecimalField fieldE07LCMD1Y = null;
  private DecimalField fieldE07LCMD2M = null;
  private DecimalField fieldE07LCMD2D = null;
  private DecimalField fieldE07LCMD2Y = null;
  private DecimalField fieldE07LCMD3M = null;
  private DecimalField fieldE07LCMD3D = null;
  private DecimalField fieldE07LCMD3Y = null;
  private CharacterField fieldE07LCMRCC = null;
  private CharacterField fieldE07LCMHCF = null;

  /**
  * Constructor for ELC051007Message.
  */
  public ELC051007Message()
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
    recordsize = 173;
    fileid = fid;
    recordid = rid;
    message = new byte[getByteLength()];
    formatname = fmtname;
    fieldnames = fldnames;
    tagnames = tnames;
    fields = new MessageField[FIELDCOUNT];

    fields[0] = fieldH07USERID =
    new CharacterField(message, HEADERSIZE + 0, 10, "H07USERID");
    fields[1] = fieldH07PROGRM =
    new CharacterField(message, HEADERSIZE + 10, 10, "H07PROGRM");
    fields[2] = fieldH07TIMSYS =
    new CharacterField(message, HEADERSIZE + 20, 12, "H07TIMSYS");
    fields[3] = fieldH07SCRCOD =
    new CharacterField(message, HEADERSIZE + 32, 2, "H07SCRCOD");
    fields[4] = fieldH07OPECOD =
    new CharacterField(message, HEADERSIZE + 34, 4, "H07OPECOD");
    fields[5] = fieldH07FLGMAS =
    new CharacterField(message, HEADERSIZE + 38, 1, "H07FLGMAS");
    fields[6] = fieldH07FLGWK1 =
    new CharacterField(message, HEADERSIZE + 39, 1, "H07FLGWK1");
    fields[7] = fieldH07FLGWK2 =
    new CharacterField(message, HEADERSIZE + 40, 1, "H07FLGWK2");
    fields[8] = fieldH07FLGWK3 =
    new CharacterField(message, HEADERSIZE + 41, 1, "H07FLGWK3");
    fields[9] = fieldE07LCMACC =
    new DecimalField(message, HEADERSIZE + 42, 13, 0, "E07LCMACC");
    fields[10] = fieldE07LCMCUN =
    new DecimalField(message, HEADERSIZE + 55, 10, 0, "E07LCMCUN");
    fields[11] = fieldE07CUSNA1 =
    new CharacterField(message, HEADERSIZE + 65, 60, "E07CUSNA1");
    fields[12] = fieldE07LCMPRO =
    new CharacterField(message, HEADERSIZE + 125, 4, "E07LCMPRO");
    fields[13] = fieldE07LCMBNK =
    new CharacterField(message, HEADERSIZE + 129, 2, "E07LCMBNK");
    fields[14] = fieldE07LCMATY =
    new CharacterField(message, HEADERSIZE + 131, 4, "E07LCMATY");
    fields[15] = fieldE07LCMTYP =
    new CharacterField(message, HEADERSIZE + 135, 1, "E07LCMTYP");
    fields[16] = fieldE07LCMD1M =
    new DecimalField(message, HEADERSIZE + 136, 3, 0, "E07LCMD1M");
    fields[17] = fieldE07LCMD1D =
    new DecimalField(message, HEADERSIZE + 139, 3, 0, "E07LCMD1D");
    fields[18] = fieldE07LCMD1Y =
    new DecimalField(message, HEADERSIZE + 142, 5, 0, "E07LCMD1Y");
    fields[19] = fieldE07LCMD2M =
    new DecimalField(message, HEADERSIZE + 147, 3, 0, "E07LCMD2M");
    fields[20] = fieldE07LCMD2D =
    new DecimalField(message, HEADERSIZE + 150, 3, 0, "E07LCMD2D");
    fields[21] = fieldE07LCMD2Y =
    new DecimalField(message, HEADERSIZE + 153, 5, 0, "E07LCMD2Y");
    fields[22] = fieldE07LCMD3M =
    new DecimalField(message, HEADERSIZE + 158, 3, 0, "E07LCMD3M");
    fields[23] = fieldE07LCMD3D =
    new DecimalField(message, HEADERSIZE + 161, 3, 0, "E07LCMD3D");
    fields[24] = fieldE07LCMD3Y =
    new DecimalField(message, HEADERSIZE + 164, 5, 0, "E07LCMD3Y");
    fields[25] = fieldE07LCMRCC =
    new CharacterField(message, HEADERSIZE + 169, 3, "E07LCMRCC");
    fields[26] = fieldE07LCMHCF =
    new CharacterField(message, HEADERSIZE + 172, 1, "E07LCMHCF");

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
  * Set field H07USERID using a String value.
  */
  public void setH07USERID(String newvalue)
  {
    fieldH07USERID.setString(newvalue);
  }

  /**
  * Get value of field H07USERID as a String.
  */
  public String getH07USERID()
  {
    return fieldH07USERID.getString();
  }

  /**
  * Set field H07PROGRM using a String value.
  */
  public void setH07PROGRM(String newvalue)
  {
    fieldH07PROGRM.setString(newvalue);
  }

  /**
  * Get value of field H07PROGRM as a String.
  */
  public String getH07PROGRM()
  {
    return fieldH07PROGRM.getString();
  }

  /**
  * Set field H07TIMSYS using a String value.
  */
  public void setH07TIMSYS(String newvalue)
  {
    fieldH07TIMSYS.setString(newvalue);
  }

  /**
  * Get value of field H07TIMSYS as a String.
  */
  public String getH07TIMSYS()
  {
    return fieldH07TIMSYS.getString();
  }

  /**
  * Set field H07SCRCOD using a String value.
  */
  public void setH07SCRCOD(String newvalue)
  {
    fieldH07SCRCOD.setString(newvalue);
  }

  /**
  * Get value of field H07SCRCOD as a String.
  */
  public String getH07SCRCOD()
  {
    return fieldH07SCRCOD.getString();
  }

  /**
  * Set field H07OPECOD using a String value.
  */
  public void setH07OPECOD(String newvalue)
  {
    fieldH07OPECOD.setString(newvalue);
  }

  /**
  * Get value of field H07OPECOD as a String.
  */
  public String getH07OPECOD()
  {
    return fieldH07OPECOD.getString();
  }

  /**
  * Set field H07FLGMAS using a String value.
  */
  public void setH07FLGMAS(String newvalue)
  {
    fieldH07FLGMAS.setString(newvalue);
  }

  /**
  * Get value of field H07FLGMAS as a String.
  */
  public String getH07FLGMAS()
  {
    return fieldH07FLGMAS.getString();
  }

  /**
  * Set field H07FLGWK1 using a String value.
  */
  public void setH07FLGWK1(String newvalue)
  {
    fieldH07FLGWK1.setString(newvalue);
  }

  /**
  * Get value of field H07FLGWK1 as a String.
  */
  public String getH07FLGWK1()
  {
    return fieldH07FLGWK1.getString();
  }

  /**
  * Set field H07FLGWK2 using a String value.
  */
  public void setH07FLGWK2(String newvalue)
  {
    fieldH07FLGWK2.setString(newvalue);
  }

  /**
  * Get value of field H07FLGWK2 as a String.
  */
  public String getH07FLGWK2()
  {
    return fieldH07FLGWK2.getString();
  }

  /**
  * Set field H07FLGWK3 using a String value.
  */
  public void setH07FLGWK3(String newvalue)
  {
    fieldH07FLGWK3.setString(newvalue);
  }

  /**
  * Get value of field H07FLGWK3 as a String.
  */
  public String getH07FLGWK3()
  {
    return fieldH07FLGWK3.getString();
  }

  /**
  * Set field E07LCMACC using a String value.
  */
  public void setE07LCMACC(String newvalue)
  {
    fieldE07LCMACC.setString(newvalue);
  }

  /**
  * Get value of field E07LCMACC as a String.
  */
  public String getE07LCMACC()
  {
    return fieldE07LCMACC.getString();
  }

  /**
  * Set numeric field E07LCMACC using a BigDecimal value.
  */
  public void setE07LCMACC(BigDecimal newvalue)
  {
    fieldE07LCMACC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E07LCMACC as a BigDecimal.
  */
  public BigDecimal getBigDecimalE07LCMACC()
  {
    return fieldE07LCMACC.getBigDecimal();
  }

  /**
  * Set field E07LCMCUN using a String value.
  */
  public void setE07LCMCUN(String newvalue)
  {
    fieldE07LCMCUN.setString(newvalue);
  }

  /**
  * Get value of field E07LCMCUN as a String.
  */
  public String getE07LCMCUN()
  {
    return fieldE07LCMCUN.getString();
  }

  /**
  * Set numeric field E07LCMCUN using a BigDecimal value.
  */
  public void setE07LCMCUN(BigDecimal newvalue)
  {
    fieldE07LCMCUN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E07LCMCUN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE07LCMCUN()
  {
    return fieldE07LCMCUN.getBigDecimal();
  }

  /**
  * Set field E07CUSNA1 using a String value.
  */
  public void setE07CUSNA1(String newvalue)
  {
    fieldE07CUSNA1.setString(newvalue);
  }

  /**
  * Get value of field E07CUSNA1 as a String.
  */
  public String getE07CUSNA1()
  {
    return fieldE07CUSNA1.getString();
  }

  /**
  * Set field E07LCMPRO using a String value.
  */
  public void setE07LCMPRO(String newvalue)
  {
    fieldE07LCMPRO.setString(newvalue);
  }

  /**
  * Get value of field E07LCMPRO as a String.
  */
  public String getE07LCMPRO()
  {
    return fieldE07LCMPRO.getString();
  }

  /**
  * Set field E07LCMBNK using a String value.
  */
  public void setE07LCMBNK(String newvalue)
  {
    fieldE07LCMBNK.setString(newvalue);
  }

  /**
  * Get value of field E07LCMBNK as a String.
  */
  public String getE07LCMBNK()
  {
    return fieldE07LCMBNK.getString();
  }

  /**
  * Set field E07LCMATY using a String value.
  */
  public void setE07LCMATY(String newvalue)
  {
    fieldE07LCMATY.setString(newvalue);
  }

  /**
  * Get value of field E07LCMATY as a String.
  */
  public String getE07LCMATY()
  {
    return fieldE07LCMATY.getString();
  }

  /**
  * Set field E07LCMTYP using a String value.
  */
  public void setE07LCMTYP(String newvalue)
  {
    fieldE07LCMTYP.setString(newvalue);
  }

  /**
  * Get value of field E07LCMTYP as a String.
  */
  public String getE07LCMTYP()
  {
    return fieldE07LCMTYP.getString();
  }

  /**
  * Set field E07LCMD1M using a String value.
  */
  public void setE07LCMD1M(String newvalue)
  {
    fieldE07LCMD1M.setString(newvalue);
  }

  /**
  * Get value of field E07LCMD1M as a String.
  */
  public String getE07LCMD1M()
  {
    return fieldE07LCMD1M.getString();
  }

  /**
  * Set numeric field E07LCMD1M using a BigDecimal value.
  */
  public void setE07LCMD1M(BigDecimal newvalue)
  {
    fieldE07LCMD1M.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E07LCMD1M as a BigDecimal.
  */
  public BigDecimal getBigDecimalE07LCMD1M()
  {
    return fieldE07LCMD1M.getBigDecimal();
  }

  /**
  * Set field E07LCMD1D using a String value.
  */
  public void setE07LCMD1D(String newvalue)
  {
    fieldE07LCMD1D.setString(newvalue);
  }

  /**
  * Get value of field E07LCMD1D as a String.
  */
  public String getE07LCMD1D()
  {
    return fieldE07LCMD1D.getString();
  }

  /**
  * Set numeric field E07LCMD1D using a BigDecimal value.
  */
  public void setE07LCMD1D(BigDecimal newvalue)
  {
    fieldE07LCMD1D.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E07LCMD1D as a BigDecimal.
  */
  public BigDecimal getBigDecimalE07LCMD1D()
  {
    return fieldE07LCMD1D.getBigDecimal();
  }

  /**
  * Set field E07LCMD1Y using a String value.
  */
  public void setE07LCMD1Y(String newvalue)
  {
    fieldE07LCMD1Y.setString(newvalue);
  }

  /**
  * Get value of field E07LCMD1Y as a String.
  */
  public String getE07LCMD1Y()
  {
    return fieldE07LCMD1Y.getString();
  }

  /**
  * Set numeric field E07LCMD1Y using a BigDecimal value.
  */
  public void setE07LCMD1Y(BigDecimal newvalue)
  {
    fieldE07LCMD1Y.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E07LCMD1Y as a BigDecimal.
  */
  public BigDecimal getBigDecimalE07LCMD1Y()
  {
    return fieldE07LCMD1Y.getBigDecimal();
  }

  /**
  * Set field E07LCMD2M using a String value.
  */
  public void setE07LCMD2M(String newvalue)
  {
    fieldE07LCMD2M.setString(newvalue);
  }

  /**
  * Get value of field E07LCMD2M as a String.
  */
  public String getE07LCMD2M()
  {
    return fieldE07LCMD2M.getString();
  }

  /**
  * Set numeric field E07LCMD2M using a BigDecimal value.
  */
  public void setE07LCMD2M(BigDecimal newvalue)
  {
    fieldE07LCMD2M.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E07LCMD2M as a BigDecimal.
  */
  public BigDecimal getBigDecimalE07LCMD2M()
  {
    return fieldE07LCMD2M.getBigDecimal();
  }

  /**
  * Set field E07LCMD2D using a String value.
  */
  public void setE07LCMD2D(String newvalue)
  {
    fieldE07LCMD2D.setString(newvalue);
  }

  /**
  * Get value of field E07LCMD2D as a String.
  */
  public String getE07LCMD2D()
  {
    return fieldE07LCMD2D.getString();
  }

  /**
  * Set numeric field E07LCMD2D using a BigDecimal value.
  */
  public void setE07LCMD2D(BigDecimal newvalue)
  {
    fieldE07LCMD2D.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E07LCMD2D as a BigDecimal.
  */
  public BigDecimal getBigDecimalE07LCMD2D()
  {
    return fieldE07LCMD2D.getBigDecimal();
  }

  /**
  * Set field E07LCMD2Y using a String value.
  */
  public void setE07LCMD2Y(String newvalue)
  {
    fieldE07LCMD2Y.setString(newvalue);
  }

  /**
  * Get value of field E07LCMD2Y as a String.
  */
  public String getE07LCMD2Y()
  {
    return fieldE07LCMD2Y.getString();
  }

  /**
  * Set numeric field E07LCMD2Y using a BigDecimal value.
  */
  public void setE07LCMD2Y(BigDecimal newvalue)
  {
    fieldE07LCMD2Y.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E07LCMD2Y as a BigDecimal.
  */
  public BigDecimal getBigDecimalE07LCMD2Y()
  {
    return fieldE07LCMD2Y.getBigDecimal();
  }

  /**
  * Set field E07LCMD3M using a String value.
  */
  public void setE07LCMD3M(String newvalue)
  {
    fieldE07LCMD3M.setString(newvalue);
  }

  /**
  * Get value of field E07LCMD3M as a String.
  */
  public String getE07LCMD3M()
  {
    return fieldE07LCMD3M.getString();
  }

  /**
  * Set numeric field E07LCMD3M using a BigDecimal value.
  */
  public void setE07LCMD3M(BigDecimal newvalue)
  {
    fieldE07LCMD3M.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E07LCMD3M as a BigDecimal.
  */
  public BigDecimal getBigDecimalE07LCMD3M()
  {
    return fieldE07LCMD3M.getBigDecimal();
  }

  /**
  * Set field E07LCMD3D using a String value.
  */
  public void setE07LCMD3D(String newvalue)
  {
    fieldE07LCMD3D.setString(newvalue);
  }

  /**
  * Get value of field E07LCMD3D as a String.
  */
  public String getE07LCMD3D()
  {
    return fieldE07LCMD3D.getString();
  }

  /**
  * Set numeric field E07LCMD3D using a BigDecimal value.
  */
  public void setE07LCMD3D(BigDecimal newvalue)
  {
    fieldE07LCMD3D.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E07LCMD3D as a BigDecimal.
  */
  public BigDecimal getBigDecimalE07LCMD3D()
  {
    return fieldE07LCMD3D.getBigDecimal();
  }

  /**
  * Set field E07LCMD3Y using a String value.
  */
  public void setE07LCMD3Y(String newvalue)
  {
    fieldE07LCMD3Y.setString(newvalue);
  }

  /**
  * Get value of field E07LCMD3Y as a String.
  */
  public String getE07LCMD3Y()
  {
    return fieldE07LCMD3Y.getString();
  }

  /**
  * Set numeric field E07LCMD3Y using a BigDecimal value.
  */
  public void setE07LCMD3Y(BigDecimal newvalue)
  {
    fieldE07LCMD3Y.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E07LCMD3Y as a BigDecimal.
  */
  public BigDecimal getBigDecimalE07LCMD3Y()
  {
    return fieldE07LCMD3Y.getBigDecimal();
  }

  /**
  * Set field E07LCMRCC using a String value.
  */
  public void setE07LCMRCC(String newvalue)
  {
    fieldE07LCMRCC.setString(newvalue);
  }

  /**
  * Get value of field E07LCMRCC as a String.
  */
  public String getE07LCMRCC()
  {
    return fieldE07LCMRCC.getString();
  }

  /**
  * Set field E07LCMHCF using a String value.
  */
  public void setE07LCMHCF(String newvalue)
  {
    fieldE07LCMHCF.setString(newvalue);
  }

  /**
  * Get value of field E07LCMHCF as a String.
  */
  public String getE07LCMHCF()
  {
    return fieldE07LCMHCF.getString();
  }

}
