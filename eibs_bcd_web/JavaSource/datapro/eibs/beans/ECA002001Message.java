package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from ECA002001 physical file definition.
* 
* File level identifier is 1180925222534.
* Record format level identifier is 2C937E7BDFF9F.
*/

public class ECA002001Message extends MessageRecord
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
                                     "E01CREBNK",
                                     "E01CRECUN",
                                     "D01CRECUN",
                                     "E01CREPAV",
                                     "E01CRETRE",
                                     "E01CRETRF",
                                     "E01CRESTS",
                                     "E01CRETOP",
                                     "E01CRETTA",
                                     "E01CREFFI",
                                     "E01CRESTA",
                                     "E01CREVRA",
                                     "E01CREMVR",
                                     "E01CRECMM",
                                     "E01CRECDD",
                                     "E01CRECYY",
                                     "E01CRECTT",
                                     "E01CRECMU",
                                     "E01CRELMM",
                                     "E01CRELDD",
                                     "E01CRELYY",
                                     "E01CRELTT",
                                     "E01CRELMU",
                                     "E01NUMREC",
                                     "E01INDOPE"
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
                                   "E01CREBNK",
                                   "E01CRECUN",
                                   "D01CRECUN",
                                   "E01CREPAV",
                                   "E01CRETRE",
                                   "E01CRETRF",
                                   "E01CRESTS",
                                   "E01CRETOP",
                                   "E01CRETTA",
                                   "E01CREFFI",
                                   "E01CRESTA",
                                   "E01CREVRA",
                                   "E01CREMVR",
                                   "E01CRECMM",
                                   "E01CRECDD",
                                   "E01CRECYY",
                                   "E01CRECTT",
                                   "E01CRECMU",
                                   "E01CRELMM",
                                   "E01CRELDD",
                                   "E01CRELYY",
                                   "E01CRELTT",
                                   "E01CRELMU",
                                   "E01NUMREC",
                                   "E01INDOPE"
                                 };
  final static String fid = "1180925222534";
  final static String rid = "2C937E7BDFF9F";
  final static String fmtname = "ECA002001";
  final int FIELDCOUNT = 34;
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
  private CharacterField fieldE01CREBNK = null;
  private DecimalField fieldE01CRECUN = null;
  private CharacterField fieldD01CRECUN = null;
  private CharacterField fieldE01CREPAV = null;
  private CharacterField fieldE01CRETRE = null;
  private CharacterField fieldE01CRETRF = null;
  private CharacterField fieldE01CRESTS = null;
  private CharacterField fieldE01CRETOP = null;
  private CharacterField fieldE01CRETTA = null;
  private CharacterField fieldE01CREFFI = null;
  private CharacterField fieldE01CRESTA = null;
  private DecimalField fieldE01CREVRA = null;
  private DecimalField fieldE01CREMVR = null;
  private DecimalField fieldE01CRECMM = null;
  private DecimalField fieldE01CRECDD = null;
  private DecimalField fieldE01CRECYY = null;
  private CharacterField fieldE01CRECTT = null;
  private CharacterField fieldE01CRECMU = null;
  private DecimalField fieldE01CRELMM = null;
  private DecimalField fieldE01CRELDD = null;
  private DecimalField fieldE01CRELYY = null;
  private CharacterField fieldE01CRELTT = null;
  private CharacterField fieldE01CRELMU = null;
  private DecimalField fieldE01NUMREC = null;
  private CharacterField fieldE01INDOPE = null;

  /**
  * Constructor for ECA002001Message.
  */
  public ECA002001Message()
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
    recordsize = 276;
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
    fields[9] = fieldE01CREBNK =
    new CharacterField(message, HEADERSIZE + 42, 2, "E01CREBNK");
    fields[10] = fieldE01CRECUN =
    new DecimalField(message, HEADERSIZE + 44, 10, 0, "E01CRECUN");
    fields[11] = fieldD01CRECUN =
    new CharacterField(message, HEADERSIZE + 54, 60, "D01CRECUN");
    fields[12] = fieldE01CREPAV =
    new CharacterField(message, HEADERSIZE + 114, 20, "E01CREPAV");
    fields[13] = fieldE01CRETRE =
    new CharacterField(message, HEADERSIZE + 134, 4, "E01CRETRE");
    fields[14] = fieldE01CRETRF =
    new CharacterField(message, HEADERSIZE + 138, 1, "E01CRETRF");
    fields[15] = fieldE01CRESTS =
    new CharacterField(message, HEADERSIZE + 139, 1, "E01CRESTS");
    fields[16] = fieldE01CRETOP =
    new CharacterField(message, HEADERSIZE + 140, 1, "E01CRETOP");
    fields[17] = fieldE01CRETTA =
    new CharacterField(message, HEADERSIZE + 141, 1, "E01CRETTA");
    fields[18] = fieldE01CREFFI =
    new CharacterField(message, HEADERSIZE + 142, 4, "E01CREFFI");
    fields[19] = fieldE01CRESTA =
    new CharacterField(message, HEADERSIZE + 146, 1, "E01CRESTA");
    fields[20] = fieldE01CREVRA =
    new DecimalField(message, HEADERSIZE + 147, 13, 0, "E01CREVRA");
    fields[21] = fieldE01CREMVR =
    new DecimalField(message, HEADERSIZE + 160, 13, 0, "E01CREMVR");
    fields[22] = fieldE01CRECMM =
    new DecimalField(message, HEADERSIZE + 173, 3, 0, "E01CRECMM");
    fields[23] = fieldE01CRECDD =
    new DecimalField(message, HEADERSIZE + 176, 3, 0, "E01CRECDD");
    fields[24] = fieldE01CRECYY =
    new DecimalField(message, HEADERSIZE + 179, 5, 0, "E01CRECYY");
    fields[25] = fieldE01CRECTT =
    new CharacterField(message, HEADERSIZE + 184, 26, "E01CRECTT");
    fields[26] = fieldE01CRECMU =
    new CharacterField(message, HEADERSIZE + 210, 10, "E01CRECMU");
    fields[27] = fieldE01CRELMM =
    new DecimalField(message, HEADERSIZE + 220, 3, 0, "E01CRELMM");
    fields[28] = fieldE01CRELDD =
    new DecimalField(message, HEADERSIZE + 223, 3, 0, "E01CRELDD");
    fields[29] = fieldE01CRELYY =
    new DecimalField(message, HEADERSIZE + 226, 5, 0, "E01CRELYY");
    fields[30] = fieldE01CRELTT =
    new CharacterField(message, HEADERSIZE + 231, 26, "E01CRELTT");
    fields[31] = fieldE01CRELMU =
    new CharacterField(message, HEADERSIZE + 257, 10, "E01CRELMU");
    fields[32] = fieldE01NUMREC =
    new DecimalField(message, HEADERSIZE + 267, 8, 0, "E01NUMREC");
    fields[33] = fieldE01INDOPE =
    new CharacterField(message, HEADERSIZE + 275, 1, "E01INDOPE");

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
  * Set field E01CREBNK using a String value.
  */
  public void setE01CREBNK(String newvalue)
  {
    fieldE01CREBNK.setString(newvalue);
  }

  /**
  * Get value of field E01CREBNK as a String.
  */
  public String getE01CREBNK()
  {
    return fieldE01CREBNK.getString();
  }

  /**
  * Set field E01CRECUN using a String value.
  */
  public void setE01CRECUN(String newvalue)
  {
    fieldE01CRECUN.setString(newvalue);
  }

  /**
  * Get value of field E01CRECUN as a String.
  */
  public String getE01CRECUN()
  {
    return fieldE01CRECUN.getString();
  }

  /**
  * Set numeric field E01CRECUN using a BigDecimal value.
  */
  public void setE01CRECUN(BigDecimal newvalue)
  {
    fieldE01CRECUN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CRECUN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CRECUN()
  {
    return fieldE01CRECUN.getBigDecimal();
  }

  /**
  * Set field D01CRECUN using a String value.
  */
  public void setD01CRECUN(String newvalue)
  {
    fieldD01CRECUN.setString(newvalue);
  }

  /**
  * Get value of field D01CRECUN as a String.
  */
  public String getD01CRECUN()
  {
    return fieldD01CRECUN.getString();
  }

  /**
  * Set field E01CREPAV using a String value.
  */
  public void setE01CREPAV(String newvalue)
  {
    fieldE01CREPAV.setString(newvalue);
  }

  /**
  * Get value of field E01CREPAV as a String.
  */
  public String getE01CREPAV()
  {
    return fieldE01CREPAV.getString();
  }

  /**
  * Set field E01CRETRE using a String value.
  */
  public void setE01CRETRE(String newvalue)
  {
    fieldE01CRETRE.setString(newvalue);
  }

  /**
  * Get value of field E01CRETRE as a String.
  */
  public String getE01CRETRE()
  {
    return fieldE01CRETRE.getString();
  }

  /**
  * Set field E01CRETRF using a String value.
  */
  public void setE01CRETRF(String newvalue)
  {
    fieldE01CRETRF.setString(newvalue);
  }

  /**
  * Get value of field E01CRETRF as a String.
  */
  public String getE01CRETRF()
  {
    return fieldE01CRETRF.getString();
  }

  /**
  * Set field E01CRESTS using a String value.
  */
  public void setE01CRESTS(String newvalue)
  {
    fieldE01CRESTS.setString(newvalue);
  }

  /**
  * Get value of field E01CRESTS as a String.
  */
  public String getE01CRESTS()
  {
    return fieldE01CRESTS.getString();
  }

  /**
  * Set field E01CRETOP using a String value.
  */
  public void setE01CRETOP(String newvalue)
  {
    fieldE01CRETOP.setString(newvalue);
  }

  /**
  * Get value of field E01CRETOP as a String.
  */
  public String getE01CRETOP()
  {
    return fieldE01CRETOP.getString();
  }

  /**
  * Set field E01CRETTA using a String value.
  */
  public void setE01CRETTA(String newvalue)
  {
    fieldE01CRETTA.setString(newvalue);
  }

  /**
  * Get value of field E01CRETTA as a String.
  */
  public String getE01CRETTA()
  {
    return fieldE01CRETTA.getString();
  }

  /**
  * Set field E01CREFFI using a String value.
  */
  public void setE01CREFFI(String newvalue)
  {
    fieldE01CREFFI.setString(newvalue);
  }

  /**
  * Get value of field E01CREFFI as a String.
  */
  public String getE01CREFFI()
  {
    return fieldE01CREFFI.getString();
  }

  /**
  * Set field E01CRESTA using a String value.
  */
  public void setE01CRESTA(String newvalue)
  {
    fieldE01CRESTA.setString(newvalue);
  }

  /**
  * Get value of field E01CRESTA as a String.
  */
  public String getE01CRESTA()
  {
    return fieldE01CRESTA.getString();
  }

  /**
  * Set field E01CREVRA using a String value.
  */
  public void setE01CREVRA(String newvalue)
  {
    fieldE01CREVRA.setString(newvalue);
  }

  /**
  * Get value of field E01CREVRA as a String.
  */
  public String getE01CREVRA()
  {
    return fieldE01CREVRA.getString();
  }

  /**
  * Set numeric field E01CREVRA using a BigDecimal value.
  */
  public void setE01CREVRA(BigDecimal newvalue)
  {
    fieldE01CREVRA.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CREVRA as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CREVRA()
  {
    return fieldE01CREVRA.getBigDecimal();
  }

  /**
  * Set field E01CREMVR using a String value.
  */
  public void setE01CREMVR(String newvalue)
  {
    fieldE01CREMVR.setString(newvalue);
  }

  /**
  * Get value of field E01CREMVR as a String.
  */
  public String getE01CREMVR()
  {
    return fieldE01CREMVR.getString();
  }

  /**
  * Set numeric field E01CREMVR using a BigDecimal value.
  */
  public void setE01CREMVR(BigDecimal newvalue)
  {
    fieldE01CREMVR.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CREMVR as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CREMVR()
  {
    return fieldE01CREMVR.getBigDecimal();
  }

  /**
  * Set field E01CRECMM using a String value.
  */
  public void setE01CRECMM(String newvalue)
  {
    fieldE01CRECMM.setString(newvalue);
  }

  /**
  * Get value of field E01CRECMM as a String.
  */
  public String getE01CRECMM()
  {
    return fieldE01CRECMM.getString();
  }

  /**
  * Set numeric field E01CRECMM using a BigDecimal value.
  */
  public void setE01CRECMM(BigDecimal newvalue)
  {
    fieldE01CRECMM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CRECMM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CRECMM()
  {
    return fieldE01CRECMM.getBigDecimal();
  }

  /**
  * Set field E01CRECDD using a String value.
  */
  public void setE01CRECDD(String newvalue)
  {
    fieldE01CRECDD.setString(newvalue);
  }

  /**
  * Get value of field E01CRECDD as a String.
  */
  public String getE01CRECDD()
  {
    return fieldE01CRECDD.getString();
  }

  /**
  * Set numeric field E01CRECDD using a BigDecimal value.
  */
  public void setE01CRECDD(BigDecimal newvalue)
  {
    fieldE01CRECDD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CRECDD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CRECDD()
  {
    return fieldE01CRECDD.getBigDecimal();
  }

  /**
  * Set field E01CRECYY using a String value.
  */
  public void setE01CRECYY(String newvalue)
  {
    fieldE01CRECYY.setString(newvalue);
  }

  /**
  * Get value of field E01CRECYY as a String.
  */
  public String getE01CRECYY()
  {
    return fieldE01CRECYY.getString();
  }

  /**
  * Set numeric field E01CRECYY using a BigDecimal value.
  */
  public void setE01CRECYY(BigDecimal newvalue)
  {
    fieldE01CRECYY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CRECYY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CRECYY()
  {
    return fieldE01CRECYY.getBigDecimal();
  }

  /**
  * Set field E01CRECTT using a String value.
  */
  public void setE01CRECTT(String newvalue)
  {
    fieldE01CRECTT.setString(newvalue);
  }

  /**
  * Get value of field E01CRECTT as a String.
  */
  public String getE01CRECTT()
  {
    return fieldE01CRECTT.getString();
  }

  /**
  * Set field E01CRECMU using a String value.
  */
  public void setE01CRECMU(String newvalue)
  {
    fieldE01CRECMU.setString(newvalue);
  }

  /**
  * Get value of field E01CRECMU as a String.
  */
  public String getE01CRECMU()
  {
    return fieldE01CRECMU.getString();
  }

  /**
  * Set field E01CRELMM using a String value.
  */
  public void setE01CRELMM(String newvalue)
  {
    fieldE01CRELMM.setString(newvalue);
  }

  /**
  * Get value of field E01CRELMM as a String.
  */
  public String getE01CRELMM()
  {
    return fieldE01CRELMM.getString();
  }

  /**
  * Set numeric field E01CRELMM using a BigDecimal value.
  */
  public void setE01CRELMM(BigDecimal newvalue)
  {
    fieldE01CRELMM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CRELMM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CRELMM()
  {
    return fieldE01CRELMM.getBigDecimal();
  }

  /**
  * Set field E01CRELDD using a String value.
  */
  public void setE01CRELDD(String newvalue)
  {
    fieldE01CRELDD.setString(newvalue);
  }

  /**
  * Get value of field E01CRELDD as a String.
  */
  public String getE01CRELDD()
  {
    return fieldE01CRELDD.getString();
  }

  /**
  * Set numeric field E01CRELDD using a BigDecimal value.
  */
  public void setE01CRELDD(BigDecimal newvalue)
  {
    fieldE01CRELDD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CRELDD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CRELDD()
  {
    return fieldE01CRELDD.getBigDecimal();
  }

  /**
  * Set field E01CRELYY using a String value.
  */
  public void setE01CRELYY(String newvalue)
  {
    fieldE01CRELYY.setString(newvalue);
  }

  /**
  * Get value of field E01CRELYY as a String.
  */
  public String getE01CRELYY()
  {
    return fieldE01CRELYY.getString();
  }

  /**
  * Set numeric field E01CRELYY using a BigDecimal value.
  */
  public void setE01CRELYY(BigDecimal newvalue)
  {
    fieldE01CRELYY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CRELYY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CRELYY()
  {
    return fieldE01CRELYY.getBigDecimal();
  }

  /**
  * Set field E01CRELTT using a String value.
  */
  public void setE01CRELTT(String newvalue)
  {
    fieldE01CRELTT.setString(newvalue);
  }

  /**
  * Get value of field E01CRELTT as a String.
  */
  public String getE01CRELTT()
  {
    return fieldE01CRELTT.getString();
  }

  /**
  * Set field E01CRELMU using a String value.
  */
  public void setE01CRELMU(String newvalue)
  {
    fieldE01CRELMU.setString(newvalue);
  }

  /**
  * Get value of field E01CRELMU as a String.
  */
  public String getE01CRELMU()
  {
    return fieldE01CRELMU.getString();
  }

  /**
  * Set field E01NUMREC using a String value.
  */
  public void setE01NUMREC(String newvalue)
  {
    fieldE01NUMREC.setString(newvalue);
  }

  /**
  * Get value of field E01NUMREC as a String.
  */
  public String getE01NUMREC()
  {
    return fieldE01NUMREC.getString();
  }

  /**
  * Set numeric field E01NUMREC using a BigDecimal value.
  */
  public void setE01NUMREC(BigDecimal newvalue)
  {
    fieldE01NUMREC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01NUMREC as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01NUMREC()
  {
    return fieldE01NUMREC.getBigDecimal();
  }

  /**
  * Set field E01INDOPE using a String value.
  */
  public void setE01INDOPE(String newvalue)
  {
    fieldE01INDOPE.setString(newvalue);
  }

  /**
  * Get value of field E01INDOPE as a String.
  */
  public String getE01INDOPE()
  {
    return fieldE01INDOPE.getString();
  }

}