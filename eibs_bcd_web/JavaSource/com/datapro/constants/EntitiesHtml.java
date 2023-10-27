package com.datapro.constants;

import datapro.eibs.beans.UserPos;

public class EntitiesHtml implements Entities   {
	
	private static final int RETAIL_ACCOUNT = 1;
	private static final int SAVING_ACCOUNT = 4;
	private static final int PARTICIPATION  = 6;
	private static final int LOANS			= 10;
	private static final int DEPOSITS 		= 11;
	private static final int FACTORING		= 100;
	private static final int CLIENT_PERSON  = 200;
	private static final int COLLATERALS  	= 300;
	private static final int PORTFOLIOS   	= 400;
	
	public static String getTitle(String type) {
		String title = "";
		if(type == null) type = "";
		if (type.equals(Entities.ENTITY_TYPE_ACCEPTANCES)){
			title = "Aceptaciones";
		} else if (type.equals(Entities.ENTITY_TYPE_BANK_REFERENCES)){
			title = "Referencias Bancarias";
		} else if (type.equals(Entities.ENTITY_TYPE_CUSTOMER_BENEFICIARIES)
			|| type.equals(Entities.ENTITY_TYPE_ACCOUNT_BENEFICIARIES)){
			title = "Beneficiarios";
		} else if (type.equals(Entities.ENTITY_TYPE_BOARD_OF_DIRECTORS)){
			title = "Junta Directiva";
		} else if (type.equals(Entities.ENTITY_TYPE_COLLATERAL_ADDRESS)){
			title = "Direcciones de Garantías";
		} else if (type.equals(Entities.ENTITY_TYPE_COMMERCIAL_REFERENCES)){
			title = "Referencias Comerciales";
		} else if (type.equals(Entities.ENTITY_TYPE_CONTACT)){
			title = "Contactos";
		} else if (type.equals(Entities.ENTITY_TYPE_SPOUSE)){
			title = "Conyugue";
		} else if (type.equals(Entities.ENTITY_TYPE_FAMILY_REFERENCES)){
			title = "Familiares";
		} else if (type.equals(Entities.ENTITY_TYPE_DEPENDENTS)){
			title = "Dependientes";
		} else if (type.equals(Entities.ENTITY_TYPE_CREDIT_LINE_AVALS)){
			title = "Avales de Línea de Crédito";
		} else if (type.equals(Entities.ENTITY_TYPE_CUSTOMER_ASSETS)){
			title = "Activos";
		} else if (type.equals(Entities.ENTITY_TYPE_CUSTOMER_LEGAL_REPRESENTATIVES)){
			title = "Representantes Legales";
		} else if (type.equals(Entities.ENTITY_TYPE_CUSTOMER_LIABILITIES)){
			title = "Pasivos";
		} else if (type.equals(Entities.ENTITY_TYPE_DISC_ECONOMIC_ACTIVITY)){
			title = "Actividad Económica";
		} else if (type.equals(Entities.ENTITY_TYPE_ACCOUNT_DOCUMENTS)){
			title = "Documentos";
		} else if (type.equals(Entities.ENTITY_TYPE_INSURANCE_BENEFICIARIES)){
			title = "Beneficiarios de Seguro";
		} else if (type.equals(Entities.ENTITY_TYPE_ACCOUNT_LEGAL_REPRESENTATIVES)){
			title = "Representantes Legales";
		} else if (type.equals(Entities.ENTITY_TYPE_MAILING_ADDRESS)){
			title = "Direcciones";
		} else if (type.equals(Entities.ENTITY_TYPE_MANAGERS_WITH_CREDIT)){
			title = "Supervisores con Crédito";
		} else if (type.equals(Entities.ENTITY_TYPE_PERSONAL_REFERENCE)){
			title = "Referencias Personales";
		} else if (type.equals(Entities.ENTITY_TYPE_SECONDARY_NAME_FOR_CREDIT)){
			title = "Segundo Nombre para Crédito";
		} else if (type.equals(Entities.ENTITY_TYPE_ACCOUNT_SIGNER)){
			title = "Firmantes";
		} else if (type.equals(Entities.ENTITY_TYPE_STOCK_HOLDER)){
			title = "Accionistas";
		} else if (type.equals(Entities.ENTITY_TYPE_ACCOUNT_HOLDERS)){
			title = "Otros Titulares";
		} else if (type.equals(Entities.ENTITY_TYPE_VALUE_OF_ASSETS)){
			title = "Valor de Activos";
		} else if (type.equals(Entities.ENTITY_TYPE_PORTFOLIO)){
			title = "Portafolio de Inversión";	
		}
		return title;
	}
	
	
	public static String getMenu(UserPos userPO) {
		String menu = "";
		
		if ("APPROVAL_INQ".equals(userPO.getPurpose()) || "APPROVAL".equals(userPO.getPurpose())) { 
			if("FACT".equals(userPO.getSource())){
				menu = "dft_a_opt";
			} else {
				switch (getOption(userPO.getOption())) {
					case RETAIL_ACCOUNT:
						menu = "rt_a_opt";
						break;
					case SAVING_ACCOUNT:
						menu = "sv_a_opt";
						break;
					case PARTICIPATION:
						menu = "cpar_a_opt";
						break;				
					case DEPOSITS:
						menu = "cd_a_opt";
						break;
					case  LOANS:
						if(!"FACT".equals(userPO.getSource())){
							menu = "ln_a_opt";
						}
						break;				
					case FACTORING:
						menu = "dft_a_opt";
						break;				
					case CLIENT_PERSON:
						menu = "client_ap_personal_opt";
						break;				
					case COLLATERALS:
						menu = "colla_A_opt";
						break;		
					case PORTFOLIOS:
						menu = "cus_a_port_opt";
						break;			
					default:
						menu = "client_ap_personal_opt";
						break;
				}
			}
			
		} else if ("INQUIRY".equals(userPO.getPurpose())) { 
			if("FACT".equals(userPO.getSource())){
				menu = "dft_i_opt";
			} else {
				switch (getOption(userPO.getOption())) {
					case RETAIL_ACCOUNT:
						menu = "rt_i_opt";
						break;
					case SAVING_ACCOUNT:
						menu = "sv_i_opt";
						break;
					case PARTICIPATION:
						menu = "cpar_i_opt";
						break;				
					case DEPOSITS:
						menu = "cd_i_opt";
						break;
					case  LOANS:
						if(!"FACT".equals(userPO.getSource())) {
							menu = "ln_i_1_opt";
						}
						break;				
					case FACTORING:
						menu = "dft_i_opt";
						break;				
					case CLIENT_PERSON:
						menu = "client_inq_personal_opt";
						break;				
					case COLLATERALS:
						menu = "colla_i_opt";
						break;	
					case PORTFOLIOS:
						menu = "cus_i_port_opt";
						break;		
					default:
						menu = "client_inq_corp_opt";
						break;
				}
			}
			
        } else {  
			if("FACT".equals(userPO.getSource())){
				menu = "dft_m_opt";
			} else {
				switch (getOption(userPO.getOption())) {
					case RETAIL_ACCOUNT:
						menu = "rt_m_opt";
						break;
					case SAVING_ACCOUNT:
						menu = "sv_m_opt";
						break;
					case PARTICIPATION:
						menu = "cpar_m_opt";
						break;				
					case DEPOSITS:
						menu = "cd_m_opt";
						break;
					case  LOANS:
						if(!"FACT".equals(userPO.getSource())) {
							menu = "ln_m_opt";
						}
						break;				
					case FACTORING:
						menu = "dft_m_opt";
						break;				
					case CLIENT_PERSON:
						menu = "client_personal_opt";
						break;				
					case COLLATERALS:
						menu = "colla_M_opt";
						break;		
					case PORTFOLIOS:
						menu = "cus_m_port_opt";
						break;		
					default:
						menu = "client_corp_opt";
						break;
				}
			}
        }
		return menu;
	}


	private static int getOption(String option) {
		int opt = 9999;
		if("RT".equals(option)){
			opt = RETAIL_ACCOUNT;
		} else if ("SV".equals(option)){
			opt = SAVING_ACCOUNT;
		} else if ("CP".equals(option)){
			opt = PARTICIPATION;
		} else if ("CD".equals(option)){
			opt = DEPOSITS;
		} else if ("LN".equals(option)){
			opt = LOANS;
		} else if ("DFT".equals(option)){
			opt = FACTORING;
		} else if ("CLIENT_P".equals(option)){
			opt = CLIENT_PERSON;
		} else if ("CO".equals(option)){
			opt = COLLATERALS;
		} else if ("PR".equals(option)){
			opt = PORTFOLIOS;	
		}
		return opt;
	}
}

