package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from EDL055701 physical file definition.
* 
* File level identifier is 1180518113814.
* Record format level identifier is 4F943AC6FE973.
*/

public class EDL055701Message extends MessageRecord
{
  final static String fldnames[] = {
                                     "H01USERID",
                                     "H01PROGRM",
                                     "H01TIMSYS",
                                     "H01SCRCOD",
                                     "H01OPECOD",
                                     "H01FLGMAS",
                                     "H01FLGWK1",
                                     "H01FLGWK2",
                                     "H01FLGWK3",
                                     "E01EXITYP",
                                     "E01EXIPRO",
                                     "E01EXICUN",
                                     "E01EXIACC",
                                     "E01EXIMIN",
                                     "E01EXIMAX",
                                     "E01EXITRC",
                                     "E01EXITRM",
                                     "E01EXITRX",
                                     "E01EXIDMX",
                                     "E01EXIPOR",
                                     "E01EXIFL1",
                                     "E01EXIFL2",
                                     "E01EXIODM",
                                     "E01EXIODD",
                                     "E01EXIODY",
                                     "E01EXISTS",
                                     "E01EXIDSC",
                                     "E01EXIOPE"
                                   };
  final static String tnames[] = {
                                   "H01USERID",
                                   "H01PROGRM",
                                   "H01TIMSYS",
                                   "H01SCRCOD",
                                   "H01OPECOD",
                                   "H01FLGMAS",
                                   "H01FLGWK1",
                                   "H01FLGWK2",
                                   "H01FLGWK3",
                                   "E01EXITYP",
                                   "E01EXIPRO",
                                   "E01EXICUN",
                                   "E01EXIACC",
                                   "E01EXIMIN",
                                   "E01EXIMAX",
                                   "E01EXITRC",
                                   "E01EXITRM",
                                   "E01EXITRX",
                                   "E01EXIDMX",
                                   "E01EXIPOR",
                                   "E01EXIFL1",
                                   "E01EXIFL2",
                                   "E01EXIODM",
                                   "E01EXIODD",
                                   "E01EXIODY",
                                   "E01EXISTS",
                                   "E01EXIDSC",
                                   "E01EXIOPE"
                                 };
  final static String fid = "1180518113814";
  final static String rid = "4F943AC6FE973";
  final static String fmtname = "EDL055701";
  final int FIELDCOUNT = 28;
  private static Hashtable tlookup = new Hashtable();
  private CharacterField fieldH01USERID = null;
  private CharacterField fieldH01PROGRM = null;
  private CharacterField fieldH01TIMSYS = null;
  private CharacterField fieldH01SCRCOD = null;
  private CharacterField fieldH01OPECOD = null;
  private CharacterField fieldH01FLGMAS = null;
  private CharacterField fieldH01FLGWK1 = null;
  private CharacterField fieldH01FLGWK2 = null;
  private CharacterField fieldH01FLGWK3 = null;
  private CharacterField fieldE01EXITYP = null;
  private CharacterField fieldE01EXIPRO = null;
  private DecimalField fieldE01EXICUN = null;
  private DecimalField fieldE01EXIACC = null;
  private DecimalField fieldE01EXIMIN = null;
  private DecimalField fieldE01EXIMAX = null;
  private CharacterField fieldE01EXITRC = null;
  private DecimalField fieldE01EXITRM = null;
  private DecimalField fieldE01EXITRX = null;
  private DecimalField fieldE01EXIDMX = null;
  private DecimalField fieldE01EXIPOR = null;
  private CharacterField fieldE01EXIFL1 = null;
  private CharacterField fieldE01EXIFL2 = null;
  private DecimalField fieldE01EXIODM = null;
  private DecimalField fieldE01EXIODD = null;
  private DecimalField fieldE01EXIODY = null;
  private CharacterField fieldE01EXISTS = null;
  private CharacterField fieldE01EXIDSC = null;
  private CharacterField fieldE01EXIOPE = null;

  /**
  * Constructor for EDL055701Message.
  */
  public EDL055701Message()
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
    recordsize = 188;
    fileid = fid;
    recordid = rid;
    message = new byte[getByteLength()];
    formatname = fmtname;
    fieldnames = fldnames;
    tagnames = tnames;
    fields = new MessageField[FIELDCOUNT];

