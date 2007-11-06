            function validation() {

                alert('green ' + document.getElementById('greenCoffee').value + '\nsize ' + document.getElementById('size').value + '\nflaw ' + document.getElementById('flaw').value + '\ntasting ' + document.getElementById('tasting').value);

                var header = "<bean:message key="warning.information"/>\n\n";
                var vGreen = 0;
                var vGreen2 = 0;
                var testGreen = 1;
                var green = "<bean:message key="tab.greenCoffee" />";
                var greenType = "<bean:message key="warning.incorrecttype"/>";

                //VALIDATION DE CAFE
                if (document.getElementById('humidity').innerHTML=="" && document.getElementById('color').innerHTML=="" && document.getElementById('smell').innerHTML=="" && document.getElementById('denseness').innerHTML=="" && document.getElementById('uniformity').innerHTML=="") {
                    testGreen = 0;
                    document.getElementById('greenCoffee').value = "false";
                    if (document.getElementById('size').value == 'true' || document.getElementById('flaw').value == 'true') {
                        green += "\n<bean:message key="warning.nothingButTest"/>";
                        testGreen = -1;
                    }
                }
                else {
                    document.getElementById('greenCoffee').value = "true";
                    if (document.getElementById('humidity').innerHTML=="") {
                        green += "\n- <bean:message key="warningGreencoffee.humidity"/>";	
                        vGreen = 1;
                    }
                    if (document.getElementById('color').innerHTML=="") {
                        green += "\n- <bean:message key="warningGreencoffee.color"/>";	
                        vGreen = 1;
                    }
                    if (document.getElementById('smell').innerHTML=="") {
                        green += "\n- <bean:message key="warningGreencoffee.smell"/>";	
                        vGreen = 1;
                    }
                    if (document.getElementById('denseness').innerHTML=="") {
                        green += "\n- <bean:message key="warningGreencoffee.denseness"/>";	
                        vGreen = 1;
                    }
                    if (document.getElementById('uniformity').innerHTML=="") {
                        green += "\n- <bean:message key="warningGreencoffee.uniformity"/>";	
                        vGreen = 1;
                    }
                    if (!verif_numeric(document.getElementById('humidity').innerHTML) && document.getElementById('humidity').value != "") {
                        greenType += "\n- <bean:message key="warning.valueattribuated"/> <bean:message key="greenCoffee.humidity"/> <bean:message key="warning.notnumber"/>";
                        vGreen2 = 1;
                    }
                    if (!verif_numeric(document.getElementById('denseness').innerHTML) && document.getElementById('denseness').value != "") {
                        greenType += "\n- <bean:message key="warning.valueattribuated"/> <bean:message key="greenCoffee.denseness"/> <bean:message key="warning.notnumber"/>";
                        vGreen2 = 1;
                    }
                    if (verif_numeric(document.getElementById('color').value) && document.getElementById('color').value != "") {
                        greenType += "\n- <bean:message key="warning.valueattribuated"/> <bean:message key="greenCoffee.color"/> <bean:message key="warning.notString"/>";
                        vGreen2 = 1;
                    }
                    if (verif_numeric(document.getElementById('smell').value) && document.getElementById('smell').value != "") {
                        greenType += "\n- <bean:message key="warning.valueattribuated"/> <bean:message key="greenCoffee.smell"/> <bean:message key="warning.notString"/>";
                        vGreen2 = 1;
                    }
                    if (verif_numeric(document.getElementById('uniformity').value) && document.getElementById('uniformity').value != "") {
                        greenType += "\n- <bean:message key="warning.valueattribuated"/> <bean:message key="greenCoffee.uniformity"/> <bean:message key="warning.notString"/>";
                        vGreen2 = 1;
                    }
                    if (vGreen2 == 1) green += "\n" + greenType;
                    if (vGreen  == 0 && vGreen2 == 0 && testGreen == 1) testGreen = 2;
                }
                //FIN DE VALIDATION DE CAFE


                //VALIDATION TAILLE
                var sizeType = "<bean:message key="warning.incorrecttype"/>";
                var sizeValue = "<bean:message key="warning.incorrectvalue"/>";   
                var size = "<bean:message key="tab.size"/>"

                var vSize = 0;
                var vSize2 = 0;
                var vSize3 = 0;
                var testSize = 0;

                for (i=21;i>=12;i--) {                        
                    id = document.getElementById(i).innerHTML;
                    if (id != "") {testSize = 1;}
                } 
                if (testSize == 0) {
                    document.getElementById('size').value = "false";
                    if (document.getElementById('greenCoffee').value == 'true' || document.getElementById('flaw').value == 'true') {
                        size += "\n<bean:message key="warning.nothingButTest"/>";
                        testSize = -1;
                    }
                }
                else {
                    document.getElementById('size').value = "true";
                    for (i=21;i>=12;i--) {                        
                        id = document.getElementById(i).innerHTML;
                        if (id=="") {
                            size += "\n- " + i +" <bean:message key="warning.needtobefilled"/>";	
                            vSize = 1;
                        }
                        else { 
                            if(!verif_numeric(id)) {
                                sizeType += "\n- <bean:message key="warning.valueattribuated"/> " + i + " <bean:message key="warning.notnumber"/>";	
                                vSize2 = 1;
                            }
                            else {
                                if(id<0 || id>400) { 
                                    sizeValue += "\n- <bean:message key="warning.valueattribuated"/> " + i + " <bean:message key="warning.negative400"/>"; 
                                    vSize3 = 1;
                                }
                            }

                        }     
                    }
                    if (vSize2 == 1) size += "\n" + sizeType;
                    if (vSize3 == 1) size += "\n" + sizeValue;
                    if (vSize == 0 && vSize2 == 0 && vSize3 == 0 && testSize == 1) testSize = 2;
                }
                //FIN DE VALIDATION DE TAILLE


                //VALIDATION DEFAULT  
                var flawTable = new Array(12);
                flawTable[0] = "<bean:message key="warningFlaw.PartiallyDamaged"/>";
                flawTable[1] = "<bean:message key="warningFlaw.partiallyBlack"/>";
                flawTable[2] = "<bean:message key="warningFlaw.cutIntoABatch"/>";
                flawTable[3] = "<bean:message key="warningFlaw.cutIntoALittle"/>";
                flawTable[4] = "<bean:message key="warningFlaw.green"/>";
                flawTable[5] = "<bean:message key="warningFlaw.shortBitten"/>";
                flawTable[6] = "<bean:message key="warningFlaw.offColor"/>";
                flawTable[7] = "<bean:message key="warningFlaw.burned"/>";
                flawTable[8] = "<bean:message key="warningFlaw.orangePeelSkin"/>";
                flawTable[9] = "<bean:message key="warningFlaw.averanado"/>";
                flawTable[10] = "<bean:message key="warningFlaw.damageMushroom"/>";
                flawTable[11] = "<bean:message key="warningFlaw.shells"/>";

                var flawTab = new Array();
                flawTab[0]="partiallyDamaged";
                flawTab[1]="partiallyBlack";
                flawTab[2]="cutIntoABatch";
                flawTab[3]="cutIntoALittle";
                flawTab[4]="green";
                flawTab[5]="shortBitten";
                flawTab[6]="offColor";
                flawTab[7]="burned";
                flawTab[8]="orangePeelSkin";
                flawTab[9]="averanado";
                flawTab[10]="damageCausedByMushroom";
                flawTab[11]="shells";

                var flaw = "<bean:message key="tab.flaw"/>";
                var flawType = "<bean:message key="warning.incorrecttype"/>";
                var flawValue = "<bean:message key="warning.incorrectvalue"/>";

                var vFlaw = 0;
                var vFlaw2 = 0;
                var vFlaw3 = 0;
                var testFlaw = 0;

                for (i=0;i<=11;i++) {
                    id = document.getElementById(flawTab[i]).innerHTML;
                    if (id != "") testFlaw = 1;
                }
                if (testFlaw == 0) {
                    document.getElementById('flaw').value = "false";
                    if (document.getElementById('greenCoffee').value == 'true' || document.getElementById('size').value == 'true') {
                        flaw += "\n<bean:message key="warning.nothingButTest"/>";
                        testFlaw = -1;
                    }
                }
                else {
                    document.getElementById('flaw').value = "true";
                    for (i=0;i<=11;i++) {
                        x = document.getElementById(flawTab[i]).innerHTML;
                        if (x=="") {
                            flaw += "\n- "+ flawTable[i] +" <bean:message key="warning.needtobefilled"/>";	
                            vFlaw = 1;
                        }
                        else { 
                            if(!verif_numeric(x)) {
                                flawType += "\n- <bean:message key="warning.valueattribuated"/> " + flawTable[i] + " <bean:message key="warning.notnumber"/>";	
                                vFlaw2 = 1;
                            }
                            else {
                                if(x<0 || x>100) { 
                                    flawValue += "\n- <bean:message key="warning.valueattribuated"/> " + flawTable[i] + " <bean:message key="warning.negative100"/>"; 
                                    vFlaw3 = 1;
                                }
                            }
                        }
                    }
                    if (vFlaw2 == 1) flaw += "\n" + flawType;
                    if (vFlaw3 == 1) flaw += "\n" + flawValue;
                    if (vFlaw == 0 && vFlaw2 == 0 && vFlaw3 == 0 && testFlaw == 1) testFlaw = 2;
                }
                //FIN DE VALIDATION de DEFAULT


                //VALIDATION CATACION
                var idTab = new Array(5);
                idTab[0] = "perfum";
                idTab[1] = "flavor";
                idTab[2] = "body";
                idTab[3] = "acidity";
                idTab[4] = "residue";

                var idTable = new Array(5);
                idTable[0] = "<bean:message key="warningTasting.perfum"/>";
                idTable[1] = "<bean:message key="warningTasting.flavor"/>";
                idTable[2] = "<bean:message key="warningTasting.body"/>";
                idTable[3] = "<bean:message key="warningTasting.acidity"/>";
                idTable[4] = "<bean:message key="warningTasting.residue"/>";

                var tastingType = "<bean:message key="warning.incorrecttype"/>";
                var tastingValue = "<bean:message key="warning.incorrectvalue"/>";    
                var tasting = "\n\n<bean:message key="tab.tasting"/>";    

                var vTasting = 0;
                var vTasting2 = 0;
                var testTasting = 0;


                if (document.getElementById('tasting').value = "true") {
                    for (i=0;i<=4;i++) {
                        x = document.getElementById(idTab[i]).innerHTML;
                        if (x != "") {testTasting = 1;}
                    }
                    if (testTasting == 0) document.getElementById('tasting').value = "false";
                    else {
                        document.getElementById('tasting').value = "true";
                        for (i=0;i<=4;i++) {
                            x = document.getElementById(idTab[i]).innerHTML;
                            if(x != "") {
                                if(!verif_numeric(x)) {
                                    tastingType += "\n- <bean:message key="warning.valueattribuated"/> " + idTable[i] + " <bean:message key="warning.notnumber"/>";	
                                    vTasting = 1;
                                }
                                else {
                                    if(x<0 || x>10){ 
                                        tastingValue += "\n- <bean:message key="warning.valueattribuated"/> " + idTable[i] + " <bean:message key="warning.negative10"/>"; 
                                        vTasting2 =  1 ;
                                    }
                                }
                            }
                            else
                                tasting += "\n- "+ idTable[i] +" <bean:message key="warning.needtobefilled"/>";
                        }
                        if (vTasting == 1) tasting += "\n" + tastingType;
                        if (vTasting2 == 1) tasting += "\n" + tastingValue;
                        if (vTasting == 0 && vTasting2 == 0 && testTasting == 1) testTasting = 2;
                    }
                }
                //FIN DE VALIDATION CATACION

                alert('green ' + testGreen + '\nsize ' + testSize + '\nflaw ' + testFlaw + '\ntasting ' + testTasting);

                if (testGreen == 2 && testSize == 2 && testFlaw == 2 && testTasting == 2) {
                    alert('all');
                    return true;
                }
                else if (testGreen == 2 && testSize == 2 && testFlaw == 2 && testTasting == 0) {
                    alert('first');
                    return true;
                }
                else if (testGreen == 0 && testSize == 0 && testFlaw == 0 && testTasting == 2) {
                    alert('second');
                    return true;
                }
                else if (testGreen != 0 || testSize != 0 || testFlaw != 0 || testTasting != 0) {
                    if(testGreen    == 0) green = "\n\n";   else green += "\n\n";
                    if(testSize     == 0) size = "\n\n";    else size += "\n\n";
                    if(testFlaw     == 0) flaw = "\n\n";    else flaw += "\n\n";
                    if(testTasting  == 0) tasting = "\n\n"; else tasting += "\n\n";
                    alert(header + green + size + flaw + tasting);
                    return false;
                }
                else if (testGreen == 0 && testSize == 0 && testFlaw == 0 && testTasting == 0) {
                    alert('<bean:message key="result.error" />');
                    return false;
                }
                return true;
            }
            function verif_numeric(variable) {
                var exp = new RegExp("^\-?[0-9]+$","g");
                return exp.test(variable);
            }
