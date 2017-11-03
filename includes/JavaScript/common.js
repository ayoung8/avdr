function validateA_Z( strValue ) {
/************************************************
DESCRIPTION: Validates that a string contains A to Z, a to z, 1 to 9, and _ .
    
PARAMETERS:
   strValue - String to be tested for validity
   
RETURNS:
   True if valid, otherwise false.
******************************************************************************/
  var objRegExp  = /^(\w)*$/;
 				  	
  //check for integer characters
  return objRegExp.test(strValue);
}


function trim(inputString) 
{
   // Removes leading and trailing spaces from the passed string. Also
   // removes consecutive spaces and replaces it with one space.
   var retValue = inputString;
   var ch = retValue.substring(0, 1);
   while (ch == " ") 
   { // Check for spaces at the beginning of the string
      retValue = retValue.substring(1, retValue.length);
      ch = retValue.substring(0, 1);
   }
   ch = retValue.substring(retValue.length-1, retValue.length);
   while (ch == " ") 
   { // Check for spaces at the end of the string
      retValue = retValue.substring(0, retValue.length-1);
      ch = retValue.substring(retValue.length-1, retValue.length);
   }
   while (retValue.indexOf("  ") != -1) 
   { // Note that there are two spaces in the string - look for multiple spaces within the string
      retValue = retValue.substring(0, retValue.indexOf("  ")) + retValue.substring(retValue.indexOf("  ")+1, retValue.length); // Again, there are two spaces in each of the strings
   }
   return retValue; // Return the trimmed string back to the user
} // Ends the "trim" function


function mask (InString, Mask)  {
   if (((InString.length ==0) || (Mask.length ==0)) || (InString.length!= Mask.length))
     return false;
   TempString=""
   for (Count=0; Count<=InString.length; Count++)  {
     StrChar = InString.substring(Count, Count+1);
     MskChar = Mask.substring(Count, Count+1);
     if (MskChar=='#')
     {
       if(isNaN(StrChar))
         return false;
     }
     else if (MskChar=='*') {
     }
     else {
       if (MskChar!=StrChar)
         return false;
     }
   }
   return true;
}


function ValidDate(fldDate,fldName)  {

	if ((mask(fldName.value, "####.##.##") == true) | (mask(fldName.value,"####.#.##") == true) | (mask(fldName.value, "####.#.#") == true) | (mask(fldName.value,"####.##.#") == true))
	{
		var myArray=fldDate.split(".");
		var fldNewDate = myArray[1] + '-' + myArray[2] + '-' + myArray[0]
		var myDate=new Date(fldNewDate);
		var fldDateDay = myArray[2];
		var fldDateMnth = myArray[1];
		var fldDateYear = myDate.getFullYear();
	
		if(isNaN(myDate))
		{
			//send msg to user and erase field
			fldName.value = '';
  		    alert("Date is out of range.");
		} 
		else
		{
			//check to see if day or month is out of range
			//increase year portion of fldDateYear > 2020 as Oracle allows
			if ( (fldDateDay > 31) || (fldDateMnth > 12) || (fldDateYear > 2220) || (fldDateYear < 1900) 
				|| (fldDateMnth == 1 && fldDateDay > 31) || (fldDateMnth == 2 && fldDateDay > 28)
				|| (fldDateMnth == 3 && fldDateDay > 31) || (fldDateMnth == 4 && fldDateDay > 30) || (fldDateMnth == 5 && fldDateDay > 31)
				|| (fldDateMnth == 6 && fldDateDay > 30) || (fldDateMnth == 7 && fldDateDay > 31) || (fldDateMnth == 8 && fldDateDay > 31)
				|| (fldDateMnth == 9 && fldDateDay > 30) || (fldDateMnth == 10 && fldDateDay > 31) || (fldDateMnth == 11 && fldDateDay > 30)
				|| (fldDateMnth == 12 && fldDateDay > 31)  )
			{
				fldName.value = '';
			    alert("Date is out of range.");
			}
			else
			{
			    fldName.value = fldDateYear + '.';
			    if (fldDateMnth.length < 2)
				  fldName.value = fldName.value + '0' + fldDateMnth + '.'
				else
				  fldName.value = fldName.value + fldDateMnth + '.';
				if (fldDateDay.length < 2)
				  fldName.value = fldName.value + '0' + fldDateDay
				else
				  fldName.value = fldName.value + fldDateDay;
			}
		}
	}
	else
	{
        if(fldName.value.length > 0)
        {
 		  fldName.value = '';
		  alert("Please enter a date using the YYYY.MM.DD format.");
		  return false;
        }
    }
	return true;
}

