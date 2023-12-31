package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from EPV108002 physical file definition.
* 
* File level identifier is 1130611113307.
* Record format level identifier is 273BC12293054.
*/

public class EPV108002Message extends MessageRecord
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
                                     "E02DEAACC",
                                     "E02DSCPRM",
                                     "E02TYPPAG",
                                     "E02ESTADO",
                                     "E02FECAPM",
                                     "E02FECAPD",
                                     "E02FECAPY",
                                     "E02DEARTE",
                                     "E02APECRE",
                                     "E02SALCRE",
                                     "E02VALCUO",
                                     "E02TOTCUO",
                                     "E02CUPPAG",
                                     "E02TIPDEU",
                                     "E02AVLAYN"
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
                                   "E02DEAACC",
                                   "E02DSCPRM",
                                   "E02TYPPAG",
                                   "E02ESTADO",
                                   "E02FECAPM",
                                   "E02FECAPD",
                                   "E02FECAPY",
                                   "E02DEARTE",
                                   "E02APECRE",
                                   "E02SALCRE",
                                   "E02VALCUO",
                                   "E02TOTCUO",
                                   "E02CUPPAG",
                                   "E02TIPDEU",
                                   "E02AVLAYN"
                                 };
  final static String fid = "1130611113307";
  final static String rid = "273BC12293054";
  final static String fmtname = "EPV108002";
  final int FIELDCOUNT = 24;
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
  private DecimalField fieldE02DEAACC = null;
  private CharacterField fieldE02DSCPRM = null;
  private CharacterField fieldE02TYPPAG = null;
  private CharacterField fieldE02ESTADO = null;
  private DecimalField fieldE02FECAPM = null;
  private DecimalField fieldE02FECAPD = null;
  private DecimalField fieldE02FECAPY = null;
  private DecimalField fieldE02DEARTE = null;
  private DecimalField fieldE02APECRE = null;
  private DecimalField fieldE02SALCRE = null;
  private DecimalField fieldE02VALCUO = null;
  private DecimalField fieldE02TOTCUO = null;
  private DecimalField fieldE02CUPPAG = null;
  private CharacterField fieldE02TIPDEU = null;
  private CharacterField fieldE02AVLAYN = null;

  /**
  * Constructor for EPV108002Message.
  */
  public EPV108002Message()
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
    recordsize = 246;
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
    fields[9] = fieldE02DEAACC =
    new DecimalField(message, HEADERSIZE + 42, 13, 0, "E02DEAACC");
    fields[10] = fieldE02DSCPRM =
    new CharacterField(message, HEADERSIZE + 55, 60, "E02DSCPRM");
    fields[11] = fieldE02TYPPAG =
    new CharacterField(message, HEADERSIZE + 115, 15, "E02TYPPAG");
    fields[12] = fieldE02ESTADO =
    new CharacterField(message, HEADERSIZE + 130, 15, "E02ESTADO");
    fields[13] = fieldE02FECAPM =
    new DecimalField(message, HEADERSIZE + 145, 3, 0, "E02FECAPM");
    fields[14] = fieldE02FECAPD =
    new DecimalField(message, HEADERSIZE + 148, 3, 0, "E02FECAPD");
    fields[15] = fieldE02FECAPY =
    new DecimalField(message, HEADERSIZE + 151, 5, 0, "E02FECAPY");
    fields[16] = fieldE02DEARTE =
    new DecimalField(message, HEADERSIZE + 156, 11, 6, "E02DEARTE");
    fields[17] = fieldE02APECRE =
    new DecimalField(message, HEADERSIZE + 167, 17, 2, "E02APECRE");
    fields[18] = fieldE02SALCRE =
    new DecimalField(message, HEADERSIZE + 184, 17, 2, "E02SALCRE");
    fields[19] = fieldE02VALCUO =
    new DecimalField(message, HEADERSIZE + 201, 17, 2, "E02VALCUO");
    fields[20] = fieldE02TOTCUO =
    new DecimalField(message, HEADERSIZE + 218, 6, 0, "E02TOTCUO");
    fields[21] = fieldE02CUPPAG =
    new DecimalField(message, HEADERSIZE + 224, 6, 0, "E02CUPPAG");
    fields[22] = fieldE02TIPDEU =
    new CharacterField(message, HEADERSIZE + 230, 15, "E02TIPDEU");
    fields[23] = fieldE02AVLAYN =
    new CharacterField(message, HEADERSIZE + 245, 1, "E02AVLAYN");

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
  * Set field E02DEAACC using a String value.
  */
  public void setE02DEAACC(String newvalue)
  {
    fieldE02DEAACC.setString(newvalue);
  }

  /**
  * Get value of field E02DEAACC as a String.
  */
  public String getE02DEAACC()
  {
    return fieldE02DEAACC.getString();
  }

  /**
  * Set numeric field E02DEAACC using a BigDecimal value.
  */
  public void setE02DEAACC(BigDecimal newvalue)
  {
    fieldE02DEAACC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02DEAACC as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02DEAACC()
  {
    return fieldE02DEAACC.getBigDecimal();
  }

  /**
  * Set field E02DSCPRM using a String value.
  */
  public void setE02DSCPRM(String newvalue)
  {
    fieldE02DSCPRM.setString(newvalue);
  }

  /**
  * Get value of field E02DSCPRM as a String.
  */
  public String getE02DSCPRM()
  {
    return fieldE02DSCPRM.getString();
  }

  /**
  * Set field E02TYPPAG using a String value.
  */
  public void setE02TYPPAG(String newvalue)
  {
    fieldE02TYPPAG.setString(newvalue);
  }

  /**
  * Get value of field E02TYPPAG as a String.
  */
  public String getE02TYPPAG()
  {
    return fieldE02TYPPAG.getString();
  }

  /**
  * Set field E02ESTADO using a String value.
  */
  public void setE02ESTADO(String newvalue)
  {
    fieldE02ESTADO.setString(newvalue);
  }

  /**
  * Get value of field E02ESTADO as a String.
  */
  public String getE02ESTADO()
  {
    return fieldE02ESTADO.getString();
  }

  /**
  * Set field E02FECAPM using a String value.
  */
  public void setE02FECAPM(String newvalue)
  {
    fieldE02FECAPM.setString(newvalue);
  }

  /**
  * Get value of field E02FECAPM as a String.
  */
  public String getE02FECAPM()
  {
    return fieldE02FECAPM.getString();
  }

  /**
  * Set numeric field E02FECAPM using a BigDecimal value.
  */
  public void setE02FECAPM(BigDecimal newvalue)
  {
    fieldE02FECAPM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02FECAPM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02FECAPM()
  {
    return fieldE02FECAPM.getBigDecimal();
  }

  /**
  * Set field E02FECAPD using a String value.
  */
  public void setE02FECAPD(String newvalue)
  {
    fieldE02FECAPD.setString(newvalue);
  }

  /**
  * Get value of field E02FECAPD as a String.
  */
  public String getE02FECAPD()
  {
    return fieldE02FECAPD.getString();
  }

  /**
  * Set numeric field E02FECAPD using a BigDecimal value.
  */
  public void setE02FECAPD(BigDecimal newvalue)
  {
    fieldE02FECAPD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02FECAPD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02FECAPD()
  {
    return fieldE02FECAPD.getBigDecimal();
  }

  /**
  * Set field E02FECAPY using a String value.
  */
  public void setE02FECAPY(String newvalue)
  {
    fieldE02FECAPY.setString(newvalue);
  }

  /**
  * Get value of field E02FECAPY as a String.
  */
  public String getE02FECAPY()
  {
    return fieldE02FECAPY.getString();
  }

  /**
  * Set numeric field E02FECAPY using a BigDecimal value.
  */
  public void setE02FECAPY(BigDecimal newvalue)
  {
    fieldE02FECAPY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02FECAPY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02FECAPY()
  {
    return fieldE02FECAPY.getBigDecimal();
  }

  /**
  * Set field E02DEARTE using a String value.
  */
  public void setE02DEARTE(String newvalue)
  {
    fieldE02DEARTE.setString(newvalue);
  }

  /**
  * Get value of field E02DEARTE as a String.
  */
  public String getE02DEARTE()
  {
    return fieldE02DEARTE.getString();
  }

  /**
  * Set numeric field E02DEARTE using a BigDecimal value.
  */
  public void setE02DEARTE(BigDecimal newvalue)
  {
    fieldE02DEARTE.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02DEARTE as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02DEARTE()
  {
    return fieldE02DEARTE.getBigDecimal();
  }

  /**
  * Set field E02APECRE using a String value.
  */
  public void setE02APECRE(String newvalue)
  {
    fieldE02APECRE.setString(newvalue);
  }

  /**
  * Get value of field E02APECRE as a String.
  */
  public String getE02APECRE()
  {
    return fieldE02APECRE.getString();
  }

  /**
  * Set numeric field E02APECRE using a BigDecimal value.
  */
  public void setE02APECRE(BigDecimal newvalue)
  {
    fieldE02APECRE.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02APECRE as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02APECRE()
  {
    return fieldE02APECRE.getBigDecimal();
  }

  /**
  * Set field E02SALCRE using a String value.
  */
  public void setE02SALCRE(String newvalue)
  {
    fieldE02SALCRE.setString(newvalue);
  }

  /**
  * Get value of field E02SALCRE as a String.
  */
  public String getE02SALCRE()
  {
    return fieldE02SALCRE.getString();
  }

  /**
  * Set numeric field E02SALCRE using a BigDecimal value.
  */
  public void setE02SALCRE(BigDecimal newvalue)
  {
    fieldE02SALCRE.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02SALCRE as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02SALCRE()
  {
    return fieldE02SALCRE.getBigDecimal();
  }

  /**
  * Set field E02VALCUO using a String value.
  */
  public void setE02VALCUO(String newvalue)
  {
    fieldE02VALCUO.setString(newvalue);
  }

  /**
  * Get value of field E02VALCUO as a String.
  */
  public String getE02VALCUO()
  {
    return fieldE02VALCUO.getString();
  }

  /**
  * Set numeric field E02VALCUO using a BigDecimal value.
  */
  public void setE02VALCUO(BigDecimal newvalue)
  {
    fieldE02VALCUO.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02VALCUO as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02VALCUO()
  {
    return fieldE02VALCUO.getBigDecimal();
  }

  /**
  * Set field E02TOTCUO using a String value.
  */
  public void setE02TOTCUO(String newvalue)
  {
    fieldE02TOTCUO.setString(newvalue);
  }

  /**
  * Get value of field E02TOTCUO as a String.
  */
  public String getE02TOTCUO()
  {
    return fieldE02TOTCUO.getString();
  }

  /**
  * Set numeric field E02TOTCUO using a BigDecimal value.
  */
  public void setE02TOTCUO(BigDecimal newvalue)
  {
    fieldE02TOTCUO.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02TOTCUO as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02TOTCUO()
  {
    return fieldE02TOTCUO.getBigDecimal();
  }

  /**
  * Set field E02CUPPAG using a String value.
  */
  public void setE02CUPPAG(String newvalue)
  {
    fieldE02CUPPAG.setString(newvalue);
  }

  /**
  * Get value of field E02CUPPAG as a String.
  */
  public String getE02CUPPAG()
  {
    return fieldE02CUPPAG.getString();
  }

  /**
  * Set numeric field E02CUPPAG using a BigDecimal value.
  */
  public void setE02CUPPAG(BigDecimal newvalue)
  {
    fieldE02CUPPAG.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02CUPPAG as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02CUPPAG()
  {
    return fieldE02CUPPAG.getBigDecimal();
  }

  /**
  * Set field E02TIPDEU using a String value.
  */
  public void setE02TIPDEU(String newvalue)
  {
    fieldE02TIPDEU.setString(newvalue);
  }

  /**
  * Get value of field E02TIPDEU as a String.
  */
  public String getE02TIPDEU()
  {
    return fieldE02TIPDEU.getString();
  }

  /**
  * Set field E02AVLAYN using a String value.
  */
  public void setE02AVLAYN(String newvalue)
  {
    fieldE02AVLAYN.setString(newvalue);
  }

  /**
  * Get value of field E02AVLAYN as a String.
  */
  public String getE02AVLAYN()
  {
    return fieldE02AVLAYN.getString();
  }

}
