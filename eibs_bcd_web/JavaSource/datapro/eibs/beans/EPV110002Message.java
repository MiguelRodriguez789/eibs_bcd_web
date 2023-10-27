package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from EPV110002 physical file definition.
* 
* File level identifier is 1180110175102.
* Record format level identifier is 450D0382BDEE4.
*/

public class EPV110002Message extends MessageRecord
{
  final static String fldnames[] = {
                                     "H02USERID",
                                     "H02PROGRM",
                                     "H02TIMSYS",
                                     "H02SCRCOD",
                                     "H02OPECOD",
                                     "H02FLGMAS",
                                     "H02FLGWK1",
                                     "H02FLGWK2",
                                     "H02FLGWK3",
                                     "E02DSBCUN",
                                     "E02DSBNUM",
                                     "E02DSBACC",
                                     "E02DSBSEQ",
                                     "E02DSBORG",
                                     "E02DSBDSC",
                                     "E02DSBAMT",
                                     "E02DSBIVA",
                                     "E02DSBTOT",
                                     "E02DSBEXR",
                                     "E02DSBEQV"
                                   };
  final static String tnames[] = {
                                   "H02USERID",
                                   "H02PROGRM",
                                   "H02TIMSYS",
                                   "H02SCRCOD",
                                   "H02OPECOD",
                                   "H02FLGMAS",
                                   "H02FLGWK1",
                                   "H02FLGWK2",
                                   "H02FLGWK3",
                                   "E02DSBCUN",
                                   "E02DSBNUM",
                                   "E02DSBACC",
                                   "E02DSBSEQ",
                                   "E02DSBORG",
                                   "E02DSBDSC",
                                   "E02DSBAMT",
                                   "E02DSBIVA",
                                   "E02DSBTOT",
                                   "E02DSBEXR",
                                   "E02DSBEQV"
                                 };
  final static String fid = "1180110175102";
  final static String rid = "450D0382BDEE4";
  final static String fmtname = "EPV110002";
  final int FIELDCOUNT = 20;
  private static Hashtable tlookup = new Hashtable();
  private CharacterField fieldH02USERID = null;
  private CharacterField fieldH02PROGRM = null;
  private CharacterField fieldH02TIMSYS = null;
  private CharacterField fieldH02SCRCOD = null;
  private CharacterField fieldH02OPECOD = null;
  private CharacterField fieldH02FLGMAS = null;
  private CharacterField fieldH02FLGWK1 = null;
  private CharacterField fieldH02FLGWK2 = null;
  private CharacterField fieldH02FLGWK3 = null;
  private DecimalField fieldE02DSBCUN = null;
  private DecimalField fieldE02DSBNUM = null;
  private DecimalField fieldE02DSBACC = null;
  private DecimalField fieldE02DSBSEQ = null;
  private CharacterField fieldE02DSBORG = null;
  private CharacterField fieldE02DSBDSC = null;
  private DecimalField fieldE02DSBAMT = null;
  private DecimalField fieldE02DSBIVA = null;
  private DecimalField fieldE02DSBTOT = null;
  private DecimalField fieldE02DSBEXR = null;
  private DecimalField fieldE02DSBEQV = null;

  /**
  * Constructor for EPV110002Message.
  */
  public EPV110002Message()
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
    recordsize = 208;
    fileid = fid;
    recordid = rid;
    message = new byte[getByteLength()];
    formatname = fmtname;
    fieldnames = fldnames;
    tagnames = tnames;
    fields = new MessageField[FIELDCOUNT];

