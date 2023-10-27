package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from EBC010501 physical file definition.
* 
* File level identifier is 1100706173515.
* Record format level identifier is 352D8CCEA3F01.
*/

public class EBC010501Message extends MessageRecord
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
                                     "TIPDOC",
                                     "NUMNOM",
                                     "BCPFPA",
                                     "BCPFPM",
                                     "BCPFPD",
                                     "BCPFDA",
                                     "BCPFDM",
                                     "BCPFDD",
                                     "BCPFHA",
                                     "BCPFHM",
                                     "BCPFHD",
                                     "BCPVDA",
                                     "BCPVDM",
                                     "BCPVDD",
                                     "BCPVHA",
                                     "BCPVHM",
                                     "BCPVHD"
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
                                   "TIPDOC",
                                   "NUMNOM",
                                   "BCPFPA",
                                   "BCPFPM",
                                   "BCPFPD",
                                   "BCPFDA",
                                   "BCPFDM",
                                   "BCPFDD",
                                   "BCPFHA",
                                   "BCPFHM",
                                   "BCPFHD",
                                   "BCPVDA",
                                   "BCPVDM",
                                   "BCPVDD",
                                   "BCPVHA",
                                   "BCPVHM",
                                   "BCPVHD"
                                 };
  final static String fid = "1100706173515";
  final static String rid = "352D8CCEA3F01";
  final static String fmtname = "EBC010501";
  final int FIELDCOUNT = 26;
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
  private CharacterField fieldTIPDOC = null;
  private DecimalField fieldNUMNOM = null;
  private DecimalField fieldBCPFPA = null;
  private DecimalField fieldBCPFPM = null;
  private DecimalField fieldBCPFPD = null;
  private DecimalField fieldBCPFDA = null;
  private DecimalField fieldBCPFDM = null;
  private DecimalField fieldBCPFDD = null;
  private DecimalField fieldBCPFHA = null;
  private DecimalField fieldBCPFHM = null;
  private DecimalField fieldBCPFHD = null;
  private DecimalField fieldBCPVDA = null;
  private DecimalField fieldBCPVDM = null;
  private DecimalField fieldBCPVDD = null;
  private DecimalField fieldBCPVHA = null;
  private DecimalField fieldBCPVHM = null;
  private DecimalField fieldBCPVHD = null;

  /**
  * Constructor for EBC010501Message.
  */
  public EBC010501Message()
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
    fields[9] = fieldTIPDOC =
    new CharacterField(message, HEADERSIZE + 42, 2, "TIPDOC");
    fields[10] = fieldNUMNOM =
    new DecimalField(message, HEADERSIZE + 44, 7, 0, "NUMNOM");
    fields[11] = fieldBCPFPA =
    new DecimalField(message, HEADERSIZE + 51, 5, 0, "BCPFPA");
    fields[12] = fieldBCPFPM =
    new DecimalField(message, HEADERSIZE + 56, 3, 0, "BCPFPM");
    fields[13] = fieldBCPFPD =
    new DecimalField(message, HEADERSIZE + 59, 3, 0, "BCPFPD");
    fields[14] = fieldBCPFDA =
    new DecimalField(message, HEADERSIZE + 62, 5, 0, "BCPFDA");
    fields[15] = fieldBCPFDM =
    new DecimalField(message, HEADERSIZE + 67, 3, 0, "BCPFDM");
    fields[16] = fieldBCPFDD =
    new DecimalField(message, HEADERSIZE + 70, 3, 0, "BCPFDD");
    fields[17] = fieldBCPFHA =
    new DecimalField(message, HEADERSIZE + 73, 5, 0, "BCPFHA");
    fields[18] = fieldBCPFHM =
    new DecimalField(message, HEADERSIZE + 78, 3, 0, "BCPFHM");
    fields[19] = fieldBCPFHD =
    new DecimalField(message, HEADERSIZE + 81, 3, 0, "BCPFHD");
    fields[20] = fieldBCPVDA =
    new DecimalField(message, HEADERSIZE + 84, 5, 0, "BCPVDA");
    fields[21] = fieldBCPVDM =
    new DecimalField(message, HEADERSIZE + 89, 3, 0, "BCPVDM");
    fields[22] = fieldBCPVDD =
    new DecimalField(message, HEADERSIZE + 92, 3, 0, "BCPVDD");
    fields[23] = fieldBCPVHA =
    new DecimalField(message, HEADERSIZE + 95, 5, 0, "BCPVHA");
    fields[24] = fieldBCPVHM =
    new DecimalField(message, HEADERSIZE + 100, 3, 0, "BCPVHM");
    fields[25] = fieldBCPVHD =
    new DecimalField(message, HEADERSIZE + 103, 3, 0, "BCPVHD");

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
  * Set field TIPDOC using a String value.
  */
  public void setTIPDOC(String newvalue)
  {
    fieldTIPDOC.setString(newvalue);
  }

  /**
  * Get value of field TIPDOC as a String.
  */
  public String getTIPDOC()
  {
    return fieldTIPDOC.getString();
  }

  /**
  * Set field NUMNOM using a String value.
  */
  public void setNUMNOM(String newvalue)
  {
    fieldNUMNOM.setString(newvalue);
  }

  /**
  * Get value of field NUMNOM as a String.
  */
  public String getNUMNOM()
  {
    return fieldNUMNOM.getString();
  }

  /**
  * Set numeric field NUMNOM using a BigDecimal value.
  */
  public void setNUMNOM(BigDecimal newvalue)
  {
    fieldNUMNOM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field NUMNOM as a BigDecimal.
  */
  public BigDecimal getBigDecimalNUMNOM()
  {
    return fieldNUMNOM.getBigDecimal();
  }

  /**
  * Set field BCPFPA using a String value.
  */
  public void setBCPFPA(String newvalue)
  {
    fieldBCPFPA.setString(newvalue);
  }

  /**
  * Get value of field BCPFPA as a String.
  */
  public String getBCPFPA()
  {
    return fieldBCPFPA.getString();
  }

  /**
  * Set numeric field BCPFPA using a BigDecimal value.
  */
  public void setBCPFPA(BigDecimal newvalue)
  {
    fieldBCPFPA.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field BCPFPA as a BigDecimal.
  */
  public BigDecimal getBigDecimalBCPFPA()
  {
    return fieldBCPFPA.getBigDecimal();
  }

  /**
  * Set field BCPFPM using a String value.
  */
  public void setBCPFPM(String newvalue)
  {
    fieldBCPFPM.setString(newvalue);
  }

  /**
  * Get value of field BCPFPM as a String.
  */
  public String getBCPFPM()
  {
    return fieldBCPFPM.getString();
  }

  /**
  * Set numeric field BCPFPM using a BigDecimal value.
  */
  public void setBCPFPM(BigDecimal newvalue)
  {
    fieldBCPFPM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field BCPFPM as a BigDecimal.
  */
  public BigDecimal getBigDecimalBCPFPM()
  {
    return fieldBCPFPM.getBigDecimal();
  }

  /**
  * Set field BCPFPD using a String value.
  */
  public void setBCPFPD(String newvalue)
  {
    fieldBCPFPD.setString(newvalue);
  }

  /**
  * Get value of field BCPFPD as a String.
  */
  public String getBCPFPD()
  {
    return fieldBCPFPD.getString();
  }

  /**
  * Set numeric field BCPFPD using a BigDecimal value.
  */
  public void setBCPFPD(BigDecimal newvalue)
  {
    fieldBCPFPD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field BCPFPD as a BigDecimal.
  */
  public BigDecimal getBigDecimalBCPFPD()
  {
    return fieldBCPFPD.getBigDecimal();
  }

  /**
  * Set field BCPFDA using a String value.
  */
  public void setBCPFDA(String newvalue)
  {
    fieldBCPFDA.setString(newvalue);
  }

  /**
  * Get value of field BCPFDA as a String.
  */
  public String getBCPFDA()
  {
    return fieldBCPFDA.getString();
  }

  /**
  * Set numeric field BCPFDA using a BigDecimal value.
  */
  public void setBCPFDA(BigDecimal newvalue)
  {
    fieldBCPFDA.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field BCPFDA as a BigDecimal.
  */
  public BigDecimal getBigDecimalBCPFDA()
  {
    return fieldBCPFDA.getBigDecimal();
  }

  /**
  * Set field BCPFDM using a String value.
  */
  public void setBCPFDM(String newvalue)
  {
    fieldBCPFDM.setString(newvalue);
  }

  /**
  * Get value of field BCPFDM as a String.
  */
  public String getBCPFDM()
  {
    return fieldBCPFDM.getString();
  }

  /**
  * Set numeric field BCPFDM using a BigDecimal value.
  */
  public void setBCPFDM(BigDecimal newvalue)
  {
    fieldBCPFDM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field BCPFDM as a BigDecimal.
  */
  public BigDecimal getBigDecimalBCPFDM()
  {
    return fieldBCPFDM.getBigDecimal();
  }

  /**
  * Set field BCPFDD using a String value.
  */
  public void setBCPFDD(String newvalue)
  {
    fieldBCPFDD.setString(newvalue);
  }

  /**
  * Get value of field BCPFDD as a String.
  */
  public String getBCPFDD()
  {
    return fieldBCPFDD.getString();
  }

  /**
  * Set numeric field BCPFDD using a BigDecimal value.
  */
  public void setBCPFDD(BigDecimal newvalue)
  {
    fieldBCPFDD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field BCPFDD as a BigDecimal.
  */
  public BigDecimal getBigDecimalBCPFDD()
  {
    return fieldBCPFDD.getBigDecimal();
  }

  /**
  * Set field BCPFHA using a String value.
  */
  public void setBCPFHA(String newvalue)
  {
    fieldBCPFHA.setString(newvalue);
  }

  /**
  * Get value of field BCPFHA as a String.
  */
  public String getBCPFHA()
  {
    return fieldBCPFHA.getString();
  }

  /**
  * Set numeric field BCPFHA using a BigDecimal value.
  */
  public void setBCPFHA(BigDecimal newvalue)
  {
    fieldBCPFHA.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field BCPFHA as a BigDecimal.
  */
  public BigDecimal getBigDecimalBCPFHA()
  {
    return fieldBCPFHA.getBigDecimal();
  }

  /**
  * Set field BCPFHM using a String value.
  */
  public void setBCPFHM(String newvalue)
  {
    fieldBCPFHM.setString(newvalue);
  }

  /**
  * Get value of field BCPFHM as a String.
  */
  public String getBCPFHM()
  {
    return fieldBCPFHM.getString();
  }

  /**
  * Set numeric field BCPFHM using a BigDecimal value.
  */
  public void setBCPFHM(BigDecimal newvalue)
  {
    fieldBCPFHM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field BCPFHM as a BigDecimal.
  */
  public BigDecimal getBigDecimalBCPFHM()
  {
    return fieldBCPFHM.getBigDecimal();
  }

  /**
  * Set field BCPFHD using a String value.
  */
  public void setBCPFHD(String newvalue)
  {
    fieldBCPFHD.setString(newvalue);
  }

  /**
  * Get value of field BCPFHD as a String.
  */
  public String getBCPFHD()
  {
    return fieldBCPFHD.getString();
  }

  /**
  * Set numeric field BCPFHD using a BigDecimal value.
  */
  public void setBCPFHD(BigDecimal newvalue)
  {
    fieldBCPFHD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field BCPFHD as a BigDecimal.
  */
  public BigDecimal getBigDecimalBCPFHD()
  {
    return fieldBCPFHD.getBigDecimal();
  }

  /**
  * Set field BCPVDA using a String value.
  */
  public void setBCPVDA(String newvalue)
  {
    fieldBCPVDA.setString(newvalue);
  }

  /**
  * Get value of field BCPVDA as a String.
  */
  public String getBCPVDA()
  {
    return fieldBCPVDA.getString();
  }

  /**
  * Set numeric field BCPVDA using a BigDecimal value.
  */
  public void setBCPVDA(BigDecimal newvalue)
  {
    fieldBCPVDA.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field BCPVDA as a BigDecimal.
  */
  public BigDecimal getBigDecimalBCPVDA()
  {
    return fieldBCPVDA.getBigDecimal();
  }

  /**
  * Set field BCPVDM using a String value.
  */
  public void setBCPVDM(String newvalue)
  {
    fieldBCPVDM.setString(newvalue);
  }

  /**
  * Get value of field BCPVDM as a String.
  */
  public String getBCPVDM()
  {
    return fieldBCPVDM.getString();
  }

  /**
  * Set numeric field BCPVDM using a BigDecimal value.
  */
  public void setBCPVDM(BigDecimal newvalue)
  {
    fieldBCPVDM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field BCPVDM as a BigDecimal.
  */
  public BigDecimal getBigDecimalBCPVDM()
  {
    return fieldBCPVDM.getBigDecimal();
  }

  /**
  * Set field BCPVDD using a String value.
  */
  public void setBCPVDD(String newvalue)
  {
    fieldBCPVDD.setString(newvalue);
  }

  /**
  * Get value of field BCPVDD as a String.
  */
  public String getBCPVDD()
  {
    return fieldBCPVDD.getString();
  }

  /**
  * Set numeric field BCPVDD using a BigDecimal value.
  */
  public void setBCPVDD(BigDecimal newvalue)
  {
    fieldBCPVDD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field BCPVDD as a BigDecimal.
  */
  public BigDecimal getBigDecimalBCPVDD()
  {
    return fieldBCPVDD.getBigDecimal();
  }

  /**
  * Set field BCPVHA using a String value.
  */
  public void setBCPVHA(String newvalue)
  {
    fieldBCPVHA.setString(newvalue);
  }

  /**
  * Get value of field BCPVHA as a String.
  */
  public String getBCPVHA()
  {
    return fieldBCPVHA.getString();
  }

  /**
  * Set numeric field BCPVHA using a BigDecimal value.
  */
  public void setBCPVHA(BigDecimal newvalue)
  {
    fieldBCPVHA.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field BCPVHA as a BigDecimal.
  */
  public BigDecimal getBigDecimalBCPVHA()
  {
    return fieldBCPVHA.getBigDecimal();
  }

  /**
  * Set field BCPVHM using a String value.
  */
  public void setBCPVHM(String newvalue)
  {
    fieldBCPVHM.setString(newvalue);
  }

  /**
  * Get value of field BCPVHM as a String.
  */
  public String getBCPVHM()
  {
    return fieldBCPVHM.getString();
  }

  /**
  * Set numeric field BCPVHM using a BigDecimal value.
  */
  public void setBCPVHM(BigDecimal newvalue)
  {
    fieldBCPVHM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field BCPVHM as a BigDecimal.
  */
  public BigDecimal getBigDecimalBCPVHM()
  {
    return fieldBCPVHM.getBigDecimal();
  }

  /**
  * Set field BCPVHD using a String value.
  */
  public void setBCPVHD(String newvalue)
  {
    fieldBCPVHD.setString(newvalue);
  }

  /**
  * Get value of field BCPVHD as a String.
  */
  public String getBCPVHD()
  {
    return fieldBCPVHD.getString();
  }

  /**
  * Set numeric field BCPVHD using a BigDecimal value.
  */
  public void setBCPVHD(BigDecimal newvalue)
  {
    fieldBCPVHD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field BCPVHD as a BigDecimal.
  */
  public BigDecimal getBigDecimalBCPVHD()
  {
    return fieldBCPVHD.getBigDecimal();
  }

}