function toggleT(_w,_h) {
  if (document.all) { // is IE
    if (_h=='s') eval("document.all."+_w+".style.display='inline';");
    if (_h=='h') eval("document.all."+_w+".style.display='none';");
  } else { // is NS
    if (_h=='s') eval("document.layers['"+_w+"'].display='inline';");
    if (_h=='h') eval("document.layers['"+_w+"'].display='none';");
  }
}

function ShowDiv(toggle,togglenext,bgtoggle)
{
  if (document.all.Tab1Label + "" != "undefined")
  {
    toggleT('Tab1','h');
    Tab1Label.style.color='white';
    document.all.Tab1Table.style.background='#336699';
  }
  if (document.all.Tab2Label + "" != "undefined")
  {
    toggleT('Tab2','h');
    Tab2Label.style.color='white';
    document.all.Tab2Table.style.background='#336699';
  }
  if (document.all.Tab3Label + "" != "undefined")
  {
    toggleT('Tab3','h');
    Tab3Label.style.color='white';
    document.all.Tab3Table.style.background='#336699';
  }
  if (document.all.Tab4Label + "" != "undefined")
  {
    toggleT('Tab4','h');
    Tab4Label.style.color='white';
    document.all.Tab4Table.style.background='#336699';
  }
  if (document.all.Tab5Label + "" != "undefined")
  {
    toggleT('Tab5','h');
    Tab5Label.style.color='white';
    document.all.Tab5Table.style.background='#336699';
  }
  if (document.all.Tab6Label + "" != "undefined")
  {
    toggleT('Tab6','h');
    Tab6Label.style.color='white';
    document.all.Tab6Table.style.background='#336699';
  }
  if (document.all.Tab7Label + "" != "undefined")
  {
    toggleT('Tab7','h');
    Tab7Label.style.color='white';
    document.all.Tab7Table.style.background='#336699';
  }
  if (document.all.Tab8Label + "" != "undefined")
  {
    toggleT('Tab8','h');
    Tab8Label.style.color='white';
    document.all.Tab8Table.style.background='#336699';
  }
  if (document.all.Tab9Label + "" != "undefined")
  {
    toggleT('Tab9','h');
    Tab9Label.style.color='white';
    document.all.Tab9Table.style.background='#336699';
  }					
  if (document.all.Tab10Label + "" != "undefined")
  {
    toggleT('Tab10','h');
    Tab10Label.style.color='white';
    document.all.Tab10Table.style.background='#336699';
  }					
  if (document.all.Tab11Label + "" != "undefined")
  {
    toggleT('Tab11','h');
    Tab11Label.style.color='white';
    document.all.Tab11Table.style.background='#336699';
  }					
  toggleT(toggle,'s');
  togglenext.style.color='#F8F400'; 
  bgtoggle.style.background='#408080';
}

function textCounter(field,maxlimit)
{
  if (field.value.length > maxlimit)
    field.value = field.value.substring(0, maxlimit);
}

function isNumber(formfield,maxvalue) {
	var data = formfield.value
			
	stripSpaces(formfield);
	
	if ((isNaN(data))) {
		alert("Only numeric values are permitted in this field.");
		formfield.focus();
		formfield.select();
		return (false);
	}
	else 
		if (data > maxvalue) {
		  alert("Your value is bigger than the maximum value of " + maxvalue)
		  formfield.value = '';
		  return false;
		}
	return true;
}


function stripSpaces(formfield) {
	x = formfield.value;
	while (x.substring(0,1) == ' ') x = x.substring(1);
	while (x.substring(x.length-1,x.length) == ' ') x = x.substring(0,x.length-1);
	formfield.value = x
}	