    fields[0] = fieldH02USERID =
    new CharacterField(message, HEADERSIZE + 0, 10, "H02USERID");
    fields[1] = fieldH02PROGRM =
    new CharacterField(message, HEADERSIZE + 10, 10, "H02PROGRM");
    fields[2] = fieldH02TIMSYS =
    new CharacterField(message, HEADERSIZE + 20, 12, "H02TIMSYS");
    fields[3] = fieldH02SCRCOD =
    new CharacterField(message, HEADERSIZE + 32, 2, "H02SCRCOD");
    fields[4] = fieldH02OPECOD =
    new CharacterField(message, HEADERSIZE + 34, 4, "H02OPECOD");
    fields[5] = fieldH02FLGMAS =
    new CharacterField(message, HEADERSIZE + 38, 1, "H02FLGMAS");
    fields[6] = fieldH02FLGWK1 =
    new CharacterField(message, HEADERSIZE + 39, 1, "H02FLGWK1");
    fields[7] = fieldH02FLGWK2 =
    new CharacterField(message, HEADERSIZE + 40, 1, "H02FLGWK2");
    fields[8] = fieldH02FLGWK3 =
    new CharacterField(message, HEADERSIZE + 41, 1, "H02FLGWK3");
    fields[9] = fieldE02DSBCUN =
    new DecimalField(message, HEADERSIZE + 42, 10, 0, "E02DSBCUN");
    fields[10] = fieldE02DSBNUM =
    new DecimalField(message, HEADERSIZE + 52, 13, 0, "E02DSBNUM");
    fields[11] = fieldE02DSBACC =
    new DecimalField(message, HEADERSIZE + 65, 13, 0, "E02DSBACC");
    fields[12] = fieldE02DSBSEQ =
    new DecimalField(message, HEADERSIZE + 78, 3, 0, "E02DSBSEQ");
    fields[13] = fieldE02DSBORG =
    new CharacterField(message, HEADERSIZE + 81, 1, "E02DSBORG");
    fields[14] = fieldE02DSBDSC =
    new CharacterField(message, HEADERSIZE + 82, 45, "E02DSBDSC");
    fields[15] = fieldE02DSBAMT =
    new DecimalField(message, HEADERSIZE + 127, 17, 2, "E02DSBAMT");
    fields[16] = fieldE02DSBIVA =
    new DecimalField(message, HEADERSIZE + 144, 17, 2, "E02DSBIVA");
    fields[17] = fieldE02DSBTOT =
    new DecimalField(message, HEADERSIZE + 161, 17, 2, "E02DSBTOT");
    fields[18] = fieldE02DSBEXR =
    new DecimalField(message, HEADERSIZE + 178, 13, 6, "E02DSBEXR");
    fields[19] = fieldE02DSBEQV =
    new DecimalField(message, HEADERSIZE + 191, 17, 2, "E02DSBEQV");

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
  * Set field H02USERID using a String value.
  */
  public void setH02USERID(String newvalue)
  {
    fieldH02USERID.setString(newvalue);
  }

  /**
  * Get value of field H02USERID as a String.
  */
  public String getH02USERID()
  {
    return fieldH02USERID.getString();
  }

  /**
  * Set field H02PROGRM using a String value.
  */
  public void setH02PROGRM(String newvalue)
  {
    fieldH02PROGRM.setString(newvalue);
  }

  /**
  * Get value of field H02PROGRM as a String.
  */
  public String getH02PROGRM()
  {
    return fieldH02PROGRM.getString();
  }

  /**
  * Set field H02TIMSYS using a String value.
  */
  public void setH02TIMSYS(String newvalue)
  {
    fieldH02TIMSYS.setString(newvalue);
  }

  /**
  * Get value of field H02TIMSYS as a String.
  */
  public String getH02TIMSYS()
  {
    return fieldH02TIMSYS.getString();
  }

  /**
  * Set field H02SCRCOD using a String value.
  */
  public void setH02SCRCOD(String newvalue)
  {
    fieldH02SCRCOD.setString(newvalue);
  }

  /**
  * Get value of field H02SCRCOD as a String.
  */
  public String getH02SCRCOD()
  {
    return fieldH02SCRCOD.getString();
  }

  /**
  * Set field H02OPECOD using a String value.
  */
  public void setH02OPECOD(String newvalue)
  {
    fieldH02OPECOD.setString(newvalue);
  }

  /**
  * Get value of field H02OPECOD as a String.
  */
  public String getH02OPECOD()
  {
    return fieldH02OPECOD.getString();
  }

