package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from EFRM00007 physical file definition.
* 
* File level identifier is 1170202115302.
* Record format level identifier is 4FB2F4C41BEF6.
*/

public class EFRM00007Message extends MessageRecord
{
  final static String fldnames[] = {
                                     "E07ACMACC",
                                     "E07CUMRTP",
                                     "E07CUMMA1",
                                     "E07CUMMA2",
                                     "E07CUMMA3",
                                     "E07CUMMA4",
                                     "E07CUMCTY",
                                     "E07CUMSTE",
                                     "E07CUMZPC",
                                     "E07CUMPOB",
                                     "E07CUMCTR",
                                     "E07CUMHPN",
                                     "E07CUMBNI",
                                     "E07CUMBSX",
                                     "E07CUMMST",
                                     "E07CUMRCN",
                                     "E07SIGLAM",
                                     "E07SIGTYP",
                                     "E07SIGCAT",
                                     "E07SIGFOR",
                                     "E07SIGCOM",
                                     "E07REPNAC",
                                     "E07REPCAR",
                                     "E07REPPRO",
                                     "E07REPDT1",
                                     "E07REPDT2",
                                     "E07REPDT3",
                                     "E07CUSPH1",
                                     "E07CUSPHN",
                                     "E07CUSIAD",
                                     "E07CUSSTF",
                                     "E07CUSINC",
                                     "E07CUSBUC",
                                     "E07CUSRBY",
                                     "E07CUFUC3",
                                     "E07CUSCP1",
                                     "E07CUSCP2",
                                     "E07CUSEDL",
                                     "E07CUSTIM",
                                     "E07CUSSOI",
                                     "E07CUMCOR",
                                     "E07CUMNM4",
                                     "E07CUMNM5",
                                     "E07CUSMUN",
                                     "E07CUSPAR",
                                     "E07CUSNA2",
                                     "E07CUSAPT",
                                     "E07CUSFLR",
                                     "E07CUMNME"
                                   };
  final static String tnames[] = {
                                   "accountNumber",
                                   "recordType",
                                   "legalName",
                                   "address1",
                                   "address2",
                                   "address3",
                                   "city",
                                   "state",
                                   "zipCode",
                                   "pobox",
                                   "country",
                                   "phoneNumber",
                                   "identification",
                                   "gender",
                                   "maritalStatusDesc",
                                   "relCustNumber",
                                   "amountLimit",
                                   "signerType",
                                   "signerCategory",
                                   "signerFormat",
                                   "signerComments",
                                   "nationality",
                                   "position",
                                   "profession",
                                   "birthDateDay",
                                   "birthDateMonth",
                                   "birthDateYear",
                                   "phoneCell",
                                   "phoneOffice",
                                   "email",
                                   "relationBank",
                                   "industryDesc",
                                   "businessCode",
                                   "referredBy",
                                   "positionDesc",
                                   "jobSiteCode",
                                   "addressJob",
                                   "nivelEducCode",
                                   "timeJob",
                                   "revenueSource",
                                   "cityDivDesc",
                                   "street",
                                   "homeApartment",
                                   "stateDivDesc",
                                   "addressSubDesc",
                                   "urbani",
                                   "apto",
                                   "floor",
                                   "descriptions"
                                 };
  final static String fid = "1170202115302";
  final static String rid = "4FB2F4C41BEF6";
  final static String fmtname = "EFRM00007";
  final int FIELDCOUNT = 49;
  private static Hashtable tlookup = new Hashtable();
  private DecimalField fieldE07ACMACC = null;
  private CharacterField fieldE07CUMRTP = null;
  private CharacterField fieldE07CUMMA1 = null;
  private CharacterField fieldE07CUMMA2 = null;
  private CharacterField fieldE07CUMMA3 = null;
  private CharacterField fieldE07CUMMA4 = null;
  private CharacterField fieldE07CUMCTY = null;
  private CharacterField fieldE07CUMSTE = null;
  private CharacterField fieldE07CUMZPC = null;
  private CharacterField fieldE07CUMPOB = null;
  private CharacterField fieldE07CUMCTR = null;
  private DecimalField fieldE07CUMHPN = null;
  private CharacterField fieldE07CUMBNI = null;
  private CharacterField fieldE07CUMBSX = null;
  private CharacterField fieldE07CUMMST = null;
  private DecimalField fieldE07CUMRCN = null;
  private DecimalField fieldE07SIGLAM = null;
  private CharacterField fieldE07SIGTYP = null;
  private CharacterField fieldE07SIGCAT = null;
  private CharacterField fieldE07SIGFOR = null;
  private CharacterField fieldE07SIGCOM = null;
  private CharacterField fieldE07REPNAC = null;
  private CharacterField fieldE07REPCAR = null;
  private CharacterField fieldE07REPPRO = null;
  private DecimalField fieldE07REPDT1 = null;
  private DecimalField fieldE07REPDT2 = null;
  private DecimalField fieldE07REPDT3 = null;
  private DecimalField fieldE07CUSPH1 = null;
  private DecimalField fieldE07CUSPHN = null;
  private CharacterField fieldE07CUSIAD = null;
  private CharacterField fieldE07CUSSTF = null;
  private CharacterField fieldE07CUSINC = null;
  private CharacterField fieldE07CUSBUC = null;
  private CharacterField fieldE07CUSRBY = null;
  private CharacterField fieldE07CUFUC3 = null;
  private CharacterField fieldE07CUSCP1 = null;
  private CharacterField fieldE07CUSCP2 = null;
  private CharacterField fieldE07CUSEDL = null;
  private DecimalField fieldE07CUSTIM = null;
  private CharacterField fieldE07CUSSOI = null;
  private CharacterField fieldE07CUMCOR = null;
  private CharacterField fieldE07CUMNM4 = null;
  private CharacterField fieldE07CUMNM5 = null;
  private CharacterField fieldE07CUSMUN = null;
  private CharacterField fieldE07CUSPAR = null;
  private CharacterField fieldE07CUSNA2 = null;
  private CharacterField fieldE07CUSAPT = null;
  private CharacterField fieldE07CUSFLR = null;
  private CharacterField fieldE07CUMNME = null;