    fields[0] = fieldH01USERID =
    new CharacterField(message, HEADERSIZE + 0, 10, "H01USERID");
    fields[1] = fieldH01PROGRM =
    new CharacterField(message, HEADERSIZE + 10, 10, "H01PROGRM");
    fields[2] = fieldH01TIMSYS =
    new CharacterField(message, HEADERSIZE + 20, 12, "H01TIMSYS");
    fields[3] = fieldH01SCRCOD =
    new CharacterField(message, HEADERSIZE + 32, 2, "H01SCRCOD");
    fields[4] = fieldH01OPECOD =
    new CharacterField(message, HEADERSIZE + 34, 4, "H01OPECOD");
    fields[5] = fieldH01FLGMAS =
    new CharacterField(message, HEADERSIZE + 38, 1, "H01FLGMAS");
    fields[6] = fieldH01FLGWK1 =
    new CharacterField(message, HEADERSIZE + 39, 1, "H01FLGWK1");
    fields[7] = fieldH01FLGWK2 =
    new CharacterField(message, HEADERSIZE + 40, 1, "H01FLGWK2");
    fields[8] = fieldH01FLGWK3 =
    new CharacterField(message, HEADERSIZE + 41, 1, "H01FLGWK3");
    fields[9] = fieldE01EXITYP =
    new CharacterField(message, HEADERSIZE + 42, 2, "E01EXITYP");
    fields[10] = fieldE01EXIPRO =
    new CharacterField(message, HEADERSIZE + 44, 4, "E01EXIPRO");
    fields[11] = fieldE01EXICUN =
    new DecimalField(message, HEADERSIZE + 48, 10, 0, "E01EXICUN");
    fields[12] = fieldE01EXIACC =
    new DecimalField(message, HEADERSIZE + 58, 13, 0, "E01EXIACC");
    fields[13] = fieldE01EXIMIN =
    new DecimalField(message, HEADERSIZE + 71, 15, 2, "E01EXIMIN");
    fields[14] = fieldE01EXIMAX =
    new DecimalField(message, HEADERSIZE + 86, 15, 2, "E01EXIMAX");
    fields[15] = fieldE01EXITRC =
    new CharacterField(message, HEADERSIZE + 101, 1, "E01EXITRC");
    fields[16] = fieldE01EXITRM =
    new DecimalField(message, HEADERSIZE + 102, 6, 0, "E01EXITRM");
    fields[17] = fieldE01EXITRX =
    new DecimalField(message, HEADERSIZE + 108, 6, 0, "E01EXITRX");
    fields[18] = fieldE01EXIDMX =
    new DecimalField(message, HEADERSIZE + 114, 6, 0, "E01EXIDMX");
    fields[19] = fieldE01EXIPOR =
    new DecimalField(message, HEADERSIZE + 120, 8, 3, "E01EXIPOR");
    fields[20] = fieldE01EXIFL1 =
    new CharacterField(message, HEADERSIZE + 128, 1, "E01EXIFL1");
    fields[21] = fieldE01EXIFL2 =
    new CharacterField(message, HEADERSIZE + 129, 1, "E01EXIFL2");
    fields[22] = fieldE01EXIODM =
    new DecimalField(message, HEADERSIZE + 130, 3, 0, "E01EXIODM");
    fields[23] = fieldE01EXIODD =
    new DecimalField(message, HEADERSIZE + 133, 3, 0, "E01EXIODD");
    fields[24] = fieldE01EXIODY =
    new DecimalField(message, HEADERSIZE + 136, 5, 0, "E01EXIODY");
    fields[25] = fieldE01EXISTS =
    new CharacterField(message, HEADERSIZE + 141, 1, "E01EXISTS");
    fields[26] = fieldE01EXIDSC =
    new CharacterField(message, HEADERSIZE + 142, 45, "E01EXIDSC");
    fields[27] = fieldE01EXIOPE =
    new CharacterField(message, HEADERSIZE + 187, 1, "E01EXIOPE");

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
  * Set field H01USERID using a String value.
  */
  public void setH01USERID(String newvalue)
  {
    fieldH01USERID.setString(newvalue);
  }