  /**
  * Set field H02FLGMAS using a String value.
  */
  public void setH02FLGMAS(String newvalue)
  {
    fieldH02FLGMAS.setString(newvalue);
  }

  /**
  * Get value of field H02FLGMAS as a String.
  */
  public String getH02FLGMAS()
  {
    return fieldH02FLGMAS.getString();
  }

  /**
  * Set field H02FLGWK1 using a String value.
  */
  public void setH02FLGWK1(String newvalue)
  {
    fieldH02FLGWK1.setString(newvalue);
  }

  /**
  * Get value of field H02FLGWK1 as a String.
  */
  public String getH02FLGWK1()
  {
    return fieldH02FLGWK1.getString();
  }

  /**
  * Set field H02FLGWK2 using a String value.
  */
  public void setH02FLGWK2(String newvalue)
  {
    fieldH02FLGWK2.setString(newvalue);
  }

  /**
  * Get value of field H02FLGWK2 as a String.
  */
  public String getH02FLGWK2()
  {
    return fieldH02FLGWK2.getString();
  }

  /**
  * Set field H02FLGWK3 using a String value.
  */
  public void setH02FLGWK3(String newvalue)
  {
    fieldH02FLGWK3.setString(newvalue);
  }

  /**
  * Get value of field H02FLGWK3 as a String.
  */
  public String getH02FLGWK3()
  {
    return fieldH02FLGWK3.getString();
  }

  /**
  * Set field E02DSBCUN using a String value.
  */
  public void setE02DSBCUN(String newvalue)
  {
    fieldE02DSBCUN.setString(newvalue);
  }

  /**
  * Get value of field E02DSBCUN as a String.
  */
  public String getE02DSBCUN()
  {
    return fieldE02DSBCUN.getString();
  }