  /**
  * Constructor for EFRM00007Message.
  */
  public EFRM00007Message()
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
    recordsize = 1715;
    fileid = fid;
    recordid = rid;
    message = new byte[getByteLength()];
    formatname = fmtname;
    fieldnames = fldnames;
    tagnames = tnames;
    fields = new MessageField[FIELDCOUNT];

    fields[0] = fieldE07ACMACC =
    new DecimalField(message, HEADERSIZE + 0, 13, 0, "accountNumber");
    fields[1] = fieldE07CUMRTP =
    new CharacterField(message, HEADERSIZE + 13, 1, "recordType");
    fields[2] = fieldE07CUMMA1 =
    new CharacterField(message, HEADERSIZE + 14, 60, "legalName");
    fields[3] = fieldE07CUMMA2 =
    new CharacterField(message, HEADERSIZE + 74, 45, "address1");
    fields[4] = fieldE07CUMMA3 =
    new CharacterField(message, HEADERSIZE + 119, 45, "address2");
    fields[5] = fieldE07CUMMA4 =
    new CharacterField(message, HEADERSIZE + 164, 45, "address3");
    fields[6] = fieldE07CUMCTY =
    new CharacterField(message, HEADERSIZE + 209, 45, "city");
    fields[7] = fieldE07CUMSTE =
    new CharacterField(message, HEADERSIZE + 254, 45, "state");
    fields[8] = fieldE07CUMZPC =
    new CharacterField(message, HEADERSIZE + 299, 15, "zipCode");
    fields[9] = fieldE07CUMPOB =
    new CharacterField(message, HEADERSIZE + 314, 10, "pobox");
    fields[10] = fieldE07CUMCTR =
    new CharacterField(message, HEADERSIZE + 324, 45, "country");
    fields[11] = fieldE07CUMHPN =
    new DecimalField(message, HEADERSIZE + 369, 16, 0, "phoneNumber");
    fields[12] = fieldE07CUMBNI =
    new CharacterField(message, HEADERSIZE + 385, 25, "identification");
    fields[13] = fieldE07CUMBSX =
    new CharacterField(message, HEADERSIZE + 410, 1, "gender");
    fields[14] = fieldE07CUMMST =
    new CharacterField(message, HEADERSIZE + 411, 45, "maritalStatusDesc");
    fields[15] = fieldE07CUMRCN =
    new DecimalField(message, HEADERSIZE + 456, 10, 0, "relCustNumber");
    fields[16] = fieldE07SIGLAM =
    new DecimalField(message, HEADERSIZE + 466, 17, 2, "amountLimit");
    fields[17] = fieldE07SIGTYP =
    new CharacterField(message, HEADERSIZE + 483, 45, "signerType");
    fields[18] = fieldE07SIGCAT =
    new CharacterField(message, HEADERSIZE + 528, 45, "signerCategory");
    fields[19] = fieldE07SIGFOR =
    new CharacterField(message, HEADERSIZE + 573, 45, "signerFormat");
    fields[20] = fieldE07SIGCOM =
    new CharacterField(message, HEADERSIZE + 618, 45, "signerComments");
    fields[21] = fieldE07REPNAC =
    new CharacterField(message, HEADERSIZE + 663, 45, "nationality");
    fields[22] = fieldE07REPCAR =
    new CharacterField(message, HEADERSIZE + 708, 45, "position");
    fields[23] = fieldE07REPPRO =
    new CharacterField(message, HEADERSIZE + 753, 45, "profession");
    fields[24] = fieldE07REPDT1 =
    new DecimalField(message, HEADERSIZE + 798, 3, 0, "birthDateDay");
    fields[25] = fieldE07REPDT2 =
    new DecimalField(message, HEADERSIZE + 801, 3, 0, "birthDateMonth");
    fields[26] = fieldE07REPDT3 =
    new DecimalField(message, HEADERSIZE + 804, 5, 0, "birthDateYear");
    fields[27] = fieldE07CUSPH1 =
    new DecimalField(message, HEADERSIZE + 809, 16, 0, "phoneCell");
    fields[28] = fieldE07CUSPHN =
    new DecimalField(message, HEADERSIZE + 825, 16, 0, "phoneOffice");
    fields[29] = fieldE07CUSIAD =
    new CharacterField(message, HEADERSIZE + 841, 60, "email");
    fields[30] = fieldE07CUSSTF =
    new CharacterField(message, HEADERSIZE + 901, 45, "relationBank");
    fields[31] = fieldE07CUSINC =
    new CharacterField(message, HEADERSIZE + 946, 45, "industryDesc");
    fields[32] = fieldE07CUSBUC =
    new CharacterField(message, HEADERSIZE + 991, 45, "businessCode");
    fields[33] = fieldE07CUSRBY =
    new CharacterField(message, HEADERSIZE + 1036, 45, "referredBy");
    fields[34] = fieldE07CUFUC3 =
    new CharacterField(message, HEADERSIZE + 1081, 45, "positionDesc");
    fields[35] = fieldE07CUSCP1 =
    new CharacterField(message, HEADERSIZE + 1126, 45, "jobSiteCode");
    fields[36] = fieldE07CUSCP2 =
    new CharacterField(message, HEADERSIZE + 1171, 45, "addressJob");
    fields[37] = fieldE07CUSEDL =
    new CharacterField(message, HEADERSIZE + 1216, 45, "nivelEducCode");
    fields[38] = fieldE07CUSTIM =
    new DecimalField(message, HEADERSIZE + 1261, 4, 0, "timeJob");
    fields[39] = fieldE07CUSSOI =
    new CharacterField(message, HEADERSIZE + 1265, 45, "revenueSource");
    fields[40] = fieldE07CUMCOR =
    new CharacterField(message, HEADERSIZE + 1310, 45, "cityDivDesc");
    fields[41] = fieldE07CUMNM4 =
    new CharacterField(message, HEADERSIZE + 1355, 80, "street");
    fields[42] = fieldE07CUMNM5 =
    new CharacterField(message, HEADERSIZE + 1435, 80, "homeApartment");
    fields[43] = fieldE07CUSMUN =
    new CharacterField(message, HEADERSIZE + 1515, 45, "stateDivDesc");
    fields[44] = fieldE07CUSPAR =
    new CharacterField(message, HEADERSIZE + 1560, 45, "addressSubDesc");
    fields[45] = fieldE07CUSNA2 =
    new CharacterField(message, HEADERSIZE + 1605, 45, "urbani");
    fields[46] = fieldE07CUSAPT =
    new CharacterField(message, HEADERSIZE + 1650, 15, "apto");
    fields[47] = fieldE07CUSFLR =
    new CharacterField(message, HEADERSIZE + 1665, 5, "floor");
    fields[48] = fieldE07CUMNME =
    new CharacterField(message, HEADERSIZE + 1670, 45, "descriptions");

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
  * Set field E07ACMACC using a String value.
  */
  public void setE07ACMACC(String newvalue)
  {
    fieldE07ACMACC.setString(newvalue);
  }

