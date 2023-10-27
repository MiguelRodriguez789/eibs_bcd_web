package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from ECD0001DZ physical file definition.
* 
* File level identifier is 1100921111218.
* Record format level identifier is 48E56D351B670.
*/

public class ECD0001DZMessage extends MessageRecord
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
                                     "E01CDRTYP",
                                     "E01CDRTPL",
                                     "E01CDRNPL",
                                     "E01CDRUSR",
                                     "E01CDRNUM",
                                     "E01CDRQTY",
                                     "E01CDRDAY",
                                     "E01CDRMON",
                                     "E01CDRYEA",
                                     "E01CDRTIM",
                                     "E01CDRSTS",
                                     "E01CDRSTD",
                                     "E01CDRBND",
                                     "E01CDRBRD",
                                     "E01CDRRUS",
                                     "E01CDRREQ",
                                     "E01CDRDAR",
                                     "E01CDRMOR",
                                     "E01CDRYER",
                                     "E01CDRTIR",
                                     "E01CDRVEN",
                                     "E01CDRNAM",
                                     "E01CDRMOX",
                                     "E01CDRYEX"
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
                                   "E01CDRTYP",
                                   "E01CDRTPL",
                                   "E01CDRNPL",
                                   "E01CDRUSR",
                                   "E01CDRNUM",
                                   "E01CDRQTY",
                                   "E01CDRDAY",
                                   "E01CDRMON",
                                   "E01CDRYEA",
                                   "E01CDRTIM",
                                   "E01CDRSTS",
                                   "E01CDRSTD",
                                   "E01CDRBND",
                                   "E01CDRBRD",
                                   "E01CDRRUS",
                                   "E01CDRREQ",
                                   "E01CDRDAR",
                                   "E01CDRMOR",
                                   "E01CDRYER",
                                   "E01CDRTIR",
                                   "E01CDRVEN",
                                   "E01CDRNAM",
                                   "E01CDRMOX",
                                   "E01CDRYEX"
                                 };
  final static String fid = "1100921111218";
  final static String rid = "48E56D351B670";
  final static String fmtname = "ECD0001DZ";
  final int FIELDCOUNT = 33;
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
  private CharacterField fieldE01CDRTYP = null;
  private CharacterField fieldE01CDRTPL = null;
  private CharacterField fieldE01CDRNPL = null;
  private CharacterField fieldE01CDRUSR = null;
  private DecimalField fieldE01CDRNUM = null;
  private DecimalField fieldE01CDRQTY = null;
  private DecimalField fieldE01CDRDAY = null;
  private DecimalField fieldE01CDRMON = null;
  private DecimalField fieldE01CDRYEA = null;
  private DecimalField fieldE01CDRTIM = null;
  private CharacterField fieldE01CDRSTS = null;
  private CharacterField fieldE01CDRSTD = null;
  private DecimalField fieldE01CDRBND = null;
  private DecimalField fieldE01CDRBRD = null;
  private CharacterField fieldE01CDRRUS = null;
  private DecimalField fieldE01CDRREQ = null;
  private DecimalField fieldE01CDRDAR = null;
  private DecimalField fieldE01CDRMOR = null;
  private DecimalField fieldE01CDRYER = null;
  private DecimalField fieldE01CDRTIR = null;
  private DecimalField fieldE01CDRVEN = null;
  private CharacterField fieldE01CDRNAM = null;
  private DecimalField fieldE01CDRMOX = null;
  private DecimalField fieldE01CDRYEX = null;

  /**
  * Constructor for ECD0001DZMessage.
  */
  public ECD0001DZMessage()
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
    recordsize = 287;
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
    fields[9] = fieldE01CDRTYP =
    new CharacterField(message, HEADERSIZE + 42, 1, "E01CDRTYP");
    fields[10] = fieldE01CDRTPL =
    new CharacterField(message, HEADERSIZE + 43, 2, "E01CDRTPL");
    fields[11] = fieldE01CDRNPL =
    new CharacterField(message, HEADERSIZE + 45, 45, "E01CDRNPL");
    fields[12] = fieldE01CDRUSR =
    new CharacterField(message, HEADERSIZE + 90, 10, "E01CDRUSR");
    fields[13] = fieldE01CDRNUM =
    new DecimalField(message, HEADERSIZE + 100, 13, 0, "E01CDRNUM");
    fields[14] = fieldE01CDRQTY =
    new DecimalField(message, HEADERSIZE + 113, 7, 0, "E01CDRQTY");
    fields[15] = fieldE01CDRDAY =
    new DecimalField(message, HEADERSIZE + 120, 3, 0, "E01CDRDAY");
    fields[16] = fieldE01CDRMON =
    new DecimalField(message, HEADERSIZE + 123, 3, 0, "E01CDRMON");
    fields[17] = fieldE01CDRYEA =
    new DecimalField(message, HEADERSIZE + 126, 3, 0, "E01CDRYEA");
    fields[18] = fieldE01CDRTIM =
    new DecimalField(message, HEADERSIZE + 129, 7, 0, "E01CDRTIM");
    fields[19] = fieldE01CDRSTS =
    new CharacterField(message, HEADERSIZE + 136, 4, "E01CDRSTS");
    fields[20] = fieldE01CDRSTD =
    new CharacterField(message, HEADERSIZE + 140, 45, "E01CDRSTD");
    fields[21] = fieldE01CDRBND =
    new DecimalField(message, HEADERSIZE + 185, 3, 0, "E01CDRBND");
    fields[22] = fieldE01CDRBRD =
    new DecimalField(message, HEADERSIZE + 188, 5, 0, "E01CDRBRD");
    fields[23] = fieldE01CDRRUS =
    new CharacterField(message, HEADERSIZE + 193, 10, "E01CDRRUS");
    fields[24] = fieldE01CDRREQ =
    new DecimalField(message, HEADERSIZE + 203, 7, 0, "E01CDRREQ");
    fields[25] = fieldE01CDRDAR =
    new DecimalField(message, HEADERSIZE + 210, 3, 0, "E01CDRDAR");
    fields[26] = fieldE01CDRMOR =
    new DecimalField(message, HEADERSIZE + 213, 3, 0, "E01CDRMOR");
    fields[27] = fieldE01CDRYER =
    new DecimalField(message, HEADERSIZE + 216, 3, 0, "E01CDRYER");
    fields[28] = fieldE01CDRTIR =
    new DecimalField(message, HEADERSIZE + 219, 7, 0, "E01CDRTIR");
    fields[29] = fieldE01CDRVEN =
    new DecimalField(message, HEADERSIZE + 226, 10, 0, "E01CDRVEN");
    fields[30] = fieldE01CDRNAM =
    new CharacterField(message, HEADERSIZE + 236, 45, "E01CDRNAM");
    fields[31] = fieldE01CDRMOX =
    new DecimalField(message, HEADERSIZE + 281, 3, 0, "E01CDRMOX");
    fields[32] = fieldE01CDRYEX =
    new DecimalField(message, HEADERSIZE + 284, 3, 0, "E01CDRYEX");

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
  * Set field E01CDRTYP using a String value.
  */
  public void setE01CDRTYP(String newvalue)
  {
    fieldE01CDRTYP.setString(newvalue);
  }

  /**
  * Get value of field E01CDRTYP as a String.
  */
  public String getE01CDRTYP()
  {
    return fieldE01CDRTYP.getString();
  }

  /**
  * Set field E01CDRTPL using a String value.
  */
  public void setE01CDRTPL(String newvalue)
  {
    fieldE01CDRTPL.setString(newvalue);
  }

  /**
  * Get value of field E01CDRTPL as a String.
  */
  public String getE01CDRTPL()
  {
    return fieldE01CDRTPL.getString();
  }

  /**
  * Set field E01CDRNPL using a String value.
  */
  public void setE01CDRNPL(String newvalue)
  {
    fieldE01CDRNPL.setString(newvalue);
  }

  /**
  * Get value of field E01CDRNPL as a String.
  */
  public String getE01CDRNPL()
  {
    return fieldE01CDRNPL.getString();
  }

  /**
  * Set field E01CDRUSR using a String value.
  */
  public void setE01CDRUSR(String newvalue)
  {
    fieldE01CDRUSR.setString(newvalue);
  }

  /**
  * Get value of field E01CDRUSR as a String.
  */
  public String getE01CDRUSR()
  {
    return fieldE01CDRUSR.getString();
  }

  /**
  * Set field E01CDRNUM using a String value.
  */
  public void setE01CDRNUM(String newvalue)
  {
    fieldE01CDRNUM.setString(newvalue);
  }

  /**
  * Get value of field E01CDRNUM as a String.
  */
  public String getE01CDRNUM()
  {
    return fieldE01CDRNUM.getString();
  }

  /**
  * Set numeric field E01CDRNUM using a BigDecimal value.
  */
  public void setE01CDRNUM(BigDecimal newvalue)
  {
    fieldE01CDRNUM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CDRNUM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CDRNUM()
  {
    return fieldE01CDRNUM.getBigDecimal();
  }

  /**
  * Set field E01CDRQTY using a String value.
  */
  public void setE01CDRQTY(String newvalue)
  {
    fieldE01CDRQTY.setString(newvalue);
  }

  /**
  * Get value of field E01CDRQTY as a String.
  */
  public String getE01CDRQTY()
  {
    return fieldE01CDRQTY.getString();
  }

  /**
  * Set numeric field E01CDRQTY using a BigDecimal value.
  */
  public void setE01CDRQTY(BigDecimal newvalue)
  {
    fieldE01CDRQTY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CDRQTY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CDRQTY()
  {
    return fieldE01CDRQTY.getBigDecimal();
  }

  /**
  * Set field E01CDRDAY using a String value.
  */
  public void setE01CDRDAY(String newvalue)
  {
    fieldE01CDRDAY.setString(newvalue);
  }

  /**
  * Get value of field E01CDRDAY as a String.
  */
  public String getE01CDRDAY()
  {
    return fieldE01CDRDAY.getString();
  }

  /**
  * Set numeric field E01CDRDAY using a BigDecimal value.
  */
  public void setE01CDRDAY(BigDecimal newvalue)
  {
    fieldE01CDRDAY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CDRDAY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CDRDAY()
  {
    return fieldE01CDRDAY.getBigDecimal();
  }

  /**
  * Set field E01CDRMON using a String value.
  */
  public void setE01CDRMON(String newvalue)
  {
    fieldE01CDRMON.setString(newvalue);
  }

  /**
  * Get value of field E01CDRMON as a String.
  */
  public String getE01CDRMON()
  {
    return fieldE01CDRMON.getString();
  }

  /**
  * Set numeric field E01CDRMON using a BigDecimal value.
  */
  public void setE01CDRMON(BigDecimal newvalue)
  {
    fieldE01CDRMON.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CDRMON as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CDRMON()
  {
    return fieldE01CDRMON.getBigDecimal();
  }

  /**
  * Set field E01CDRYEA using a String value.
  */
  public void setE01CDRYEA(String newvalue)
  {
    fieldE01CDRYEA.setString(newvalue);
  }

  /**
  * Get value of field E01CDRYEA as a String.
  */
  public String getE01CDRYEA()
  {
    return fieldE01CDRYEA.getString();
  }

  /**
  * Set numeric field E01CDRYEA using a BigDecimal value.
  */
  public void setE01CDRYEA(BigDecimal newvalue)
  {
    fieldE01CDRYEA.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CDRYEA as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CDRYEA()
  {
    return fieldE01CDRYEA.getBigDecimal();
  }

  /**
  * Set field E01CDRTIM using a String value.
  */
  public void setE01CDRTIM(String newvalue)
  {
    fieldE01CDRTIM.setString(newvalue);
  }

  /**
  * Get value of field E01CDRTIM as a String.
  */
  public String getE01CDRTIM()
  {
    return fieldE01CDRTIM.getString();
  }

  /**
  * Set numeric field E01CDRTIM using a BigDecimal value.
  */
  public void setE01CDRTIM(BigDecimal newvalue)
  {
    fieldE01CDRTIM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CDRTIM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CDRTIM()
  {
    return fieldE01CDRTIM.getBigDecimal();
  }

  /**
  * Set field E01CDRSTS using a String value.
  */
  public void setE01CDRSTS(String newvalue)
  {
    fieldE01CDRSTS.setString(newvalue);
  }

  /**
  * Get value of field E01CDRSTS as a String.
  */
  public String getE01CDRSTS()
  {
    return fieldE01CDRSTS.getString();
  }

  /**
  * Set field E01CDRSTD using a String value.
  */
  public void setE01CDRSTD(String newvalue)
  {
    fieldE01CDRSTD.setString(newvalue);
  }

  /**
  * Get value of field E01CDRSTD as a String.
  */
  public String getE01CDRSTD()
  {
    return fieldE01CDRSTD.getString();
  }

  /**
  * Set field E01CDRBND using a String value.
  */
  public void setE01CDRBND(String newvalue)
  {
    fieldE01CDRBND.setString(newvalue);
  }

  /**
  * Get value of field E01CDRBND as a String.
  */
  public String getE01CDRBND()
  {
    return fieldE01CDRBND.getString();
  }

  /**
  * Set numeric field E01CDRBND using a BigDecimal value.
  */
  public void setE01CDRBND(BigDecimal newvalue)
  {
    fieldE01CDRBND.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CDRBND as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CDRBND()
  {
    return fieldE01CDRBND.getBigDecimal();
  }

  /**
  * Set field E01CDRBRD using a String value.
  */
  public void setE01CDRBRD(String newvalue)
  {
    fieldE01CDRBRD.setString(newvalue);
  }

  /**
  * Get value of field E01CDRBRD as a String.
  */
  public String getE01CDRBRD()
  {
    return fieldE01CDRBRD.getString();
  }

  /**
  * Set numeric field E01CDRBRD using a BigDecimal value.
  */
  public void setE01CDRBRD(BigDecimal newvalue)
  {
    fieldE01CDRBRD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CDRBRD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CDRBRD()
  {
    return fieldE01CDRBRD.getBigDecimal();
  }

  /**
  * Set field E01CDRRUS using a String value.
  */
  public void setE01CDRRUS(String newvalue)
  {
    fieldE01CDRRUS.setString(newvalue);
  }

  /**
  * Get value of field E01CDRRUS as a String.
  */
  public String getE01CDRRUS()
  {
    return fieldE01CDRRUS.getString();
  }

  /**
  * Set field E01CDRREQ using a String value.
  */
  public void setE01CDRREQ(String newvalue)
  {
    fieldE01CDRREQ.setString(newvalue);
  }

  /**
  * Get value of field E01CDRREQ as a String.
  */
  public String getE01CDRREQ()
  {
    return fieldE01CDRREQ.getString();
  }

  /**
  * Set numeric field E01CDRREQ using a BigDecimal value.
  */
  public void setE01CDRREQ(BigDecimal newvalue)
  {
    fieldE01CDRREQ.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CDRREQ as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CDRREQ()
  {
    return fieldE01CDRREQ.getBigDecimal();
  }

  /**
  * Set field E01CDRDAR using a String value.
  */
  public void setE01CDRDAR(String newvalue)
  {
    fieldE01CDRDAR.setString(newvalue);
  }

  /**
  * Get value of field E01CDRDAR as a String.
  */
  public String getE01CDRDAR()
  {
    return fieldE01CDRDAR.getString();
  }

  /**
  * Set numeric field E01CDRDAR using a BigDecimal value.
  */
  public void setE01CDRDAR(BigDecimal newvalue)
  {
    fieldE01CDRDAR.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CDRDAR as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CDRDAR()
  {
    return fieldE01CDRDAR.getBigDecimal();
  }

  /**
  * Set field E01CDRMOR using a String value.
  */
  public void setE01CDRMOR(String newvalue)
  {
    fieldE01CDRMOR.setString(newvalue);
  }

  /**
  * Get value of field E01CDRMOR as a String.
  */
  public String getE01CDRMOR()
  {
    return fieldE01CDRMOR.getString();
  }

  /**
  * Set numeric field E01CDRMOR using a BigDecimal value.
  */
  public void setE01CDRMOR(BigDecimal newvalue)
  {
    fieldE01CDRMOR.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CDRMOR as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CDRMOR()
  {
    return fieldE01CDRMOR.getBigDecimal();
  }

  /**
  * Set field E01CDRYER using a String value.
  */
  public void setE01CDRYER(String newvalue)
  {
    fieldE01CDRYER.setString(newvalue);
  }

  /**
  * Get value of field E01CDRYER as a String.
  */
  public String getE01CDRYER()
  {
    return fieldE01CDRYER.getString();
  }

  /**
  * Set numeric field E01CDRYER using a BigDecimal value.
  */
  public void setE01CDRYER(BigDecimal newvalue)
  {
    fieldE01CDRYER.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CDRYER as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CDRYER()
  {
    return fieldE01CDRYER.getBigDecimal();
  }

  /**
  * Set field E01CDRTIR using a String value.
  */
  public void setE01CDRTIR(String newvalue)
  {
    fieldE01CDRTIR.setString(newvalue);
  }

  /**
  * Get value of field E01CDRTIR as a String.
  */
  public String getE01CDRTIR()
  {
    return fieldE01CDRTIR.getString();
  }

  /**
  * Set numeric field E01CDRTIR using a BigDecimal value.
  */
  public void setE01CDRTIR(BigDecimal newvalue)
  {
    fieldE01CDRTIR.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CDRTIR as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CDRTIR()
  {
    return fieldE01CDRTIR.getBigDecimal();
  }

  /**
  * Set field E01CDRVEN using a String value.
  */
  public void setE01CDRVEN(String newvalue)
  {
    fieldE01CDRVEN.setString(newvalue);
  }

  /**
  * Get value of field E01CDRVEN as a String.
  */
  public String getE01CDRVEN()
  {
    return fieldE01CDRVEN.getString();
  }

  /**
  * Set numeric field E01CDRVEN using a BigDecimal value.
  */
  public void setE01CDRVEN(BigDecimal newvalue)
  {
    fieldE01CDRVEN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CDRVEN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CDRVEN()
  {
    return fieldE01CDRVEN.getBigDecimal();
  }

  /**
  * Set field E01CDRNAM using a String value.
  */
  public void setE01CDRNAM(String newvalue)
  {
    fieldE01CDRNAM.setString(newvalue);
  }

  /**
  * Get value of field E01CDRNAM as a String.
  */
  public String getE01CDRNAM()
  {
    return fieldE01CDRNAM.getString();
  }

  /**
  * Set field E01CDRMOX using a String value.
  */
  public void setE01CDRMOX(String newvalue)
  {
    fieldE01CDRMOX.setString(newvalue);
  }

  /**
  * Get value of field E01CDRMOX as a String.
  */
  public String getE01CDRMOX()
  {
    return fieldE01CDRMOX.getString();
  }

  /**
  * Set numeric field E01CDRMOX using a BigDecimal value.
  */
  public void setE01CDRMOX(BigDecimal newvalue)
  {
    fieldE01CDRMOX.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CDRMOX as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CDRMOX()
  {
    return fieldE01CDRMOX.getBigDecimal();
  }

  /**
  * Set field E01CDRYEX using a String value.
  */
  public void setE01CDRYEX(String newvalue)
  {
    fieldE01CDRYEX.setString(newvalue);
  }

  /**
  * Get value of field E01CDRYEX as a String.
  */
  public String getE01CDRYEX()
  {
    return fieldE01CDRYEX.getString();
  }

  /**
  * Set numeric field E01CDRYEX using a BigDecimal value.
  */
  public void setE01CDRYEX(BigDecimal newvalue)
  {
    fieldE01CDRYEX.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CDRYEX as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CDRYEX()
  {
    return fieldE01CDRYEX.getBigDecimal();
  }

}