  /**
  * Set numeric field E02DSBCUN using a BigDecimal value.
  */
  public void setE02DSBCUN(BigDecimal newvalue)
  {
    fieldE02DSBCUN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02DSBCUN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02DSBCUN()
  {
    return fieldE02DSBCUN.getBigDecimal();
  }

  /**
  * Set field E02DSBNUM using a String value.
  */
  public void setE02DSBNUM(String newvalue)
  {
    fieldE02DSBNUM.setString(newvalue);
  }

  /**
  * Get value of field E02DSBNUM as a String.
  */
  public String getE02DSBNUM()
  {
    return fieldE02DSBNUM.getString();
  }

  /**
  * Set numeric field E02DSBNUM using a BigDecimal value.
  */
  public void setE02DSBNUM(BigDecimal newvalue)
  {
    fieldE02DSBNUM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02DSBNUM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02DSBNUM()
  {
    return fieldE02DSBNUM.getBigDecimal();
  }

  /**
  * Set field E02DSBACC using a String value.
  */
  public void setE02DSBACC(String newvalue)
  {
    fieldE02DSBACC.setString(newvalue);
  }

  /**
  * Get value of field E02DSBACC as a String.
  */
  public String getE02DSBACC()
  {
    return fieldE02DSBACC.getString();
  }

  /**
  * Set numeric field E02DSBACC using a BigDecimal value.
  */
  public void setE02DSBACC(BigDecimal newvalue)
  {
    fieldE02DSBACC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02DSBACC as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02DSBACC()
  {
    return fieldE02DSBACC.getBigDecimal();
  }

  /**
  * Set field E02DSBSEQ using a String value.
  */
  public void setE02DSBSEQ(String newvalue)
  {
    fieldE02DSBSEQ.setString(newvalue);
  }

  /**
  * Get value of field E02DSBSEQ as a String.
  */
  public String getE02DSBSEQ()
  {
    return fieldE02DSBSEQ.getString();
  }

  /**
  * Set numeric field E02DSBSEQ using a BigDecimal value.
  */
  public void setE02DSBSEQ(BigDecimal newvalue)
  {
    fieldE02DSBSEQ.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02DSBSEQ as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02DSBSEQ()
  {
    return fieldE02DSBSEQ.getBigDecimal();
  }

  /**
  * Set field E02DSBORG using a String value.
  */
  public void setE02DSBORG(String newvalue)
  {
    fieldE02DSBORG.setString(newvalue);
  }

  /**
  * Get value of field E02DSBORG as a String.
  */
  public String getE02DSBORG()
  {
    return fieldE02DSBORG.getString();
  }

  /**
  * Set field E02DSBDSC using a String value.
  */
  public void setE02DSBDSC(String newvalue)
  {
    fieldE02DSBDSC.setString(newvalue);
  }

  /**
  * Get value of field E02DSBDSC as a String.
  */
  public String getE02DSBDSC()
  {
    return fieldE02DSBDSC.getString();
  }

  /**
  * Set field E02DSBAMT using a String value.
  */
  public void setE02DSBAMT(String newvalue)
  {
    fieldE02DSBAMT.setString(newvalue);
  }

  /**
  * Get value of field E02DSBAMT as a String.
  */
  public String getE02DSBAMT()
  {
    return fieldE02DSBAMT.getString();
  }

  /**
  * Set numeric field E02DSBAMT using a BigDecimal value.
  */
  public void setE02DSBAMT(BigDecimal newvalue)
  {
    fieldE02DSBAMT.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02DSBAMT as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02DSBAMT()
  {
    return fieldE02DSBAMT.getBigDecimal();
  }

  /**
  * Set field E02DSBIVA using a String value.
  */
  public void setE02DSBIVA(String newvalue)
  {
    fieldE02DSBIVA.setString(newvalue);
  }

  /**
  * Get value of field E02DSBIVA as a String.
  */
  public String getE02DSBIVA()
  {
    return fieldE02DSBIVA.getString();
  }

  /**
  * Set numeric field E02DSBIVA using a BigDecimal value.
  */
  public void setE02DSBIVA(BigDecimal newvalue)
  {
    fieldE02DSBIVA.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02DSBIVA as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02DSBIVA()
  {
    return fieldE02DSBIVA.getBigDecimal();
  }

  /**
  * Set field E02DSBTOT using a String value.
  */
  public void setE02DSBTOT(String newvalue)
  {
    fieldE02DSBTOT.setString(newvalue);
  }

  /**
  * Get value of field E02DSBTOT as a String.
  */
  public String getE02DSBTOT()
  {
    return fieldE02DSBTOT.getString();
  }

  /**
  * Set numeric field E02DSBTOT using a BigDecimal value.
  */
  public void setE02DSBTOT(BigDecimal newvalue)
  {
    fieldE02DSBTOT.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02DSBTOT as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02DSBTOT()
  {
    return fieldE02DSBTOT.getBigDecimal();
  }

  /**
  * Set field E02DSBEXR using a String value.
  */
  public void setE02DSBEXR(String newvalue)
  {
    fieldE02DSBEXR.setString(newvalue);
  }

  /**
  * Get value of field E02DSBEXR as a String.
  */
  public String getE02DSBEXR()
  {
    return fieldE02DSBEXR.getString();
  }

  /**
  * Set numeric field E02DSBEXR using a BigDecimal value.
  */
  public void setE02DSBEXR(BigDecimal newvalue)
  {
    fieldE02DSBEXR.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02DSBEXR as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02DSBEXR()
  {
    return fieldE02DSBEXR.getBigDecimal();
  }

  /**
  * Set field E02DSBEQV using a String value.
  */
  public void setE02DSBEQV(String newvalue)
  {
    fieldE02DSBEQV.setString(newvalue);
  }

  /**
  * Get value of field E02DSBEQV as a String.
  */
  public String getE02DSBEQV()
  {
    return fieldE02DSBEQV.getString();
  }

  /**
  * Set numeric field E02DSBEQV using a BigDecimal value.
  */
  public void setE02DSBEQV(BigDecimal newvalue)
  {
    fieldE02DSBEQV.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02DSBEQV as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02DSBEQV()
  {
    return fieldE02DSBEQV.getBigDecimal();
  }

}