  /**
  * Get value of field E07ACMACC as a String.
  */
  public String getE07ACMACC()
  {
    return fieldE07ACMACC.getString();
  }

  /**
  * Set numeric field E07ACMACC using a BigDecimal value.
  */
  public void setE07ACMACC(BigDecimal newvalue)
  {
    fieldE07ACMACC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E07ACMACC as a BigDecimal.
  */
  public BigDecimal getBigDecimalE07ACMACC()
  {
    return fieldE07ACMACC.getBigDecimal();
  }

  /**
  * Set field E07CUMRTP using a String value.
  */
  public void setE07CUMRTP(String newvalue)
  {
    fieldE07CUMRTP.setString(newvalue);
  }

  /**
  * Get value of field E07CUMRTP as a String.
  */
  public String getE07CUMRTP()
  {
    return fieldE07CUMRTP.getString();
  }

  /**
  * Set field E07CUMMA1 using a String value.
  */
  public void setE07CUMMA1(String newvalue)
  {
    fieldE07CUMMA1.setString(newvalue);
  }

  /**
  * Get value of field E07CUMMA1 as a String.
  */
  public String getE07CUMMA1()
  {
    return fieldE07CUMMA1.getString();
  }

  /**
  * Set field E07CUMMA2 using a String value.
  */
  public void setE07CUMMA2(String newvalue)
  {
    fieldE07CUMMA2.setString(newvalue);
  }

  /**
  * Get value of field E07CUMMA2 as a String.
  */
  public String getE07CUMMA2()
  {
    return fieldE07CUMMA2.getString();
  }

  /**
  * Set field E07CUMMA3 using a String value.
  */
  public void setE07CUMMA3(String newvalue)
  {
    fieldE07CUMMA3.setString(newvalue);
  }

  /**
  * Get value of field E07CUMMA3 as a String.
  */
  public String getE07CUMMA3()
  {
    return fieldE07CUMMA3.getString();
  }

  /**
  * Set field E07CUMMA4 using a String value.
  */
  public void setE07CUMMA4(String newvalue)
  {
    fieldE07CUMMA4.setString(newvalue);
  }

  /**
  * Get value of field E07CUMMA4 as a String.
  */
  public String getE07CUMMA4()
  {
    return fieldE07CUMMA4.getString();
  }

  /**
  * Set field E07CUMCTY using a String value.
  */
  public void setE07CUMCTY(String newvalue)
  {
    fieldE07CUMCTY.setString(newvalue);
  }

  /**
  * Get value of field E07CUMCTY as a String.
  */
  public String getE07CUMCTY()
  {
    return fieldE07CUMCTY.getString();
  }

  /**
  * Set field E07CUMSTE using a String value.
  */
  public void setE07CUMSTE(String newvalue)
  {
    fieldE07CUMSTE.setString(newvalue);
  }

  /**
  * Get value of field E07CUMSTE as a String.
  */
  public String getE07CUMSTE()
  {
    return fieldE07CUMSTE.getString();
  }

  /**
  * Set field E07CUMZPC using a String value.
  */
  public void setE07CUMZPC(String newvalue)
  {
    fieldE07CUMZPC.setString(newvalue);
  }

  /**
  * Get value of field E07CUMZPC as a String.
  */
  public String getE07CUMZPC()
  {
    return fieldE07CUMZPC.getString();
  }

  /**
  * Set field E07CUMPOB using a String value.
  */
  public void setE07CUMPOB(String newvalue)
  {
    fieldE07CUMPOB.setString(newvalue);
  }

  /**
  * Get value of field E07CUMPOB as a String.
  */
  public String getE07CUMPOB()
  {
    return fieldE07CUMPOB.getString();
  }

  /**
  * Set field E07CUMCTR using a String value.
  */
  public void setE07CUMCTR(String newvalue)
  {
    fieldE07CUMCTR.setString(newvalue);
  }

  /**
  * Get value of field E07CUMCTR as a String.
  */
  public String getE07CUMCTR()
  {
    return fieldE07CUMCTR.getString();
  }

  /**
  * Set field E07CUMHPN using a String value.
  */
  public void setE07CUMHPN(String newvalue)
  {
    fieldE07CUMHPN.setString(newvalue);
  }

  /**
  * Get value of field E07CUMHPN as a String.
  */
  public String getE07CUMHPN()
  {
    return fieldE07CUMHPN.getString();
  }

  /**
  * Set numeric field E07CUMHPN using a BigDecimal value.
  */
  public void setE07CUMHPN(BigDecimal newvalue)
  {
    fieldE07CUMHPN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E07CUMHPN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE07CUMHPN()
  {
    return fieldE07CUMHPN.getBigDecimal();
  }

  /**
  * Set field E07CUMBNI using a String value.
  */
  public void setE07CUMBNI(String newvalue)
  {
    fieldE07CUMBNI.setString(newvalue);
  }

  /**
  * Get value of field E07CUMBNI as a String.
  */
  public String getE07CUMBNI()
  {
    return fieldE07CUMBNI.getString();
  }

  /**
  * Set field E07CUMBSX using a String value.
  */
  public void setE07CUMBSX(String newvalue)
  {
    fieldE07CUMBSX.setString(newvalue);
  }

  /**
  * Get value of field E07CUMBSX as a String.
  */
  public String getE07CUMBSX()
  {
    return fieldE07CUMBSX.getString();
  }

  /**
  * Set field E07CUMMST using a String value.
  */
  public void setE07CUMMST(String newvalue)
  {
    fieldE07CUMMST.setString(newvalue);
  }

  /**
  * Get value of field E07CUMMST as a String.
  */
  public String getE07CUMMST()
  {
    return fieldE07CUMMST.getString();
  }

  /**
  * Set field E07CUMRCN using a String value.
  */
  public void setE07CUMRCN(String newvalue)
  {
    fieldE07CUMRCN.setString(newvalue);
  }

  /**
  * Get value of field E07CUMRCN as a String.
  */
  public String getE07CUMRCN()
  {
    return fieldE07CUMRCN.getString();
  }

  /**
  * Set numeric field E07CUMRCN using a BigDecimal value.
  */
  public void setE07CUMRCN(BigDecimal newvalue)
  {
    fieldE07CUMRCN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E07CUMRCN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE07CUMRCN()
  {
    return fieldE07CUMRCN.getBigDecimal();
  }

  /**
  * Set field E07SIGLAM using a String value.
  */
  public void setE07SIGLAM(String newvalue)
  {
    fieldE07SIGLAM.setString(newvalue);
  }

  /**
  * Get value of field E07SIGLAM as a String.
  */
  public String getE07SIGLAM()
  {
    return fieldE07SIGLAM.getString();
  }

  /**
  * Set numeric field E07SIGLAM using a BigDecimal value.
  */
  public void setE07SIGLAM(BigDecimal newvalue)
  {
    fieldE07SIGLAM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E07SIGLAM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE07SIGLAM()
  {
    return fieldE07SIGLAM.getBigDecimal();
  }

  /**
  * Set field E07SIGTYP using a String value.
  */
  public void setE07SIGTYP(String newvalue)
  {
    fieldE07SIGTYP.setString(newvalue);
  }

  /**
  * Get value of field E07SIGTYP as a String.
  */
  public String getE07SIGTYP()
  {
    return fieldE07SIGTYP.getString();
  }

  /**
  * Set field E07SIGCAT using a String value.
  */
  public void setE07SIGCAT(String newvalue)
  {
    fieldE07SIGCAT.setString(newvalue);
  }

  /**
  * Get value of field E07SIGCAT as a String.
  */
  public String getE07SIGCAT()
  {
    return fieldE07SIGCAT.getString();
  }

  /**
  * Set field E07SIGFOR using a String value.
  */
  public void setE07SIGFOR(String newvalue)
  {
    fieldE07SIGFOR.setString(newvalue);
  }

  /**
  * Get value of field E07SIGFOR as a String.
  */
  public String getE07SIGFOR()
  {
    return fieldE07SIGFOR.getString();
  }

  /**
  * Set field E07SIGCOM using a String value.
  */
  public void setE07SIGCOM(String newvalue)
  {
    fieldE07SIGCOM.setString(newvalue);
  }

  /**
  * Get value of field E07SIGCOM as a String.
  */
  public String getE07SIGCOM()
  {
    return fieldE07SIGCOM.getString();
  }

  /**
  * Set field E07REPNAC using a String value.
  */
  public void setE07REPNAC(String newvalue)
  {
    fieldE07REPNAC.setString(newvalue);
  }

  /**
  * Get value of field E07REPNAC as a String.
  */
  public String getE07REPNAC()
  {
    return fieldE07REPNAC.getString();
  }

  /**
  * Set field E07REPCAR using a String value.
  */
  public void setE07REPCAR(String newvalue)
  {
    fieldE07REPCAR.setString(newvalue);
  }

  /**
  * Get value of field E07REPCAR as a String.
  */
  public String getE07REPCAR()
  {
    return fieldE07REPCAR.getString();
  }

  /**
  * Set field E07REPPRO using a String value.
  */
  public void setE07REPPRO(String newvalue)
  {
    fieldE07REPPRO.setString(newvalue);
  }

  /**
  * Get value of field E07REPPRO as a String.
  */
  public String getE07REPPRO()
  {
    return fieldE07REPPRO.getString();
  }

  /**
  * Set field E07REPDT1 using a String value.
  */
  public void setE07REPDT1(String newvalue)
  {
    fieldE07REPDT1.setString(newvalue);
  }

  /**
  * Get value of field E07REPDT1 as a String.
  */
  public String getE07REPDT1()
  {
    return fieldE07REPDT1.getString();
  }

  /**
  * Set numeric field E07REPDT1 using a BigDecimal value.
  */
  public void setE07REPDT1(BigDecimal newvalue)
  {
    fieldE07REPDT1.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E07REPDT1 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE07REPDT1()
  {
    return fieldE07REPDT1.getBigDecimal();
  }

  /**
  * Set field E07REPDT2 using a String value.
  */
  public void setE07REPDT2(String newvalue)
  {
    fieldE07REPDT2.setString(newvalue);
  }

  /**
  * Get value of field E07REPDT2 as a String.
  */
  public String getE07REPDT2()
  {
    return fieldE07REPDT2.getString();
  }

  /**
  * Set numeric field E07REPDT2 using a BigDecimal value.
  */
  public void setE07REPDT2(BigDecimal newvalue)
  {
    fieldE07REPDT2.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E07REPDT2 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE07REPDT2()
  {
    return fieldE07REPDT2.getBigDecimal();
  }

  /**
  * Set field E07REPDT3 using a String value.
  */
  public void setE07REPDT3(String newvalue)
  {
    fieldE07REPDT3.setString(newvalue);
  }

  /**
  * Get value of field E07REPDT3 as a String.
  */
  public String getE07REPDT3()
  {
    return fieldE07REPDT3.getString();
  }

  /**
  * Set numeric field E07REPDT3 using a BigDecimal value.
  */
  public void setE07REPDT3(BigDecimal newvalue)
  {
    fieldE07REPDT3.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E07REPDT3 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE07REPDT3()
  {
    return fieldE07REPDT3.getBigDecimal();
  }

  /**
  * Set field E07CUSPH1 using a String value.
  */
  public void setE07CUSPH1(String newvalue)
  {
    fieldE07CUSPH1.setString(newvalue);
  }

  /**
  * Get value of field E07CUSPH1 as a String.
  */
  public String getE07CUSPH1()
  {
    return fieldE07CUSPH1.getString();
  }

  /**
  * Set numeric field E07CUSPH1 using a BigDecimal value.
  */
  public void setE07CUSPH1(BigDecimal newvalue)
  {
    fieldE07CUSPH1.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E07CUSPH1 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE07CUSPH1()
  {
    return fieldE07CUSPH1.getBigDecimal();
  }

  /**
  * Set field E07CUSPHN using a String value.
  */
  public void setE07CUSPHN(String newvalue)
  {
    fieldE07CUSPHN.setString(newvalue);
  }

  /**
  * Get value of field E07CUSPHN as a String.
  */
  public String getE07CUSPHN()
  {
    return fieldE07CUSPHN.getString();
  }

  /**
  * Set numeric field E07CUSPHN using a BigDecimal value.
  */
  public void setE07CUSPHN(BigDecimal newvalue)
  {
    fieldE07CUSPHN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E07CUSPHN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE07CUSPHN()
  {
    return fieldE07CUSPHN.getBigDecimal();
  }

  /**
  * Set field E07CUSIAD using a String value.
  */
  public void setE07CUSIAD(String newvalue)
  {
    fieldE07CUSIAD.setString(newvalue);
  }

  /**
  * Get value of field E07CUSIAD as a String.
  */
  public String getE07CUSIAD()
  {
    return fieldE07CUSIAD.getString();
  }

  /**
  * Set field E07CUSSTF using a String value.
  */
  public void setE07CUSSTF(String newvalue)
  {
    fieldE07CUSSTF.setString(newvalue);
  }

  /**
  * Get value of field E07CUSSTF as a String.
  */
  public String getE07CUSSTF()
  {
    return fieldE07CUSSTF.getString();
  }

  /**
  * Set field E07CUSINC using a String value.
  */
  public void setE07CUSINC(String newvalue)
  {
    fieldE07CUSINC.setString(newvalue);
  }

  /**
  * Get value of field E07CUSINC as a String.
  */
  public String getE07CUSINC()
  {
    return fieldE07CUSINC.getString();
  }

  /**
  * Set field E07CUSBUC using a String value.
  */
  public void setE07CUSBUC(String newvalue)
  {
    fieldE07CUSBUC.setString(newvalue);
  }

  /**
  * Get value of field E07CUSBUC as a String.
  */
  public String getE07CUSBUC()
  {
    return fieldE07CUSBUC.getString();
  }

  /**
  * Set field E07CUSRBY using a String value.
  */
  public void setE07CUSRBY(String newvalue)
  {
    fieldE07CUSRBY.setString(newvalue);
  }

  /**
  * Get value of field E07CUSRBY as a String.
  */
  public String getE07CUSRBY()
  {
    return fieldE07CUSRBY.getString();
  }

  /**
  * Set field E07CUFUC3 using a String value.
  */
  public void setE07CUFUC3(String newvalue)
  {
    fieldE07CUFUC3.setString(newvalue);
  }

  /**
  * Get value of field E07CUFUC3 as a String.
  */
  public String getE07CUFUC3()
  {
    return fieldE07CUFUC3.getString();
  }

  /**
  * Set field E07CUSCP1 using a String value.
  */
  public void setE07CUSCP1(String newvalue)
  {
    fieldE07CUSCP1.setString(newvalue);
  }

  /**
  * Get value of field E07CUSCP1 as a String.
  */
  public String getE07CUSCP1()
  {
    return fieldE07CUSCP1.getString();
  }

  /**
  * Set field E07CUSCP2 using a String value.
  */
  public void setE07CUSCP2(String newvalue)
  {
    fieldE07CUSCP2.setString(newvalue);
  }

  /**
  * Get value of field E07CUSCP2 as a String.
  */
  public String getE07CUSCP2()
  {
    return fieldE07CUSCP2.getString();
  }

  /**
  * Set field E07CUSEDL using a String value.
  */
  public void setE07CUSEDL(String newvalue)
  {
    fieldE07CUSEDL.setString(newvalue);
  }

  /**
  * Get value of field E07CUSEDL as a String.
  */
  public String getE07CUSEDL()
  {
    return fieldE07CUSEDL.getString();
  }

  /**
  * Set field E07CUSTIM using a String value.
  */
  public void setE07CUSTIM(String newvalue)
  {
    fieldE07CUSTIM.setString(newvalue);
  }

  /**
  * Get value of field E07CUSTIM as a String.
  */
  public String getE07CUSTIM()
  {
    return fieldE07CUSTIM.getString();
  }

  /**
  * Set numeric field E07CUSTIM using a BigDecimal value.
  */
  public void setE07CUSTIM(BigDecimal newvalue)
  {
    fieldE07CUSTIM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E07CUSTIM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE07CUSTIM()
  {
    return fieldE07CUSTIM.getBigDecimal();
  }

  /**
  * Set field E07CUSSOI using a String value.
  */
  public void setE07CUSSOI(String newvalue)
  {
    fieldE07CUSSOI.setString(newvalue);
  }

  /**
  * Get value of field E07CUSSOI as a String.
  */
  public String getE07CUSSOI()
  {
    return fieldE07CUSSOI.getString();
  }

  /**
  * Set field E07CUMCOR using a String value.
  */
  public void setE07CUMCOR(String newvalue)
  {
    fieldE07CUMCOR.setString(newvalue);
  }

  /**
  * Get value of field E07CUMCOR as a String.
  */
  public String getE07CUMCOR()
  {
    return fieldE07CUMCOR.getString();
  }

  /**
  * Set field E07CUMNM4 using a String value.
  */
  public void setE07CUMNM4(String newvalue)
  {
    fieldE07CUMNM4.setString(newvalue);
  }

  /**
  * Get value of field E07CUMNM4 as a String.
  */
  public String getE07CUMNM4()
  {
    return fieldE07CUMNM4.getString();
  }

  /**
  * Set field E07CUMNM5 using a String value.
  */
  public void setE07CUMNM5(String newvalue)
  {
    fieldE07CUMNM5.setString(newvalue);
  }

  /**
  * Get value of field E07CUMNM5 as a String.
  */
  public String getE07CUMNM5()
  {
    return fieldE07CUMNM5.getString();
  }

  /**
  * Set field E07CUSMUN using a String value.
  */
  public void setE07CUSMUN(String newvalue)
  {
    fieldE07CUSMUN.setString(newvalue);
  }

  /**
  * Get value of field E07CUSMUN as a String.
  */
  public String getE07CUSMUN()
  {
    return fieldE07CUSMUN.getString();
  }

  /**
  * Set field E07CUSPAR using a String value.
  */
  public void setE07CUSPAR(String newvalue)
  {
    fieldE07CUSPAR.setString(newvalue);
  }

  /**
  * Get value of field E07CUSPAR as a String.
  */
  public String getE07CUSPAR()
  {
    return fieldE07CUSPAR.getString();
  }

  /**
  * Set field E07CUSNA2 using a String value.
  */
  public void setE07CUSNA2(String newvalue)
  {
    fieldE07CUSNA2.setString(newvalue);
  }

  /**
  * Get value of field E07CUSNA2 as a String.
  */
  public String getE07CUSNA2()
  {
    return fieldE07CUSNA2.getString();
  }

  /**
  * Set field E07CUSAPT using a String value.
  */
  public void setE07CUSAPT(String newvalue)
  {
    fieldE07CUSAPT.setString(newvalue);
  }

  /**
  * Get value of field E07CUSAPT as a String.
  */
  public String getE07CUSAPT()
  {
    return fieldE07CUSAPT.getString();
  }

  /**
  * Set field E07CUSFLR using a String value.
  */
  public void setE07CUSFLR(String newvalue)
  {
    fieldE07CUSFLR.setString(newvalue);
  }

  /**
  * Get value of field E07CUSFLR as a String.
  */
  public String getE07CUSFLR()
  {
    return fieldE07CUSFLR.getString();
  }

  /**
  * Set field E07CUMNME using a String value.
  */
  public void setE07CUMNME(String newvalue)
  {
    fieldE07CUMNME.setString(newvalue);
  }

  /**
  * Get value of field E07CUMNME as a String.
  */
  public String getE07CUMNME()
  {
    return fieldE07CUMNME.getString();
  }

}