  /**
  * Get value of field H01USERID as a String.
  */
  public String getH01USERID()
  {
    return fieldH01USERID.getString();
  }

  /**
  * Set field H01PROGRM using a String value.
  */
  public void setH01PROGRM(String newvalue)
  {
    fieldH01PROGRM.setString(newvalue);
  }

  /**
  * Get value of field H01PROGRM as a String.
  */
  public String getH01PROGRM()
  {
    return fieldH01PROGRM.getString();
  }

  /**
  * Set field H01TIMSYS using a String value.
  */
  public void setH01TIMSYS(String newvalue)
  {
    fieldH01TIMSYS.setString(newvalue);
  }

  /**
  * Get value of field H01TIMSYS as a String.
  */
  public String getH01TIMSYS()
  {
    return fieldH01TIMSYS.getString();
  }

  /**
  * Set field H01SCRCOD using a String value.
  */
  public void setH01SCRCOD(String newvalue)
  {
    fieldH01SCRCOD.setString(newvalue);
  }

  /**
  * Get value of field H01SCRCOD as a String.
  */
  public String getH01SCRCOD()
  {
    return fieldH01SCRCOD.getString();
  }

  /**
  * Set field H01OPECOD using a String value.
  */
  public void setH01OPECOD(String newvalue)
  {
    fieldH01OPECOD.setString(newvalue);
  }

  /**
  * Get value of field H01OPECOD as a String.
  */
  public String getH01OPECOD()
  {
    return fieldH01OPECOD.getString();
  }

  /**
  * Set field H01FLGMAS using a String value.
  */
  public void setH01FLGMAS(String newvalue)
  {
    fieldH01FLGMAS.setString(newvalue);
  }

  /**
  * Get value of field H01FLGMAS as a String.
  */
  public String getH01FLGMAS()
  {
    return fieldH01FLGMAS.getString();
  }

  /**
  * Set field H01FLGWK1 using a String value.
  */
  public void setH01FLGWK1(String newvalue)
  {
    fieldH01FLGWK1.setString(newvalue);
  }

  /**
  * Get value of field H01FLGWK1 as a String.
  */
  public String getH01FLGWK1()
  {
    return fieldH01FLGWK1.getString();
  }

  /**
  * Set field H01FLGWK2 using a String value.
  */
  public void setH01FLGWK2(String newvalue)
  {
    fieldH01FLGWK2.setString(newvalue);
  }

  /**
  * Get value of field H01FLGWK2 as a String.
  */
  public String getH01FLGWK2()
  {
    return fieldH01FLGWK2.getString();
  }

  /**
  * Set field H01FLGWK3 using a String value.
  */
  public void setH01FLGWK3(String newvalue)
  {
    fieldH01FLGWK3.setString(newvalue);
  }

  /**
  * Get value of field H01FLGWK3 as a String.
  */
  public String getH01FLGWK3()
  {
    return fieldH01FLGWK3.getString();
  }

  /**
  * Set field E01EXITYP using a String value.
  */
  public void setE01EXITYP(String newvalue)
  {
    fieldE01EXITYP.setString(newvalue);
  }

  /**
  * Get value of field E01EXITYP as a String.
  */
  public String getE01EXITYP()
  {
    return fieldE01EXITYP.getString();
  }

  /**
  * Set field E01EXIPRO using a String value.
  */
  public void setE01EXIPRO(String newvalue)
  {
    fieldE01EXIPRO.setString(newvalue);
  }

  /**
  * Get value of field E01EXIPRO as a String.
  */
  public String getE01EXIPRO()
  {
    return fieldE01EXIPRO.getString();
  }

  /**
  * Set field E01EXICUN using a String value.
  */
  public void setE01EXICUN(String newvalue)
  {
    fieldE01EXICUN.setString(newvalue);
  }

  /**
  * Get value of field E01EXICUN as a String.
  */
  public String getE01EXICUN()
  {
    return fieldE01EXICUN.getString();
  }

