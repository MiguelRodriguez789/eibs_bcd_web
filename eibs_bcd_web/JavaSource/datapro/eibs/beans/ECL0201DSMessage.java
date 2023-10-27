package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from ECL0201DS physical file definition.
* 
* File level identifier is 1130611112848.
* Record format level identifier is 39F22FA12259B.
*/

public class ECL0201DSMessage extends MessageRecord
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
                                     "E01NROCTA",
                                     "E01CHEINI",
                                     "E01NROSER",
                                     "E01NOMCLI",
                                     "E01TIIDCL",
                                     "E01NRIDCL",
                                     "E01MONEDA",
                                     "E01CHQ001",
                                     "E01CHQ002",
                                     "E01CHQ003",
                                     "E01CHQ004",
                                     "E01CHQ005",
                                     "E01CHQ006",
                                     "E01CHQ007",
                                     "E01CHQ008",
                                     "E01CHQ009",
                                     "E01CHQ010",
                                     "E01CHQ011",
                                     "E01CHQ012",
                                     "E01CHQ013",
                                     "E01CHQ014",
                                     "E01CHQ015",
                                     "E01CHQ016",
                                     "E01CHQ017",
                                     "E01CHQ018",
                                     "E01CHQ019",
                                     "E01CHQ020",
                                     "E01CHQ021",
                                     "E01CHQ022",
                                     "E01CHQ023",
                                     "E01CHQ024",
                                     "E01CHQ025"
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
                                   "E01NROCTA",
                                   "E01CHEINI",
                                   "E01NROSER",
                                   "E01NOMCLI",
                                   "E01TIIDCL",
                                   "E01NRIDCL",
                                   "E01MONEDA",
                                   "E01CHQ001",
                                   "E01CHQ002",
                                   "E01CHQ003",
                                   "E01CHQ004",
                                   "E01CHQ005",
                                   "E01CHQ006",
                                   "E01CHQ007",
                                   "E01CHQ008",
                                   "E01CHQ009",
                                   "E01CHQ010",
                                   "E01CHQ011",
                                   "E01CHQ012",
                                   "E01CHQ013",
                                   "E01CHQ014",
                                   "E01CHQ015",
                                   "E01CHQ016",
                                   "E01CHQ017",
                                   "E01CHQ018",
                                   "E01CHQ019",
                                   "E01CHQ020",
                                   "E01CHQ021",
                                   "E01CHQ022",
                                   "E01CHQ023",
                                   "E01CHQ024",
                                   "E01CHQ025"
                                 };
  final static String fid = "1130611112848";
  final static String rid = "39F22FA12259B";
  final static String fmtname = "ECL0201DS";
  final int FIELDCOUNT = 41;
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
  private CharacterField fieldE01NROCTA = null;
  private DecimalField fieldE01CHEINI = null;
  private DecimalField fieldE01NROSER = null;
  private CharacterField fieldE01NOMCLI = null;
  private CharacterField fieldE01TIIDCL = null;
  private CharacterField fieldE01NRIDCL = null;
  private CharacterField fieldE01MONEDA = null;
  private CharacterField fieldE01CHQ001 = null;
  private CharacterField fieldE01CHQ002 = null;
  private CharacterField fieldE01CHQ003 = null;
  private CharacterField fieldE01CHQ004 = null;
  private CharacterField fieldE01CHQ005 = null;
  private CharacterField fieldE01CHQ006 = null;
  private CharacterField fieldE01CHQ007 = null;
  private CharacterField fieldE01CHQ008 = null;
  private CharacterField fieldE01CHQ009 = null;
  private CharacterField fieldE01CHQ010 = null;
  private CharacterField fieldE01CHQ011 = null;
  private CharacterField fieldE01CHQ012 = null;
  private CharacterField fieldE01CHQ013 = null;
  private CharacterField fieldE01CHQ014 = null;
  private CharacterField fieldE01CHQ015 = null;
  private CharacterField fieldE01CHQ016 = null;
  private CharacterField fieldE01CHQ017 = null;
  private CharacterField fieldE01CHQ018 = null;
  private CharacterField fieldE01CHQ019 = null;
  private CharacterField fieldE01CHQ020 = null;
  private CharacterField fieldE01CHQ021 = null;
  private CharacterField fieldE01CHQ022 = null;
  private CharacterField fieldE01CHQ023 = null;
  private CharacterField fieldE01CHQ024 = null;
  private CharacterField fieldE01CHQ025 = null;

  /**
  * Constructor for ECL0201DSMessage.
  */
  public ECL0201DSMessage()
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
    recordsize = 179;
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
    fields[9] = fieldE01NROCTA =
    new CharacterField(message, HEADERSIZE + 42, 20, "E01NROCTA");
    fields[10] = fieldE01CHEINI =
    new DecimalField(message, HEADERSIZE + 62, 11, 0, "E01CHEINI");
    fields[11] = fieldE01NROSER =
    new DecimalField(message, HEADERSIZE + 73, 7, 0, "E01NROSER");
    fields[12] = fieldE01NOMCLI =
    new CharacterField(message, HEADERSIZE + 80, 45, "E01NOMCLI");
    fields[13] = fieldE01TIIDCL =
    new CharacterField(message, HEADERSIZE + 125, 1, "E01TIIDCL");
    fields[14] = fieldE01NRIDCL =
    new CharacterField(message, HEADERSIZE + 126, 25, "E01NRIDCL");
    fields[15] = fieldE01MONEDA =
    new CharacterField(message, HEADERSIZE + 151, 3, "E01MONEDA");
    fields[16] = fieldE01CHQ001 =
    new CharacterField(message, HEADERSIZE + 154, 1, "E01CHQ001");
    fields[17] = fieldE01CHQ002 =
    new CharacterField(message, HEADERSIZE + 155, 1, "E01CHQ002");
    fields[18] = fieldE01CHQ003 =
    new CharacterField(message, HEADERSIZE + 156, 1, "E01CHQ003");
    fields[19] = fieldE01CHQ004 =
    new CharacterField(message, HEADERSIZE + 157, 1, "E01CHQ004");
    fields[20] = fieldE01CHQ005 =
    new CharacterField(message, HEADERSIZE + 158, 1, "E01CHQ005");
    fields[21] = fieldE01CHQ006 =
    new CharacterField(message, HEADERSIZE + 159, 1, "E01CHQ006");
    fields[22] = fieldE01CHQ007 =
    new CharacterField(message, HEADERSIZE + 160, 1, "E01CHQ007");
    fields[23] = fieldE01CHQ008 =
    new CharacterField(message, HEADERSIZE + 161, 1, "E01CHQ008");
    fields[24] = fieldE01CHQ009 =
    new CharacterField(message, HEADERSIZE + 162, 1, "E01CHQ009");
    fields[25] = fieldE01CHQ010 =
    new CharacterField(message, HEADERSIZE + 163, 1, "E01CHQ010");
    fields[26] = fieldE01CHQ011 =
    new CharacterField(message, HEADERSIZE + 164, 1, "E01CHQ011");
    fields[27] = fieldE01CHQ012 =
    new CharacterField(message, HEADERSIZE + 165, 1, "E01CHQ012");
    fields[28] = fieldE01CHQ013 =
    new CharacterField(message, HEADERSIZE + 166, 1, "E01CHQ013");
    fields[29] = fieldE01CHQ014 =
    new CharacterField(message, HEADERSIZE + 167, 1, "E01CHQ014");
    fields[30] = fieldE01CHQ015 =
    new CharacterField(message, HEADERSIZE + 168, 1, "E01CHQ015");
    fields[31] = fieldE01CHQ016 =
    new CharacterField(message, HEADERSIZE + 169, 1, "E01CHQ016");
    fields[32] = fieldE01CHQ017 =
    new CharacterField(message, HEADERSIZE + 170, 1, "E01CHQ017");
    fields[33] = fieldE01CHQ018 =
    new CharacterField(message, HEADERSIZE + 171, 1, "E01CHQ018");
    fields[34] = fieldE01CHQ019 =
    new CharacterField(message, HEADERSIZE + 172, 1, "E01CHQ019");
    fields[35] = fieldE01CHQ020 =
    new CharacterField(message, HEADERSIZE + 173, 1, "E01CHQ020");
    fields[36] = fieldE01CHQ021 =
    new CharacterField(message, HEADERSIZE + 174, 1, "E01CHQ021");
    fields[37] = fieldE01CHQ022 =
    new CharacterField(message, HEADERSIZE + 175, 1, "E01CHQ022");
    fields[38] = fieldE01CHQ023 =
    new CharacterField(message, HEADERSIZE + 176, 1, "E01CHQ023");
    fields[39] = fieldE01CHQ024 =
    new CharacterField(message, HEADERSIZE + 177, 1, "E01CHQ024");
    fields[40] = fieldE01CHQ025 =
    new CharacterField(message, HEADERSIZE + 178, 1, "E01CHQ025");

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
  * Set field E01NROCTA using a String value.
  */
  public void setE01NROCTA(String newvalue)
  {
    fieldE01NROCTA.setString(newvalue);
  }

  /**
  * Get value of field E01NROCTA as a String.
  */
  public String getE01NROCTA()
  {
    return fieldE01NROCTA.getString();
  }

  /**
  * Set field E01CHEINI using a String value.
  */
  public void setE01CHEINI(String newvalue)
  {
    fieldE01CHEINI.setString(newvalue);
  }

  /**
  * Get value of field E01CHEINI as a String.
  */
  public String getE01CHEINI()
  {
    return fieldE01CHEINI.getString();
  }

  /**
  * Set numeric field E01CHEINI using a BigDecimal value.
  */
  public void setE01CHEINI(BigDecimal newvalue)
  {
    fieldE01CHEINI.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CHEINI as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CHEINI()
  {
    return fieldE01CHEINI.getBigDecimal();
  }

  /**
  * Set field E01NROSER using a String value.
  */
  public void setE01NROSER(String newvalue)
  {
    fieldE01NROSER.setString(newvalue);
  }

  /**
  * Get value of field E01NROSER as a String.
  */
  public String getE01NROSER()
  {
    return fieldE01NROSER.getString();
  }

  /**
  * Set numeric field E01NROSER using a BigDecimal value.
  */
  public void setE01NROSER(BigDecimal newvalue)
  {
    fieldE01NROSER.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01NROSER as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01NROSER()
  {
    return fieldE01NROSER.getBigDecimal();
  }

  /**
  * Set field E01NOMCLI using a String value.
  */
  public void setE01NOMCLI(String newvalue)
  {
    fieldE01NOMCLI.setString(newvalue);
  }

  /**
  * Get value of field E01NOMCLI as a String.
  */
  public String getE01NOMCLI()
  {
    return fieldE01NOMCLI.getString();
  }

  /**
  * Set field E01TIIDCL using a String value.
  */
  public void setE01TIIDCL(String newvalue)
  {
    fieldE01TIIDCL.setString(newvalue);
  }

  /**
  * Get value of field E01TIIDCL as a String.
  */
  public String getE01TIIDCL()
  {
    return fieldE01TIIDCL.getString();
  }

  /**
  * Set field E01NRIDCL using a String value.
  */
  public void setE01NRIDCL(String newvalue)
  {
    fieldE01NRIDCL.setString(newvalue);
  }

  /**
  * Get value of field E01NRIDCL as a String.
  */
  public String getE01NRIDCL()
  {
    return fieldE01NRIDCL.getString();
  }

  /**
  * Set field E01MONEDA using a String value.
  */
  public void setE01MONEDA(String newvalue)
  {
    fieldE01MONEDA.setString(newvalue);
  }

  /**
  * Get value of field E01MONEDA as a String.
  */
  public String getE01MONEDA()
  {
    return fieldE01MONEDA.getString();
  }

  /**
  * Set field E01CHQ001 using a String value.
  */
  public void setE01CHQ001(String newvalue)
  {
    fieldE01CHQ001.setString(newvalue);
  }

  /**
  * Get value of field E01CHQ001 as a String.
  */
  public String getE01CHQ001()
  {
    return fieldE01CHQ001.getString();
  }

  /**
  * Set field E01CHQ002 using a String value.
  */
  public void setE01CHQ002(String newvalue)
  {
    fieldE01CHQ002.setString(newvalue);
  }

  /**
  * Get value of field E01CHQ002 as a String.
  */
  public String getE01CHQ002()
  {
    return fieldE01CHQ002.getString();
  }

  /**
  * Set field E01CHQ003 using a String value.
  */
  public void setE01CHQ003(String newvalue)
  {
    fieldE01CHQ003.setString(newvalue);
  }

  /**
  * Get value of field E01CHQ003 as a String.
  */
  public String getE01CHQ003()
  {
    return fieldE01CHQ003.getString();
  }

  /**
  * Set field E01CHQ004 using a String value.
  */
  public void setE01CHQ004(String newvalue)
  {
    fieldE01CHQ004.setString(newvalue);
  }

  /**
  * Get value of field E01CHQ004 as a String.
  */
  public String getE01CHQ004()
  {
    return fieldE01CHQ004.getString();
  }

  /**
  * Set field E01CHQ005 using a String value.
  */
  public void setE01CHQ005(String newvalue)
  {
    fieldE01CHQ005.setString(newvalue);
  }

  /**
  * Get value of field E01CHQ005 as a String.
  */
  public String getE01CHQ005()
  {
    return fieldE01CHQ005.getString();
  }

  /**
  * Set field E01CHQ006 using a String value.
  */
  public void setE01CHQ006(String newvalue)
  {
    fieldE01CHQ006.setString(newvalue);
  }

  /**
  * Get value of field E01CHQ006 as a String.
  */
  public String getE01CHQ006()
  {
    return fieldE01CHQ006.getString();
  }

  /**
  * Set field E01CHQ007 using a String value.
  */
  public void setE01CHQ007(String newvalue)
  {
    fieldE01CHQ007.setString(newvalue);
  }

  /**
  * Get value of field E01CHQ007 as a String.
  */
  public String getE01CHQ007()
  {
    return fieldE01CHQ007.getString();
  }

  /**
  * Set field E01CHQ008 using a String value.
  */
  public void setE01CHQ008(String newvalue)
  {
    fieldE01CHQ008.setString(newvalue);
  }

  /**
  * Get value of field E01CHQ008 as a String.
  */
  public String getE01CHQ008()
  {
    return fieldE01CHQ008.getString();
  }

  /**
  * Set field E01CHQ009 using a String value.
  */
  public void setE01CHQ009(String newvalue)
  {
    fieldE01CHQ009.setString(newvalue);
  }

  /**
  * Get value of field E01CHQ009 as a String.
  */
  public String getE01CHQ009()
  {
    return fieldE01CHQ009.getString();
  }

  /**
  * Set field E01CHQ010 using a String value.
  */
  public void setE01CHQ010(String newvalue)
  {
    fieldE01CHQ010.setString(newvalue);
  }

  /**
  * Get value of field E01CHQ010 as a String.
  */
  public String getE01CHQ010()
  {
    return fieldE01CHQ010.getString();
  }

  /**
  * Set field E01CHQ011 using a String value.
  */
  public void setE01CHQ011(String newvalue)
  {
    fieldE01CHQ011.setString(newvalue);
  }

  /**
  * Get value of field E01CHQ011 as a String.
  */
  public String getE01CHQ011()
  {
    return fieldE01CHQ011.getString();
  }

  /**
  * Set field E01CHQ012 using a String value.
  */
  public void setE01CHQ012(String newvalue)
  {
    fieldE01CHQ012.setString(newvalue);
  }

  /**
  * Get value of field E01CHQ012 as a String.
  */
  public String getE01CHQ012()
  {
    return fieldE01CHQ012.getString();
  }

  /**
  * Set field E01CHQ013 using a String value.
  */
  public void setE01CHQ013(String newvalue)
  {
    fieldE01CHQ013.setString(newvalue);
  }

  /**
  * Get value of field E01CHQ013 as a String.
  */
  public String getE01CHQ013()
  {
    return fieldE01CHQ013.getString();
  }

  /**
  * Set field E01CHQ014 using a String value.
  */
  public void setE01CHQ014(String newvalue)
  {
    fieldE01CHQ014.setString(newvalue);
  }

  /**
  * Get value of field E01CHQ014 as a String.
  */
  public String getE01CHQ014()
  {
    return fieldE01CHQ014.getString();
  }

  /**
  * Set field E01CHQ015 using a String value.
  */
  public void setE01CHQ015(String newvalue)
  {
    fieldE01CHQ015.setString(newvalue);
  }

  /**
  * Get value of field E01CHQ015 as a String.
  */
  public String getE01CHQ015()
  {
    return fieldE01CHQ015.getString();
  }

  /**
  * Set field E01CHQ016 using a String value.
  */
  public void setE01CHQ016(String newvalue)
  {
    fieldE01CHQ016.setString(newvalue);
  }

  /**
  * Get value of field E01CHQ016 as a String.
  */
  public String getE01CHQ016()
  {
    return fieldE01CHQ016.getString();
  }

  /**
  * Set field E01CHQ017 using a String value.
  */
  public void setE01CHQ017(String newvalue)
  {
    fieldE01CHQ017.setString(newvalue);
  }

  /**
  * Get value of field E01CHQ017 as a String.
  */
  public String getE01CHQ017()
  {
    return fieldE01CHQ017.getString();
  }

  /**
  * Set field E01CHQ018 using a String value.
  */
  public void setE01CHQ018(String newvalue)
  {
    fieldE01CHQ018.setString(newvalue);
  }

  /**
  * Get value of field E01CHQ018 as a String.
  */
  public String getE01CHQ018()
  {
    return fieldE01CHQ018.getString();
  }

  /**
  * Set field E01CHQ019 using a String value.
  */
  public void setE01CHQ019(String newvalue)
  {
    fieldE01CHQ019.setString(newvalue);
  }

  /**
  * Get value of field E01CHQ019 as a String.
  */
  public String getE01CHQ019()
  {
    return fieldE01CHQ019.getString();
  }

  /**
  * Set field E01CHQ020 using a String value.
  */
  public void setE01CHQ020(String newvalue)
  {
    fieldE01CHQ020.setString(newvalue);
  }

  /**
  * Get value of field E01CHQ020 as a String.
  */
  public String getE01CHQ020()
  {
    return fieldE01CHQ020.getString();
  }

  /**
  * Set field E01CHQ021 using a String value.
  */
  public void setE01CHQ021(String newvalue)
  {
    fieldE01CHQ021.setString(newvalue);
  }

  /**
  * Get value of field E01CHQ021 as a String.
  */
  public String getE01CHQ021()
  {
    return fieldE01CHQ021.getString();
  }

  /**
  * Set field E01CHQ022 using a String value.
  */
  public void setE01CHQ022(String newvalue)
  {
    fieldE01CHQ022.setString(newvalue);
  }

  /**
  * Get value of field E01CHQ022 as a String.
  */
  public String getE01CHQ022()
  {
    return fieldE01CHQ022.getString();
  }

  /**
  * Set field E01CHQ023 using a String value.
  */
  public void setE01CHQ023(String newvalue)
  {
    fieldE01CHQ023.setString(newvalue);
  }

  /**
  * Get value of field E01CHQ023 as a String.
  */
  public String getE01CHQ023()
  {
    return fieldE01CHQ023.getString();
  }

  /**
  * Set field E01CHQ024 using a String value.
  */
  public void setE01CHQ024(String newvalue)
  {
    fieldE01CHQ024.setString(newvalue);
  }

  /**
  * Get value of field E01CHQ024 as a String.
  */
  public String getE01CHQ024()
  {
    return fieldE01CHQ024.getString();
  }

  /**
  * Set field E01CHQ025 using a String value.
  */
  public void setE01CHQ025(String newvalue)
  {
    fieldE01CHQ025.setString(newvalue);
  }

  /**
  * Get value of field E01CHQ025 as a String.
  */
  public String getE01CHQ025()
  {
    return fieldE01CHQ025.getString();
  }

}