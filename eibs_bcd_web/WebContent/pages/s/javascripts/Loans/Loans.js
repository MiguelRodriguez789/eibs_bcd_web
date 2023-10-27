(function(EIBS ,$){
	if(typeof EIBS.UTILS !== 'object'){
		EIBS.UTILS = {
			updateTableCSS : function(table){
	 				$('#'+table+ ' tr:visible:odd').removeClass().addClass('trdark').css('background-color', getStyleCSS(".trdark","background-color"));
	 				$('#'+table+ ' tr:visible:even').removeClass().addClass('trclear').css('background-color',getStyleCSS(".trclear","background-color")); 
			},
	
			updateFlagX : function(elem , boolValue){
				 	getElement(elem).value = (boolValue) ? "X" : "";
			},	
				
			updateFlagY : function(elem , boolValue){
				 	getElement(elem).value = (boolValue) ? "Y" : "";
			},
			
			correctReadOnly : function(elem){
				if(typeof elem !== 'undefined'){
					$("#" + elem  + " input[readonly = 'false']").prop("readonly", false);
					$("#" + elem  + " select[disabled ='false']").prop("disabled", false);
				} else {
					$("input[readonly = 'false']").prop("readonly", false);
					$("select[disabled ='false']").prop("disabled", false);
				}
			}
		};
	}
	
	if(typeof EIBS.LOAN !== 'object'){
		EIBS.LOAN = (function(){  
			   
/////////////////////////////////////// Parameters OBJECT ///////////////////////////////////////////////			
			var Parameters = function(){
				this.CUN = "";
				this.ACC = ""
				this.FLOAT_TABLE = "";
				this.FLOAT_TYPE = "";
				this.SPREAD_RATE = "";
				this.FLOAT_RATE = "";
				this.FLOAT_PRIMARY = "";
				this.FLOAT_SECONDARY = "";
				this.TOTAL_RATE = "";
				this.EFCT_RATE = "";
				this.isNewLoan = false;
			};
			
			Parameters.prototype.setCUN = function (cun){
				this.CUN = cun;
				return this;
			};
			
			Parameters.prototype.setACC = function (accnum){
				this.ACC = accnum;
				return this;
			};	
			
			Parameters.prototype.setFloatTable = function (tbl){
				this.FLOAT_TABLE = tbl;
				return this;
			};
			
			Parameters.prototype.setFloatType = function (typ){
				this.FLOAT_TYPE = typ;
				return this;
			};		
			
			Parameters.prototype.setSpread = function (rate){
				this.SPREAD_RATE = rate;
				return this;
			};		
			
			Parameters.prototype.setFloatPrimary = function (rate){
				this.FLOAT_PRIMARY = rate;
				return this;
			};	
			
			Parameters.prototype.setFloatSecondary = function (rate){
				this.FLOAT_PRIMARY = rate;
				return this;
			};	
			
			Parameters.prototype.setLoanRate = function (rate){
				this.TOTAL_RATE = rate;
				return this;
			};	
			
			Parameters.prototype.setEffective = function (rate){
				this.EFCT_RATE = rate;
				return this;
			};
			
			Parameters.prototype.getEffective = function (rate){
				return this.EFCT_RATE;
			};
			
			Parameters.prototype.val = function (key){
				return this.hasOwnProperty(key) ? getElement(this[key]).value : "";
			};
			
			Parameters.prototype.clear = function(){
				this.CUN = "";
				this.ACC = ""
				this.FLOAT_TABLE = "";
				this.FLOAT_TYPE = "";
				this.SPREAD_RATE = "";
				this.FLOAT_RATE = "";
				this.FLOAT_PRIMARY = "";
				this.FLOAT_SECONDARY = "";
				this.TOTAL_RATE = "";
				this.EFCT_RATE = "";
				return this;
			};
			
/////////////////////////////////////// FLOAT RATE OBJECT ///////////////////////////////////////////////			
			var FloatRate = function(){
				//References to HTML Fields that  are related to rates of a Loan are stores as Object Property
				//Purpose of the this object is to change the CSS of the rate section and display
				//additional operations if permitted.
				
				this.flag = "";
				this.floatTable = "";
				this.floatType = ""; 
				this.row1FloatInfo = "";
				this.row2FloatInfo = "";
				this.spreadRate = "";
				this.floatOrg = "";
				this.floatRate = "";
				this.effectiveRate = "";
				this.primaryRate = "";
				this.secondaryRate = "";
				this.loanTotalRate = "";
				this.floatOperation = "";
				this.additionalRate = "";
				this.section = "";
				this.decLength = EIBS.currency.decimalLength();
			};
			
			FloatRate.prototype.setFlag = function (flg){
				this.flag = flg;
				return this;
			};
			
			FloatRate.prototype.setFloatTable = function (tbl){
				this.floatTable = tbl;
				return this;
			};	
			
			FloatRate.prototype.setFloatType = function (typ){
				this.floatType = typ;
				return this;
			};	
			
			FloatRate.prototype.setRow1 = function (row){
				this.row1FloatInfo = row;
				return this;
			};		
			
			FloatRate.prototype.setRow2 = function (row){
				this.row2FloatInfo = row;
				return this;
			};						
			
			FloatRate.prototype.setSpread = function (rate){
				this.spreadRate = rate;
				return this;
			};		
			
			FloatRate.prototype.setFloatPrimary = function (rate){
				this.primaryRate = rate;
				return this;
			};	
			
			FloatRate.prototype.setFloatSecondary = function (rate){
				this.secondaryRate = rate;
				return this;
			};	
			
			FloatRate.prototype.setFloatNominal = function (rate){
				this.floatOrg = rate;
				return this;
			};	
			
			FloatRate.prototype.setFloat = function (rate){
				this.floatRate = rate;
				return this;
			};	
			
			FloatRate.prototype.setEffective = function (rate){
				this.effectiveRate = rate;
				return this;
			};					
			
			FloatRate.prototype.setAddRate = function (rate){
				this.additionalRate = rate;
				return this;
			};			
			
			FloatRate.prototype.setTotalRate = function (rate){
				this.loanTotalRate = rate;
				return this;
			};
			
			FloatRate.prototype.setFloatOpt = function (opt){
				this.floatOperation = opt;
				return this;
			};
			
			FloatRate.prototype.setSection = function (opt){
				this.section = opt;
				return this;
			};			
			
			FloatRate.prototype.val = function (key){
				return this.hasOwnProperty(key) ? getElement(this[key]).value : "";
			};
			
			FloatRate.isRateFlagActive = function(flag, val){
				if(isNumeric(val)){
					return parseInt(getElement(flag).value) == val  ;
				} else {
					return parseInt(getElement(flag).value) == 2 ;
				}
			};
			
			FloatRate.prototype.isRateFlagActive = function(value){
				return FloatRate.isRateFlagActive(this.flag, value);
			};
			
			FloatRate.isRateFlagNull = function(flag){
				return !isValidObject(getElement(flag));
			};
			
			FloatRate.prototype.isRateFlagNull = function(){
				return FloatRate.isRateFlagNull(this.flag);
			};
			
			FloatRate.isType = function(type, val){
				return getElement(type).value == val;
			};
			
			FloatRate.prototype.isType = function(value){
				return FloatRate.isType(this.floatType, value);
			};	
			
			FloatRate.setReadonlyRates = function($this){
				$("input[name='" + $this.floatOrg +"']").prop('readonly', true).prop( "onchange", null ).off('change');
				$("input[name='" + $this.floatRate +"']").prop('readonly', true).prop( "onchange", null ).off('change');
				$("input[name='" + $this.effectiveRate + "']").prop('readonly', true).prop( "onchange", null ).off('change');
				$("input[name='" + $this.spreadRate +"']").prop('readonly', true).prop( "onchange", null ).off('change');
				$("input[name='" + $this.loanTotalRate +"']").prop('readonly', true).prop( "onchange", null ).off('change');
			}
			
			FloatRate.prototype.setReadonlyRates = function(){
				return FloatRate.setReadonlyRates(this);
			};				
			
			FloatRate.chgRate = function ($this){
				var vlr = 0;
				// Tasa Efectiva Anual
				if (isValidObject(getElement($this.effectiveRate))) {
					getElement($this.effectiveRate).value = String(vlr.toFixed($this.decLength));
				}
			}
			
			FloatRate.prototype.chgRate = function(){
				return FloatRate.chgRate(this);
			};					
			
			
			FloatRate.chgEfRate = function($this){
				var vlr = 0; 
				// Tabla Tasa Flotante
				if (isValidObject(getElement($this.floatTable)) && isValidObject(getElement($this.floatType))) {
					getElement($this.floatTable).value = '';
					getElement($this.floatType).value = '';
				}
				// Tasa Flotante 
				if (isValidObject(getElement($this.floatRate))) {
					getElement($this.floatRate).value = String(vlr.toFixed($this.decLength));
				}
				// Tasa Interes/Spread
				if (isValidObject(getElement($this.spreadRate))) {
					getElement($this.spreadRate).value = String(vlr.toFixed($this.decLength));       
				}
				// Tasa Nominal del Prestamo
				if (isValidObject(getElement($this.loanTotalRate))) {
					getElement($this.loanTotalRate).value = String(vlr.toFixed($this.decLength));       
				}
			};
			
			FloatRate.prototype.chgEfRate = function(){
				return FloatRate.chgEfRate(this);
			};				
			
			FloatRate.rateDisplay = function(productRate){
				var def = 0;
				//Checks Value of Flag to determine if Additional Operation is Required.
				//Flag ==2, show two additional rows in Table
				getElement(productRate.floatRate).readOnly = true;
				
				if(isValidObject(getElement(productRate.row1FloatInfo)) ){
					if( productRate.isRateFlagNull() || (trim(getElement(productRate.floatTable).value) == "")){ 
						getElement(productRate.row1FloatInfo).style.display = 'none';
						getElement(productRate.row2FloatInfo).style.display = 'none';
						getElement(productRate.spreadRate).readOnly = false;
						
					} else if( !productRate.isRateFlagNull() && productRate.isRateFlagActive(2)){
						getElement(productRate.row1FloatInfo).style.display = 'table-row';
						getElement(productRate.row2FloatInfo).style.display = 'table-row';
						getElement(productRate.spreadRate).readOnly = true;
						EIBS.UTILS.updateTableCSS(productRate.section);
						
					} else if( !productRate.isRateFlagNull() &&  productRate.isRateFlagActive(1) ){
						getElement(productRate.row1FloatInfo).style.display = 'none';
						getElement(productRate.row2FloatInfo).style.display = 'none';			
						
					} else {
						getElement(productRate.row1FloatInfo).style.display = 'none';
						getElement(productRate.row2FloatInfo).style.display = 'none';
						getElement(productRate.spreadRate).readOnly = false;
					}
					
					//Determines value of Floating Rate and which field based on Flag
					//FS = Secondary. FP = Primary Rate. These are acquired from HELP
					//Rate Flag is 2, Allows Additional Floating Rate Operations
					//Rate Flag != 2, normal Rate Operations (*poor value choices by backend)
					
					if(productRate.isType("FS")  && productRate.isRateFlagActive(2)){
						getElement(productRate.floatOrg).value = getElement(productRate.secondaryRate).value;
						
					}else if (productRate.isType("FP") && productRate.isRateFlagActive(2)){
						getElement(productRate.floatOrg).value = getElement(productRate.primaryRate).value;
						
					}else if (productRate.isType("FS") && productRate.isRateFlagActive(1)){
						getElement(productRate.effectiveRate).value = getElement(productRate.secondaryRate).value;			
						
					}else if (productRate.isType("FP")  && productRate.isRateFlagActive(1)){
						getElement(productRate.effectiveRate).value = getElement(productRate.primaryRate).value;			
					
					}else if (productRate.isType("FS")  && !productRate.isRateFlagActive(2)){
						getElement(productRate.floatRate).value = getElement(productRate.secondaryRate).value;
					
					}else if(productRate.isType("FP")  && !productRate.isRateFlagActive(2) ){
						getElement(productRate.floatRate).value = getElement(productRate.primaryRate).value;
					
					}else if(productRate.isType(" ") && productRate.isRateFlagActive(2) ){
						getElement(productRate.floatOrg).value = String(def.toFixed( EIBS.currency.decimalLength()));
						
					}else if(productRate.isType(" ") && productRate.isRateFlagActive(1) ){
						getElement(productRate.effectiveRate).value = String(def.toFixed( EIBS.currency.decimalLength()));			
					
					}else if(productRate.isType(" ") && !productRate.isRateFlagActive(2) ){
						getElement(productRate.floatRate).value = String(def.toFixed( EIBS.currency.decimalLength()));
					}
					
					if(!window.EIBS.isNewLoan()) {
						productRate.setReadonlyRates(productRate);
					}
				}
			};			
			
			FloatRate.prototype.rateDisplay = function(){
				return FloatRate.rateDisplay(this);
			};
			
////////////////////////////////////////////Return////////////////////////////////////////////////////////////			
			return {
				Parameters : Parameters,
				FloatRate : FloatRate
			};
		})();
	}
})(window.EIBS =  typeof window.EIBS !== 'undefined' ? window.EIBS : {} , jQuery);