  /**
  * Set numeric field E01EXICUN using a BigDecimal value.
  */
  public void setE01EXICUN(BigDecimal newvalue)
  {
    fieldE01EXICUN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01EXICUN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01EXICUN()
  {
    return fieldE01EXICUN.getBigDecimal();
  }

  /**
  * Set field E01EXIACC using a String value.
  */
  public void setE01EXIACC(String newvalue)
  {
    fieldE01EXIACC.setString(newvalue);
  }

  /**
  * Get value of field E01EXIACC as a String.
  */
  public String getE01EXIACC()
  {
    return fieldE01EXIACC.getString();
  }

  /**
  * Set numeric field E01EXIACC using a BigDecimal value.
  */
  public void setE01EXIACC(BigDecimal newvalue)
  {
    fieldE01EXIACC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01EXIACC as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01EXIACC()
  {
    return fieldE01EXIACC.getBigDecimal();
  }

  /**
  * Set field E01EXIMIN using a String value.
  */
  public void setE01EXIMIN(String newvalue)
  {
    fieldE01EXIMIN.setString(newvalue);
  }

  /**
  * Get value of field E01EXIMIN as a String.
  */
  public String getE01EXIMIN()
  {
    return fieldE01EXIMIN.getString();
  }

  /**
  * Set numeric field E01EXIMIN using a BigDecimal value.
  */
  public void setE01EXIMIN(BigDecimal newvalue)
  {
    fieldE01EXIMIN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01EXIMIN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01EXIMIN()
  {
    return fieldE01EXIMIN.getBigDecimal();
  }

  /**
  * Set field E01EXIMAX using a String value.
  */
  public void setE01EXIMAX(String newvalue)
  {
    fieldE01EXIMAX.setString(newvalue);
  }

  /**
  * Get value of field E01EXIMAX as a String.
  */
  public String getE01EXIMAX()
  {
    return fieldE01EXIMAX.getString();
  }

  /**
  * Set numeric field E01EXIMAX using a BigDecimal value.
  */
  public void setE01EXIMAX(BigDecimal newvalue)
  {
    fieldE01EXIMAX.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01EXIMAX as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01EXIMAX()
  {
    return fieldE01EXIMAX.getBigDecimal();
  }

  /**
  * Set field E01EXITRC using a String value.
  */
  public void setE01EXITRC(String newvalue)
  {
    fieldE01EXITRC.setString(newvalue);
  }

  /**
  * Get value of field E01EXITRC as a String.
  */
  public String getE01EXITRC()
  {
    return fieldE01EXITRC.getString();
  }

  /**
  * Set field E01EXITRM using a String value.
  */
  public void setE01EXITRM(String newvalue)
  {
    fieldE01EXITRM.setString(newvalue);
  }

  /**
  * Get value of field E01EXITRM as a String.
  */
  public String getE01EXITRM()
  {
    return fieldE01EXITRM.getString();
  }

  /**
  * Set numeric field E01EXITRM using a BigDecimal value.
  */
  public void setE01EXITRM(BigDecimal newvalue)
  {
    fieldE01EXITRM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01EXITRM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01EXITRM()
  {
    return fieldE01EXITRM.getBigDecimal();
  }

  /**
  * Set field E01EXITRX using a String value.
  */
  public void setE01EXITRX(String newvalue)
  {
    fieldE01EXITRX.setString(newvalue);
  }

  /**
  * Get value of field E01EXITRX as a String.
  */
  public String getE01EXITRX()
  {
    return fieldE01EXITRX.getString();
  }

  /**
  * Set numeric field E01EXITRX using a BigDecimal value.
  */
  public void setE01EXITRX(BigDecimal newvalue)
  {
    fieldE01EXITRX.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01EXITRX as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01EXITRX()
  {
    return fieldE01EXITRX.getBigDecimal();
  }

  /**
  * Set field E01EXIDMX using a String value.
  */
  public void setE01EXIDMX(String newvalue)
  {
    fieldE01EXIDMX.setString(newvalue);
  }

  /**
  * Get value of field E01EXIDMX as a String.
  */
  public String getE01EXIDMX()
  {
    return fieldE01EXIDMX.getString();
  }

  /**
  * Set numeric field E01EXIDMX using a BigDecimal value.
  */
  public void setE01EXIDMX(BigDecimal newvalue)
  {
    fieldE01EXIDMX.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01EXIDMX as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01EXIDMX()
  {
    return fieldE01EXIDMX.getBigDecimal();
  }

  /**
  * Set field E01EXIPOR using a String value.
  */
  public void setE01EXIPOR(String newvalue)
  {
    fieldE01EXIPOR.setString(newvalue);
  }

  /**
  * Get value of field E01EXIPOR as a String.
  */
  public String getE01EXIPOR()
  {
    return fieldE01EXIPOR.getString();
  }

  /**
  * Set numeric field E01EXIPOR using a BigDecimal value.
  */
  public void setE01EXIPOR(BigDecimal newvalue)
  {
    fieldE01EXIPOR.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01EXIPOR as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01EXIPOR()
  {
    return fieldE01EXIPOR.getBigDecimal();
  }

  /**
  * Set field E01EXIFL1 using a String value.
  */
  public void setE01EXIFL1(String newvalue)
  {
    fieldE01EXIFL1.setString(newvalue);
  }

  /**
  * Get value of field E01EXIFL1 as a String.
  */
  public String getE01EXIFL1()
  {
    return fieldE01EXIFL1.getString();
  }

  /**
  * Set field E01EXIFL2 using a String value.
  */
  public void setE01EXIFL2(String newvalue)
  {
    fieldE01EXIFL2.setString(newvalue);
  }

  /**
  * Get value of field E01EXIFL2 as a String.
  */
  public String getE01EXIFL2()
  {
    return fieldE01EXIFL2.getString();
  }

  /**
  * Set field E01EXIODM using a String value.
  */
  public void setE01EXIODM(String newvalue)
  {
    fieldE01EXIODM.setString(newvalue);
  }

  /**
  * Get value of field E01EXIODM as a String.
  */
  public String getE01EXIODM()
  {
    return fieldE01EXIODM.getString();
  }

  /**
  * Set numeric field E01EXIODM using a BigDecimal value.
  */
  public void setE01EXIODM(BigDecimal newvalue)
  {
    fieldE01EXIODM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01EXIODM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01EXIODM()
  {
    return fieldE01EXIODM.getBigDecimal();
  }

  /**
  * Set field E01EXIODD using a String value.
  */
  public void setE01EXIODD(String newvalue)
  {
    fieldE01EXIODD.setString(newvalue);
  }

  /**
  * Get value of field E01EXIODD as a String.
  */
  public String getE01EXIODD()
  {
    return fieldE01EXIODD.getString();
  }

  /**
  * Set numeric field E01EXIODD using a BigDecimal value.
  */
  public void setE01EXIODD(BigDecimal newvalue)
  {
    fieldE01EXIODD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01EXIODD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01EXIODD()
  {
    return fieldE01EXIODD.getBigDecimal();
  }

  /**
  * Set field E01EXIODY using a String value.
  */
  public void setE01EXIODY(String newvalue)
  {
    fieldE01EXIODY.setString(newvalue);
  }

  /**
  * Get value of field E01EXIODY as a String.
  */
  public String getE01EXIODY()
  {
    return fieldE01EXIODY.getString();
  }

  /**
  * Set numeric field E01EXIODY using a BigDecimal value.
  */
  public void setE01EXIODY(BigDecimal newvalue)
  {
    fieldE01EXIODY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01EXIODY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01EXIODY()
  {
    return fieldE01EXIODY.getBigDecimal();
  }

  /**
  * Set field E01EXISTS using a String value.
  */
  public void setE01EXISTS(String newvalue)
  {
    fieldE01EXISTS.setString(newvalue);
  }

  /**
  * Get value of field E01EXISTS as a String.
  */
  public String getE01EXISTS()
  {
    return fieldE01EXISTS.getString();
  }

  /**
  * Set field E01EXIDSC using a String value.
  */
  public void setE01EXIDSC(String newvalue)
  {
    fieldE01EXIDSC.setString(newvalue);
  }

  /**
  * Get value of field E01EXIDSC as a String.
  */
  public String getE01EXIDSC()
  {
    return fieldE01EXIDSC.getString();
  }

  /**
  * Set field E01EXIOPE using a String value.
  */
  public void setE01EXIOPE(String newvalue)
  {
    fieldE01EXIOPE.setString(newvalue);
  }

  /**
  * Get value of field E01EXIOPE as a String.
  */
  public String getE01EXIOPE()
  {
    return fieldE01EXIOPE.getString();
  }

}
