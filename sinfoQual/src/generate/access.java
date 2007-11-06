package generate;

import access.form.accessForm;
import java.io.File;
import java.io.IOException;
import java.util.Calendar;
import jxl.*;
import jxl.biff.formula.FormulaException;
import jxl.format.Border;
import jxl.format.BorderLineStyle;
import jxl.format.*;
import jxl.format.VerticalAlignment;
import jxl.write.Number;
import jxl.write.*;



public class access {
    
    accessForm bean;
    public access(accessForm bean) throws IOException, WriteException {
        this.bean = bean;
        ecriture();
    }
    
    public access() throws IOException, WriteException {
        ecriture();
    }
    
    public void ecriture() throws IOException, WriteException {
        String path = "C:" + File.separatorChar;
        
        String date = "";
        
        Calendar c = Calendar.getInstance();
        
        date += c.get(Calendar.DATE);
        date += "-" + (c.get(Calendar.MONTH)+1);
        date += "-" + c.get(Calendar.YEAR);
        
        String nameFile = "Generation du ".concat(date + ".xls");
        path = path.concat(nameFile);
        
        
        WritableWorkbook workbook = Workbook.createWorkbook(new File(path));
        WritableSheet sheet = workbook.createSheet("Sheet1", 0);
        
        WritableCellFormat [] police = policeInitialization();
        int i;
        
        workbook = header(workbook, police, 0, 0);
        workbook = inform(workbook, police, 0, 8);
        if (bean.getGreenCoffee() && bean.getSize() && bean.getFlaw()) {
            //Rajout des Tableaux de la 1ère catégorie
            workbook = greenCoffeeTab(workbook, police, 0, 23);
            workbook = flawTab(workbook, police, 3, 29);
            workbook = sizeTab(workbook, police, 0, 29);
            //Rajout du tableau de la 2e catégorie
            //On vérifie si le tableau de dégustation doit etre seul ou avec les autres tableaux!
            if (bean.getTasting()) {
                try {
                    int total = Integer.parseInt(bean.getPerfum()) + Integer.parseInt(bean.getFlavor()) + Integer.parseInt(bean.getBody()) + Integer.parseInt(bean.getAcidity()) + Integer.parseInt(bean.getResidue()) + 50;
                    workbook = tastingTab(workbook, police, 0, 49);
                    //Rajout du tableau des commentaires !
                    workbook = commentTab(workbook, police, 0, 61);
                } catch (NumberFormatException e){workbook = commentTab(workbook, police, 0, 49);}
            } else //Rajout du tableau des commentaires !
                workbook = commentTab(workbook, police, 0, 49);
        } else
            workbook = tastingTab(workbook, police, 0, 23);
        
        
        //Initialisation de la taille des colonnes à risques!
        sheet.setColumnView(0,18);
        sheet.setColumnView(1,13);
        sheet.setColumnView(2,13);
        sheet.setColumnView(3,13);
        sheet.setColumnView(4,13);
        sheet.setColumnView(5,14);
        sheet.setColumnView(6,14);
        sheet.setColumnView(7,18);
        
        //Parametre de la page
        SheetSettings sheets = new SheetSettings(sheet);
        sheets.setFitWidth(1);//Mise en page impression : 1 seule page (nb de page dans la parenthese)
        
        workbook.write();
        workbook.close();
        
    }
    
    private WritableWorkbook greenCoffeeTab(WritableWorkbook workbook, WritableCellFormat[] policeCellFormat, int col, int row) throws IOException, WriteException {
        WritableCellFormat [] police = policeCellFormat;
        WritableSheet sheet = workbook.getSheet("Sheet1");
        int i;
        
        
        //Ecriture du tableau indiquant les informations de Café Vert
        Label label26 = new Label(col + 0, row, "Café Verde", police[1]);
        Label Label27 = new Label(col + 1, row + 2, "Humedad", police[2]);
        Label Label28 = new Label(col + 1, row + 3, bean.getHumidity().concat(" %"), police[35]);
        Label Label29 = new Label(col + 2, row + 2, "Color", police[2]);
        Label Label30 = new Label(col + 2, row + 3, bean.getColor(), police[35]);
        Label Label31 = new Label(col + 3, row + 2, "Olor", police[2]);
        Label Label32 = new Label(col + 3, row + 3, bean.getSmell(), police[35]);
        Label Label33 = new Label(col + 4, row + 2, "Densidad", police[2]);
        Label Label34 = new Label(col + 4, row + 3, bean.getDenseness().concat(" g"), police[35]);
        Label Label35 = new Label(col + 5, row + 2, "Uniformidad", police[39]);
        Label Label36 = new Label(col + 5, row + 3, bean.getUniformity(), police[8]);
        Label Label37 = new Label(col + 0, row + 3, "Actual", police[6]);
        Label Label38 = new Label(col + 0, row + 4, "Requisito", police[12]);
        Label Label39 = new Label(col + 1, row + 4, "10-12%", police[10]);
        Label Label40 = new Label(col + 2, row + 4, "Verde Azul", police[10]);
        Label Label41 = new Label(col + 3, row + 4, "Fresco", police[10]);
        Label Label42 = new Label(col + 4, row + 4, "175 g +", police[10]);
        Label Label43 = new Label(col + 5, row + 4, "Farejo", police[13]);
        
        sheet.addCell(label26);sheet.addCell(Label27);sheet.addCell(Label28);sheet.addCell(Label29);sheet.addCell(Label30);sheet.addCell(Label31);sheet.addCell(Label32);
        sheet.addCell(Label33);sheet.addCell(Label34);sheet.addCell(Label35);sheet.addCell(Label36);sheet.addCell(Label37);sheet.addCell(Label38);sheet.addCell(Label39);
        sheet.addCell(Label40);sheet.addCell(Label41);sheet.addCell(Label42);sheet.addCell(Label43);
        
        for (i=1;i<5;i++) {
            Label cellT = new Label(col + i, row + 0, "", police[21]);
            sheet.addCell(cellT);
        }
        sheet.mergeCells(col, row,col + 1, row);
        Label cellL3 = new Label(col, row + 1, "", police[23]);
        Label cellL4 = new Label(col, row + 2, "", police[23]);
        Label cellTR2 = new Label(col + 5, row, "", police[31]);
        Label cellR4 = new Label(col + 5, row + 1, "", police[24]);
        sheet.addCell(cellL3);sheet.addCell(cellL4);sheet.addCell(cellTR2);sheet.addCell(cellR4);
        
        
        return workbook;
    }
    
    private WritableWorkbook sizeTab(WritableWorkbook workbook, WritableCellFormat[] policeCellFormat, int col, int row) throws IOException, WriteException {
        WritableCellFormat [] police = policeCellFormat;
        WritableSheet sheet = workbook.getSheet("Sheet1");
        int i;
        
        //Ecriture du tableau indiquant la taille
        Label label1 = new Label(col + 0, row + 0, "Tamaño", police[1]);
        Number Number2 = new Number(col + 0, row + 2, 21, police[6]);
        try {Number Number3 = new Number(col + 1, row + 2, Integer.parseInt(bean.getTwentyOne()), police[8]);sheet.addCell(Number3);} catch (NumberFormatException e) {Number Number3 = new Number(col + 1, row + 2, 0, police[8]);sheet.addCell(Number3);}
        Number Number4 = new Number(col + 0, row + 3, 20, police[6]);
        try {Number Number5 = new Number(col + 1, row + 3, Integer.parseInt(bean.getTwenty()), police[8]);sheet.addCell(Number5);} catch (NumberFormatException e) {Number Number5 = new Number(col + 1, row + 3, 0, police[8]);sheet.addCell(Number5);}
        Number Number6 = new Number(col + 0, row + 4, 19, police[6]);
        try {Number Number7 = new Number(col + 1, row + 4, Integer.parseInt(bean.getNineteen()), police[8]);sheet.addCell(Number7);} catch (NumberFormatException e) {Number Number7 = new Number(col + 1, row + 4, 0, police[8]);sheet.addCell(Number7);}
        Number Number8 = new Number(col + 0, row + 5, 18, police[6]);
        try {Number Number9 = new Number(col + 1, row + 5, Integer.parseInt(bean.getEighteen()), police[8]);sheet.addCell(Number9);} catch (NumberFormatException e) {Number Number9 = new Number(col + 1, row + 5, 0, police[8]);sheet.addCell(Number9);}
        Number Number10 = new Number(col + 0, row + 6, 17, police[6]);
        try {Number Number11 = new Number(col + 1, row + 6, Integer.parseInt(bean.getSeventeen()), police[8]);sheet.addCell(Number11);} catch (NumberFormatException e) {Number Number11 = new Number(col + 1, row + 6, 0, police[8]);sheet.addCell(Number11);}
        Number Number12 = new Number(col + 0, row + 7, 16, police[6]);
        try {Number Number13 = new Number(col + 1, row + 7, Integer.parseInt(bean.getSixteen()), police[8]);sheet.addCell(Number13);} catch (NumberFormatException e) {Number Number13 = new Number(col + 1, row + 7, 0, police[8]);sheet.addCell(Number13);}
        Number Number14 = new Number(col + 0, row + 8, 15, police[6]);
        try {Number Number15 = new Number(col + 1, row + 8, Integer.parseInt(bean.getFifteen()), police[8]);sheet.addCell(Number15);} catch (NumberFormatException e) {Number Number15 = new Number(col + 1, row + 8, 0, police[8]);sheet.addCell(Number15);}
        Number Number16 = new Number(col + 0, row + 9, 14, police[6]);
        try {Number Number17 = new Number(col + 1, row + 9, Integer.parseInt(bean.getFourteen()), police[8]);sheet.addCell(Number17);} catch (NumberFormatException e) {Number Number17 = new Number(col + 1, row + 9, 0, police[8]);sheet.addCell(Number17);}
        Number Number18 = new Number(col + 0, row + 10, 13, police[6]);
        try {Number Number19 = new Number(col + 1, row + 10, Integer.parseInt(bean.getThirteen()), police[8]);sheet.addCell(Number19);} catch (NumberFormatException e) {Number Number19 = new Number(col + 1, row + 10, 0, police[8]);sheet.addCell(Number19);}
        Number Number20 = new Number(col + 0, row + 11, 12, police[6]);
        try {Number Number21 = new Number(col + 1, row + 11, Integer.parseInt(bean.getTwelve()), police[8]);sheet.addCell(Number21);} catch (NumberFormatException e) {Number Number21 = new Number(col + 1, row + 11, 0, police[8]);sheet.addCell(Number21);}
        Label label22 = new Label(col + 0, row + 1, "Por 350 Gramos", police[11]);
        Label label23 = new Label(col + 0, row + 12, "Requisito", police[11]);
        Label label24 = new Label(col + 1, row + 12, "No mas", police[37]);
        Label label25 = new Label(col + 0, row + 15, "de 10% @ Zaranda 15 o bajo", police[38]);
        
        sheet.addCell(label1);sheet.addCell(Number2);sheet.addCell(Number4);sheet.addCell(Number6);
        sheet.addCell(Number8);sheet.addCell(Number10);sheet.addCell(Number12);sheet.addCell(Number14);
        sheet.addCell(Number16);sheet.addCell(Number18);sheet.addCell(Number20);
        sheet.addCell(label22);sheet.addCell(label23);sheet.addCell(label24);sheet.addCell(label25);
        
        Label cellTR = new Label(col + 1, row, "", police[31]);
        Label cellR = new Label(col + 1, row + 1, "", police[24]);
        Label cellR2 = new Label(col + 1, row + 13, "", police[24]);
        Label cellR3 = new Label(col + 1, row + 14, "", police[24]);
        Label cellL = new Label(col, row + 13, "", police[23]);
        Label cellL2 = new Label(col, row + 14, "", police[23]);
        sheet.addCell(cellTR);sheet.addCell(cellL);sheet.addCell(cellL2);sheet.addCell(cellR);sheet.addCell(cellR2);sheet.addCell(cellR3);
        sheet.mergeCells(col,row + 15,col + 1,row + 15);
        
        return workbook;
    }
    
    
    private WritableWorkbook flawTab(WritableWorkbook workbook, WritableCellFormat[] policeCellFormat, int col, int row) throws IOException, WriteException {
        WritableCellFormat [] police = policeCellFormat;
        WritableSheet sheet = workbook.getSheet("Sheet1");
        int i, partiallyDamaged, partiallyBlack, cutIntoABatch, cutIntoALittle,  green, shortBitten, offColor, burned, orangePeelSkin, averanado,  damageCausedByMushroom, shells, total;
        
        try {
            partiallyDamaged = Integer.parseInt(bean.getPartiallyDamaged()) / 3;
            partiallyBlack = Integer.parseInt(bean.getPartiallyBlack()) / 2;
            cutIntoABatch = Integer.parseInt(bean.getCutIntoABatch()) / 5;
            cutIntoALittle = Integer.parseInt(bean.getCutIntoALittle()) / 10;
            green = Integer.parseInt(bean.getGreen()) / 5;
            shortBitten = Integer.parseInt(bean.getShortBitten()) / 5;
            offColor = Integer.parseInt(bean.getOffColor()) / 5;
            burned = Integer.parseInt(bean.getBurned()) / 5;
            orangePeelSkin = Integer.parseInt(bean.getOrangePeelSkin());
            averanado = Integer.parseInt(bean.getAveranado()) / 5;
            damageCausedByMushroom = Integer.parseInt(bean.getDamageCausedByMushroom());
            shells = Integer.parseInt(bean.getShells());
            total = partiallyDamaged + partiallyBlack + cutIntoABatch + cutIntoALittle +  green + shortBitten + offColor + burned + orangePeelSkin + averanado +  damageCausedByMushroom + shells;
        } catch (NumberFormatException e){return workbook;}
        
        //Ecriture du tableau indiquant les défauts
        Label Label44 = new Label(col, row, "Defectos", police[1]);
        Label Label45 = new Label(col, row + 2, "Numero", police[6]);
        Label Label46 = new Label(col + 1, row + 2, "Defecto", police[2]);
        Label Label47 = new Label(col + 3, row + 2, "Equivalentes", police[2]);
        Label Label48 = new Label(col + 4, row + 2, "Total defectos", police[39]);
        try {Number Label49 = new Number(col, row + 3, Integer.parseInt(bean.getPartiallyDamaged()), police[9]);sheet.addCell(Label49);} catch (NumberFormatException e) {Number Label49 = new Number(col, row + 3, 0, police[9]);sheet.addCell(Label49);}
        Label Label50 = new Label(col + 1, row + 3, "Parcial agrio", police[3]);
        Number Label51 = new Number(col + 3, row + 3, partiallyDamaged, police[35]);
        Number Label52 = new Number(col + 4, row + 3, 3, police[4]);
        try {Number Label53 = new Number(col, row + 4, Integer.parseInt(bean.getPartiallyBlack()), police[9]);sheet.addCell(Label53);} catch (NumberFormatException e) {Number Label53 = new Number(col, row + 4, 0, police[9]);sheet.addCell(Label53);}
        Label Label54 = new Label(col + 1, row + 4, "Parcial negro", police[3]);
        Number Label55 = new Number(col + 3, row + 4, partiallyBlack, police[35]);
        Number Label56 = new Number(col + 4, row + 4, 2, police[4]);
        try {Number Label57 = new Number(col, row + 5, Integer.parseInt(bean.getCutIntoABatch()), police[9]);sheet.addCell(Label57);} catch (NumberFormatException e) {Number Label57 = new Number(col, row + 5, 0, police[9]);sheet.addCell(Label57);}
        Label Label58 = new Label(col + 1, row + 5, "Brocado severo", police[3]);
        Number Label59 = new Number(col + 3, row + 5, cutIntoABatch, police[35]);
        Number Label60 = new Number(col + 4, row + 5, 5, police[4]);
        try {Number Label61 = new Number(col, row + 6, Integer.parseInt(bean.getCutIntoALittle()), police[9]);sheet.addCell(Label61);} catch (NumberFormatException e) {Number Label61 = new Number(col, row + 6, 0, police[9]);sheet.addCell(Label61);}
        Label Label62 = new Label(col + 1, row + 6, "Brocado leve", police[3]);
        Number Label63 = new Number(col + 3, row + 6, cutIntoALittle, police[35]);
        Number Label64 = new Number(col + 4, row + 6, 10, police[4]);
        try {Number Label65 = new Number(col, row + 7, Integer.parseInt(bean.getGreen()), police[9]);sheet.addCell(Label65);} catch (NumberFormatException e) {Number Label65 = new Number(col, row + 7, 0, police[9]);sheet.addCell(Label65);}
        Label Label66 = new Label(col + 1, row + 7, "Inmaduro", police[3]);
        Number Label67 = new Number(col + 3, row + 7, green, police[35]);
        Number Label68 = new Number(col + 4, row + 7, 5, police[4]);
        try {Number Label69 = new Number(col, row + 8, Integer.parseInt(bean.getShortBitten()), police[9]);sheet.addCell(Label69);} catch (NumberFormatException e) {Number Label69 = new Number(col, row + 8, 0, police[9]);sheet.addCell(Label69);}
        Label Label70 = new Label(col + 1, row + 8, "Cortado, Mordido", police[3]);
        Number Label71 = new Number(col + 3, row + 8, shortBitten, police[35]);
        Number Label72 = new Number(col + 4, row + 8, 5, police[4]);
        try {Number Label73 = new Number(col, row + 9, Integer.parseInt(bean.getOffColor()), police[9]);sheet.addCell(Label73);} catch (NumberFormatException e) {Number Label73 = new Number(col, row + 9, 0, police[9]);sheet.addCell(Label73);}
        Label Label74 = new Label(col + 1, row + 9, "Descolorado", police[3]);
        Number Label75 = new Number(col + 3, row + 9, offColor, police[35]);
        Number Label76 = new Number(col + 4, row + 9, 5, police[4]);
        try {Number Label77 = new Number(col, row + 10, Integer.parseInt(bean.getBurned()), police[9]);sheet.addCell(Label77);} catch (NumberFormatException e) {Number Label77 = new Number(col, row + 10, 0, police[9]);sheet.addCell(Label77);}
        Label Label78 = new Label(col + 1, row + 10, "Quemado", police[3]);
        Number Label79 = new Number(col + 3, row + 10, burned, police[35]);
        Number Label80 = new Number(col + 4, row + 10, 5, police[4]);
        try {Number Label81 = new Number(col, row + 11, Integer.parseInt(bean.getOrangePeelSkin()), police[9]);sheet.addCell(Label81);} catch (NumberFormatException e) {Number Label81 = new Number(col, row + 11, 0, police[9]);sheet.addCell(Label81);}
        Label Label82 = new Label(col + 1, row + 11, "Piel Naranja", police[3]);
        Number Label83 = new Number(col + 3, row + 11, orangePeelSkin, police[35]);
        Number Label84 = new Number(col + 4, row + 11, 0, police[4]);
        try {Number Label85 = new Number(col, row + 12, Integer.parseInt(bean.getAveranado()), police[9]);sheet.addCell(Label85);} catch (NumberFormatException e) {Number Label85 = new Number(col, row + 12, 0, police[9]);sheet.addCell(Label85);}
        Label Label86 = new Label(col + 1, row + 12, "Averanado", police[3]);
        Number Label87 = new Number(col + 3, row + 12, averanado, police[35]);
        Number Label88 = new Number(col + 4, row + 12, 5, police[4]);
        try {Number Label89 = new Number(col, row + 13, Integer.parseInt(bean.getDamageCausedByMushroom()), police[9]);sheet.addCell(Label89);} catch (NumberFormatException e) {Number Label89 = new Number(col, row + 13, 0, police[9]);sheet.addCell(Label89);}
        Label Label90 = new Label(col + 1, row + 13, "Dano por Hongos", police[3]);
        Number Label91 = new Number(col + 3, row + 13, damageCausedByMushroom, police[35]);
        Number Label92 = new Number(col + 4, row + 13, 1, police[4]);
        try {Number Label93 = new Number(col, row + 14, Integer.parseInt(bean.getShells()), police[9]);sheet.addCell(Label93);} catch (NumberFormatException e) {Number Label93 = new Number(col, row + 14, 0, police[9]);sheet.addCell(Label93);}
        Label Label94 = new Label(col + 1, row + 14, "Conchas", police[3]);
        Number Label95 = new Number(col + 3, row + 14, shells, police[35]);
        Number Label96 = new Number(col + 4, row + 14, 0, police[4]);
        Label Label97 = new Label(col + 1, row + 15, "Defectos en total", police[14]);
        Number Label98 = new Number(col + 3, row + 15, total, police[17]);
        Label Label99 = new Label(col + 1, row + 16, "Porcentaje de Verdes", police[10]);
        
        //On fusionne les cellules des défauts
        sheet.mergeCells(col,row,col + 1,row);
        sheet.mergeCells(col + 1,row + 3,col + 2,row + 3);
        sheet.mergeCells(col + 1,row + 4,col + 2,row + 4);
        sheet.mergeCells(col + 1,row + 5,col + 2,row + 5);
        sheet.mergeCells(col + 1,row + 6,col + 2,row + 6);
        sheet.mergeCells(col + 1,row + 7,col + 2,row + 7);
        sheet.mergeCells(col + 1,row + 8,col + 2,row + 8);
        sheet.mergeCells(col + 1,row + 9,col + 2,row + 9);
        sheet.mergeCells(col + 1,row + 10,col + 2,row + 10);
        sheet.mergeCells(col + 1,row + 11,col + 2,row + 11);
        sheet.mergeCells(col + 1,row + 12,col + 2,row + 12);
        sheet.mergeCells(col + 1,row + 13,col + 2,row + 13);
        sheet.mergeCells(col + 1,row + 14,col + 2,row + 14);
        sheet.mergeCells(col + 1,row + 15,col + 2,row + 15);
        sheet.mergeCells(col + 1,row + 16,col + 2,row + 16);
        
        sheet.addCell(Label44);sheet.addCell(Label45);sheet.addCell(Label46);sheet.addCell(Label47);sheet.addCell(Label48);;sheet.addCell(Label50);
        sheet.addCell(Label51);sheet.addCell(Label52);sheet.addCell(Label54);sheet.addCell(Label55);sheet.addCell(Label56);
        sheet.addCell(Label58);sheet.addCell(Label59);sheet.addCell(Label60);sheet.addCell(Label62);sheet.addCell(Label63);sheet.addCell(Label64);
        sheet.addCell(Label66);sheet.addCell(Label67);sheet.addCell(Label68);sheet.addCell(Label70);sheet.addCell(Label71);
        sheet.addCell(Label72);sheet.addCell(Label74);sheet.addCell(Label75);sheet.addCell(Label76);sheet.addCell(Label78);
        sheet.addCell(Label79);sheet.addCell(Label80);sheet.addCell(Label82);sheet.addCell(Label83);sheet.addCell(Label84);
        sheet.addCell(Label86);sheet.addCell(Label87);sheet.addCell(Label88);sheet.addCell(Label90);sheet.addCell(Label91);sheet.addCell(Label92);
        sheet.addCell(Label94);sheet.addCell(Label95);sheet.addCell(Label96);sheet.addCell(Label97);sheet.addCell(Label98);sheet.addCell(Label99);
        
        //Construction des bordures !
        for (i=1;i<4;i++) {
            Label cellT = new Label(col + i, row + 0, "", police[21]);
            sheet.addCell(cellT);
            if (i != 1 && i != 2) {
                Label cellB = new Label(col + i, row + 16, "", police[22]);
                sheet.addCell(cellB);
            }
        }
        Label cellTR3 = new Label(col + 4, row + 0, "", police[31]);
        Label cellBR = new Label(col + 4, row + 16, "", police[30]);
        Label cellBL = new Label(col, row + 16, "", police[29]);
        sheet.addCell(cellTR3);sheet.addCell(cellBR);sheet.addCell(cellBL);
        Label cellL5 = new Label(col + 0, row + 1, "", police[23]);
        Label cellR5 = new Label(col + 4, row + 1, "", police[24]);
        sheet.addCell(cellR5);sheet.addCell(cellL5);
        Label cellL6 = new Label(col + 0, row + 15, "", police[23]);
        Label cellR6 = new Label(col + 4, row + 15, "", police[24]);
        sheet.addCell(cellR6);sheet.addCell(cellL6);
        
        
        return workbook;
    }
    
    private WritableWorkbook tastingTab(WritableWorkbook workbook, WritableCellFormat[] policeCellFormat, int col, int row) throws IOException, WriteException {
        WritableCellFormat [] police = policeCellFormat;
        WritableSheet sheet = workbook.getSheet("Sheet1");
        int i, total;
        
        try {
            total = Integer.parseInt(bean.getPerfum()) + Integer.parseInt(bean.getFlavor()) + Integer.parseInt(bean.getBody()) + Integer.parseInt(bean.getAcidity()) + Integer.parseInt(bean.getResidue()) + 50;
        } catch (NumberFormatException e){return workbook;}
        
        //On initialise le tableau de dégustation
        Label Label1 = new Label(col + 0, row + 0, "Catacion", police[1]);
        Label Label2 = new Label(col + 0, row + 2, "Categoria", police[5]);
        Label Label3 = new Label(col + 1, row + 2, "Resultado", police[3]);
        Label Label4 = new Label(col + 2, row + 2, "Atributos y Otras Características", police[3]);
        Label Label5 = new Label(col + 0, row + 3, "Fragancia", police[5]);
        try{Number Label6 = new Number(col + 1, row + 3, Integer.parseInt(bean.getPerfum()), police[35]);sheet.addCell(Label6);} catch (NumberFormatException e) {Number Label6 = new Number(col + 1, row + 3, 0, police[35]);sheet.addCell(Label6);}
        Label Label7 = new Label(col + 2, row + 3, bean.getPerfumAdd(), police[35]);
        Label Label8 = new Label(col + 0, row + 4, "Sabor", police[5]);
        try{Number Label9 = new Number(col + 1, row + 4, Integer.parseInt(bean.getFlavor()), police[35]);sheet.addCell(Label9);} catch (NumberFormatException e) {Number Label9 = new Number(col + 1, row + 4, 0, police[35]);sheet.addCell(Label9);}
        Label Label10 = new Label(col + 2, row + 4, bean.getFlavorAdd(), police[35]);
        Label Label11 = new Label(col + 0, row + 5, "Cuerpo", police[5]);
        try{Number Label12 = new Number(col + 1, row + 5, Integer.parseInt(bean.getBody()), police[35]);sheet.addCell(Label12);} catch (NumberFormatException e) {Number Label12 = new Number(col + 1, row + 5, 0, police[35]);sheet.addCell(Label12);}
        Label Label13 = new Label(col + 2, row + 5, bean.getBodyAdd(), police[35]);
        Label Label14 = new Label(col + 0, row + 6, "Acidez", police[5]);
        try {Number Label15 = new Number(col + 1, row + 6, Integer.parseInt(bean.getAcidity()), police[35]);sheet.addCell(Label15);} catch (NumberFormatException e) {Number Label15 = new Number(col + 1, row + 6, 0, police[35]);sheet.addCell(Label15);}
        Label Label16 = new Label(col + 2, row + 6, bean.getAcidityAdd(), police[35]);
        Label Label17 = new Label(col + 0, row + 7, "Residual", police[5]);
        try {Number Label18 = new Number(col + 1, row + 7, Integer.parseInt(bean.getResidue()), police[35]);sheet.addCell(Label18);} catch (NumberFormatException e) {Number Label18 = new Number(col + 1, row + 7, 0, police[35]);sheet.addCell(Label18);}
        Label Label19 = new Label(col + 2, row + 7, bean.getResidueAdd(), police[35]);
        Label Label20 = new Label(col + 1, row + 8, "Mas 50 puntos", police[2]);
        Label Label21 = new Label(col + 0, row + 9, "Puntos", police[15]);
        Number Label22 = new Number(col + 1, row + 9, total, police[18]);
        Label Label23 = new Label(col + 6, row + 2, "Indicaciones", police[3]);
        Label Label36 = new Label(col + 7, row + 2, "Puntos", police[4]);
        Label Label24 = new Label(col + 6, row + 3, "Excelente", police[3]);
        Label Label25 = new Label(col + 6, row + 4, "Muy bueno", police[3]);
        Label Label26 = new Label(col + 6, row + 5, "Bueno", police[3]);
        Label Label27 = new Label(col + 6, row + 6, "Ordinario", police[3]);
        Label Label28 = new Label(col + 6, row + 7, "Malo", police[3]);
        Label Label29 = new Label(col + 7, row + 3, "90 +", police[4]);
        Label Label30 = new Label(col + 7, row + 4, "85 - 89", police[4]);
        Label Label31 = new Label(col + 7, row + 5, "80 - 84", police[4]);
        Label Label32 = new Label(col + 7, row + 6, "75 - 79", police[4]);
        Label Label33 = new Label(col + 7, row + 7, "< 74", police[4]);
        Label Label34 = new Label(col + 4, row + 9, "Resultado", police[16]);
        
        String result;
        if (total >= 90)
            result = "Excelente";
        else if (total >= 85)
            result = "Muy bueno";
        else if (total >= 80)
            result = "Bueno";
        else if (total == -1)
            result = "*Vee Abajo";
        else if (total >= 75)
            result = "Ordinario";
        else
            result = "Malo";
        
        Label Label35 = new Label(col + 6, row + 9, result, police[18]);
        
        
        //On fusionne les cellules des défauts
        sheet.mergeCells(col + 2,row + 2,col + 4,row + 2);
        sheet.mergeCells(col + 2,row + 3,col + 4,row + 3);
        sheet.mergeCells(col + 2,row + 4,col + 4,row + 4);
        sheet.mergeCells(col + 2,row + 5,col + 4,row + 5);
        sheet.mergeCells(col + 2,row + 6,col + 4,row + 6);
        sheet.mergeCells(col + 2,row + 7,col + 4,row + 7);
        
        sheet.addCell(Label1);sheet.addCell(Label2);sheet.addCell(Label3);sheet.addCell(Label4);sheet.addCell(Label5);sheet.addCell(Label7);
        sheet.addCell(Label8);sheet.addCell(Label10);sheet.addCell(Label11);sheet.addCell(Label13);sheet.addCell(Label14);
        sheet.addCell(Label16);sheet.addCell(Label17);sheet.addCell(Label19);sheet.addCell(Label20);sheet.addCell(Label21);
        sheet.addCell(Label22);sheet.addCell(Label23);sheet.addCell(Label24);sheet.addCell(Label25);
        sheet.addCell(Label26);sheet.addCell(Label27);sheet.addCell(Label28);sheet.addCell(Label29);sheet.addCell(Label30);sheet.addCell(Label31);sheet.addCell(Label32);
        sheet.addCell(Label33);sheet.addCell(Label34);sheet.addCell(Label35);sheet.addCell(Label36);
        
        
        //Construction des bordures !
        for (i=1;i<7;i++) {
            Label cellT = new Label(col + i, row + 0, "", police[21]);
            sheet.addCell(cellT);
            if (i != 1 && i != 4 && i != 6) {
                Label cellB = new Label(col + i, row + 9, "", police[22]);
                sheet.addCell(cellB);
            }
        }
        Label cellTR = new Label(col + 7, row + 0, "", police[31]);
        Label cellBR = new Label(col + 7, row + 9, "", police[30]);
        sheet.addCell(cellTR);sheet.addCell(cellBR);
        Label cellL = new Label(col + 0, row + 1, "", police[23]);
        Label cellR = new Label(col + 7, row + 1, "", police[24]);
        sheet.addCell(cellR);sheet.addCell(cellL);
        Label cellL2 = new Label(col + 0, row + 8, "", police[23]);
        Label cellR2 = new Label(col + 7, row + 8, "", police[24]);
        sheet.addCell(cellR2);sheet.addCell(cellL2);
        sheet.mergeCells(col,row,col + 1,row);
        
        
        return workbook;
    }
    
    
    /*
     *  Fonction parametrant toutes les polices nécessaires pour completer la page Excel.
     *
     *  @param : null
     *  @return : WritableCellFormat[] police
     *  @author : Bastien GUIRAUD
     */
    private WritableCellFormat[] policeInitialization() throws WriteException {
        WritableFont fontTitle = new WritableFont(WritableFont.createFont("Copperplate Gothic Light"),12,WritableFont.BOLD,false,UnderlineStyle.SINGLE);
        WritableFont fontLabel = new WritableFont(WritableFont.createFont("Copperplate Gothic Light"),10,WritableFont.NO_BOLD,false,UnderlineStyle.NO_UNDERLINE);
        WritableFont fontResult = new WritableFont(WritableFont.createFont("Copperplate Gothic Light"),9,WritableFont.NO_BOLD,false,UnderlineStyle.NO_UNDERLINE);
        WritableFont fontComment = new WritableFont(WritableFont.createFont("Copperplate Gothic Light"),8,WritableFont.NO_BOLD,true,UnderlineStyle.NO_UNDERLINE);
        WritableFont fontSubTitle = new WritableFont(WritableFont.createFont("Copperplate Gothic Light"),10,WritableFont.BOLD,false,UnderlineStyle.SINGLE);
        WritableFont fontBigResult = new WritableFont(WritableFont.createFont("Copperplate Gothic Light"),10,WritableFont.BOLD,false,UnderlineStyle.NO_UNDERLINE);
        WritableFont fontTitleComment = new WritableFont(WritableFont.ARIAL,14,WritableFont.BOLD,false,UnderlineStyle.SINGLE);
        WritableFont fontBigComment = new WritableFont(WritableFont.ARIAL,12,WritableFont.BOLD,false,UnderlineStyle.NO_UNDERLINE);
        
        WritableCellFormat [] police = new WritableCellFormat[42];
        
        police[0] = new WritableCellFormat(fontTitle);
        police[1] = new WritableCellFormat(fontTitle);
        police[1].setBorder(Border.TOP, BorderLineStyle.SLANTED_DASH_DOT);
        police[1].setBorder(Border.LEFT, BorderLineStyle.SLANTED_DASH_DOT);
        police[2] = new WritableCellFormat(fontLabel);
        police[3] = new WritableCellFormat(fontLabel);
        police[3].setBorder(Border.ALL, BorderLineStyle.THIN);
        police[4] = new WritableCellFormat(fontLabel);
        police[4].setBorder(Border.ALL, BorderLineStyle.THIN);
        police[4].setBorder(Border.RIGHT, BorderLineStyle.SLANTED_DASH_DOT);
        police[5] = new WritableCellFormat(fontLabel);
        police[5].setBorder(Border.ALL, BorderLineStyle.THIN);
        police[5].setBorder(Border.LEFT, BorderLineStyle.SLANTED_DASH_DOT);
        police[6] = new WritableCellFormat(fontLabel);
        police[6].setBorder(Border.LEFT, BorderLineStyle.SLANTED_DASH_DOT);
        police[7] = new WritableCellFormat(fontResult);
        police[8] = new WritableCellFormat(fontResult);
        police[8].setBorder(Border.ALL, BorderLineStyle.THIN);
        police[8].setBorder(Border.RIGHT, BorderLineStyle.SLANTED_DASH_DOT);
        police[9] = new WritableCellFormat(fontResult);
        police[9].setBorder(Border.ALL, BorderLineStyle.THIN);
        police[9].setBorder(Border.LEFT, BorderLineStyle.SLANTED_DASH_DOT);
        police[10] = new WritableCellFormat(fontComment);
        police[10].setBorder(Border.BOTTOM, BorderLineStyle.SLANTED_DASH_DOT);
        police[11] = new WritableCellFormat(fontComment);
        police[11].setBorder(Border.LEFT, BorderLineStyle.SLANTED_DASH_DOT);
        police[12] = new WritableCellFormat(fontComment);
        police[12].setBorder(Border.BOTTOM, BorderLineStyle.SLANTED_DASH_DOT);
        police[12].setBorder(Border.LEFT, BorderLineStyle.SLANTED_DASH_DOT);
        police[13] = new WritableCellFormat(fontComment);
        police[13].setBorder(Border.BOTTOM, BorderLineStyle.SLANTED_DASH_DOT);
        police[13].setBorder(Border.RIGHT, BorderLineStyle.SLANTED_DASH_DOT);
        police[14] = new WritableCellFormat(fontSubTitle);
        police[15] = new WritableCellFormat(fontSubTitle);
        police[15].setBorder(Border.BOTTOM, BorderLineStyle.SLANTED_DASH_DOT);
        police[15].setBorder(Border.LEFT, BorderLineStyle.SLANTED_DASH_DOT);
        police[16] = new WritableCellFormat(fontSubTitle);
        police[16].setBorder(Border.BOTTOM, BorderLineStyle.SLANTED_DASH_DOT);
        police[17] = new WritableCellFormat(fontBigResult);
        police[17].setBorder(Border.ALL, BorderLineStyle.MEDIUM);
        police[17].setBorder(Border.TOP, BorderLineStyle.THIN);
        police[18] = new WritableCellFormat(fontBigResult);
        police[18].setBorder(Border.ALL, BorderLineStyle.THIN);
        police[18].setBorder(Border.BOTTOM, BorderLineStyle.SLANTED_DASH_DOT);
        police[19] = new WritableCellFormat(fontTitleComment);
        police[19].setBorder(Border.LEFT, BorderLineStyle.MEDIUM);
        police[19].setBorder(Border.TOP, BorderLineStyle.MEDIUM);
        police[20] = new WritableCellFormat(fontBigComment);
        police[21] = new WritableCellFormat();
        police[21].setBorder(Border.TOP, BorderLineStyle.SLANTED_DASH_DOT);
        police[22] = new WritableCellFormat();
        police[22].setBorder(Border.BOTTOM, BorderLineStyle.SLANTED_DASH_DOT);
        police[23] = new WritableCellFormat();
        police[23].setBorder(Border.LEFT, BorderLineStyle.SLANTED_DASH_DOT);
        police[24] = new WritableCellFormat();
        police[24].setBorder(Border.RIGHT, BorderLineStyle.SLANTED_DASH_DOT);
        police[25] = new WritableCellFormat();
        police[25].setBorder(Border.TOP, BorderLineStyle.MEDIUM);
        police[26] = new WritableCellFormat();
        police[26].setBorder(Border.BOTTOM, BorderLineStyle.MEDIUM);
        police[27] = new WritableCellFormat();
        police[27].setBorder(Border.LEFT, BorderLineStyle.MEDIUM);
        police[28] = new WritableCellFormat();
        police[28].setBorder(Border.RIGHT, BorderLineStyle.MEDIUM);
        police[29] = new WritableCellFormat();
        police[29].setBorder(Border.BOTTOM, BorderLineStyle.SLANTED_DASH_DOT);
        police[29].setBorder(Border.LEFT, BorderLineStyle.SLANTED_DASH_DOT);
        police[30] = new WritableCellFormat();
        police[30].setBorder(Border.BOTTOM, BorderLineStyle.SLANTED_DASH_DOT);
        police[30].setBorder(Border.RIGHT, BorderLineStyle.SLANTED_DASH_DOT);
        police[31] = new WritableCellFormat();
        police[31].setBorder(Border.TOP, BorderLineStyle.SLANTED_DASH_DOT);
        police[31].setBorder(Border.RIGHT, BorderLineStyle.SLANTED_DASH_DOT);
        police[32] = new WritableCellFormat();
        police[32].setBorder(Border.BOTTOM, BorderLineStyle.MEDIUM);
        police[32].setBorder(Border.LEFT, BorderLineStyle.MEDIUM);
        police[33] = new WritableCellFormat();
        police[33].setBorder(Border.BOTTOM, BorderLineStyle.MEDIUM);
        police[33].setBorder(Border.RIGHT, BorderLineStyle.MEDIUM);
        police[34] = new WritableCellFormat();
        police[34].setBorder(Border.TOP, BorderLineStyle.MEDIUM);
        police[34].setBorder(Border.RIGHT, BorderLineStyle.MEDIUM);
        police[35] = new WritableCellFormat(fontResult);
        police[35].setBorder(Border.ALL, BorderLineStyle.THIN);
        police[36] = new WritableCellFormat(fontResult);
        police[36].setBorder(Border.RIGHT, BorderLineStyle.SLANTED_DASH_DOT);
        police[37] = new WritableCellFormat(fontComment);
        police[37].setBorder(Border.RIGHT, BorderLineStyle.SLANTED_DASH_DOT);
        police[38] = new WritableCellFormat(fontComment);
        police[38].setBorder(Border.BOTTOM, BorderLineStyle.SLANTED_DASH_DOT);
        police[38].setBorder(Border.LEFT, BorderLineStyle.SLANTED_DASH_DOT);
        police[38].setBorder(Border.RIGHT, BorderLineStyle.SLANTED_DASH_DOT);
        police[39] = new WritableCellFormat(fontLabel);
        police[39].setBorder(Border.RIGHT, BorderLineStyle.SLANTED_DASH_DOT);
        police[40] = new WritableCellFormat(fontLabel);
        police[40].setBorder(Border.LEFT, BorderLineStyle.SLANTED_DASH_DOT);
        police[40].setBorder(Border.RIGHT, BorderLineStyle.SLANTED_DASH_DOT);
        police[40].setBorder(Border.BOTTOM, BorderLineStyle.SLANTED_DASH_DOT);
        police[41] = new WritableCellFormat(fontLabel);
        police[41].setBorder(Border.LEFT, BorderLineStyle.SLANTED_DASH_DOT);
        police[41].setBorder(Border.RIGHT, BorderLineStyle.SLANTED_DASH_DOT);
        
        
        return police;
    }
    
    private WritableWorkbook commentTab(WritableWorkbook workbook, WritableCellFormat[] policeCellFormat, int col, int row) throws WriteException {
        WritableCellFormat [] police = policeCellFormat;
        WritableSheet sheet = workbook.getSheet("Sheet1");
        int i = 77, nbCol, nbRow = 0, nbChar, stop = 0;
        String comment = bean.getComment();
        String concat = "";
        
        if (comment == null || comment.equals(""))
            return workbook;
        
        
        Label cell = new Label(col, row, "Otros commentarios", police[1]);
        sheet.addCell(cell);
        
        //Calcule nombre de colonne avec comme base 7 lettres par cellule. 6 col = 42 lettres par lignes.
        nbChar = comment.length();
        if (nbChar > 77)
            nbCol = 6;
        while (nbChar > 0) {
            if (nbChar <= 77) {
                concat = comment.substring(0, comment.length());
                nbChar = - 1;
                nbRow++;
                if (concat.charAt(0) == ' ')
                    concat = concat.substring(1, concat.length());
                Label label = new Label(col, row + nbRow + 1, concat, police[40]);
                sheet.addCell(label);
                sheet.mergeCells(col,row + nbRow + 1,col + 6,row + nbRow + 1);
            } else {
                concat = comment.substring(0, 77);
                
                if ((stop = concat.indexOf("\n")) != -1) {
                    concat = concat.substring(0, stop);
                    nbChar = nbChar - stop - 2;
                    nbRow++;
                    if (concat.charAt(0) == ' ')
                        concat = concat.substring(1, concat.length());
                    Label label = new Label(col, row + nbRow + 1, concat, police[41]);
                    sheet.addCell(label);
                    sheet.mergeCells(col,row + nbRow + 1,col + 6,row + nbRow + 1);
                    comment = comment.substring(stop + 1, comment.length());
                } else {
                    i = 77;
                    while (concat.charAt(concat.length() - 1) != ' ' ) {
                        concat = concat.substring(0, i);
                        i--;
                    }
                    concat = concat.substring(0, i);
                    nbRow++;
                    nbChar = nbChar - i - 1;
                    if (concat.charAt(0) == ' ')
                        concat = concat.substring(1, concat.length());
                    Label label = new Label(col, row + nbRow + 1, concat, police[41]);
                    sheet.addCell(label);
                    sheet.mergeCells(col,row + nbRow + 1,col + 6,row + nbRow + 1);
                    comment = comment.substring(i, comment.length());
                }
            }
        }
        
        
        Label cell1 = new Label(col, row + 1, "", police[23]);
        Label cell2 = new Label(col + 6, row + 1, "", police[24]);
        sheet.addCell(cell1);sheet.addCell(cell2);
        for (i=1;i<6;i++) {
            Label cell3 = new Label(col + i, row, "", police[21]);
            sheet.addCell(cell3);
        }
        Label cell4 = new Label(col + 6, row, "", police[31]);
        sheet.addCell(cell4);
        sheet.mergeCells(col, row, col + 1, row);
        
        return workbook;
    }
    
    private WritableWorkbook inform(WritableWorkbook workbook, WritableCellFormat[] policeCellFormat, int col, int row) throws WriteException {
        WritableCellFormat [] police = policeCellFormat;
        WritableSheet sheet = workbook.getSheet("Sheet1");
        int i;
        
        //Ecriture du tableau d'informations générales
        Label label1 = new Label(col, row, "Generali Informacion", police[1]);
        Label label2 = new Label(col + 2, row + 2, "Fecha", police[2]);
        Label label3 = new Label(col + 3, row + 2, bean.getDate() , police[7]);
        Label label4 = new Label(col, row + 4, "Productor", police[6]);
        Label label5 = new Label(col + 1, row + 4, bean.getProducerName(), police[7]);
        Label label6 = new Label(col, row + 6, "Grupo de interés", police[6]);
        Label label7 = new Label(col + 1, row + 6, bean.getInterestGroup(), police[2]);
        Label label8 = new Label(col, row + 8, "Lote", police[6]);
        Label label9 = new Label(col + 1, row + 8, bean.getBatch(), police[7]);
        Label label10 = new Label(col, row + 10, "Producto", police[6]);
        Label label11 = new Label(col + 1, row + 10, bean.getProduct(), police[7]);
        Label label12 = new Label(col + 4, row + 6, "Asociacion", police[2]);
        Label label13 = new Label(col + 5, row + 6, bean.getOrganization(), police[36]);
        Label label14 = new Label(col + 4, row + 10, "Tipo de café", police[2]);
        Label label15 = new Label(col + 5, row + 10, bean.getTypeCoffee(), police[36]);
        
        sheet.addCell(label1);sheet.addCell(label2);sheet.addCell(label3);sheet.addCell(label4);sheet.addCell(label5);sheet.addCell(label6);sheet.addCell(label7);
        sheet.addCell(label8);sheet.addCell(label9);sheet.addCell(label10);sheet.addCell(label11);sheet.addCell(label12);sheet.addCell(label13);sheet.addCell(label14);
        sheet.addCell(label15);
        
        //Construction des bordures !
        for (i=1;i<5;i++) {
            Label cellT = new Label(col + i, row, "", police[21]);
            Label cellB = new Label(col + i, row + 11, "", police[22]);
            sheet.addCell(cellT);sheet.addCell(cellB);
        }
        Label cellTR = new Label(col + 5, row, "", police[31]);
        Label cellBL = new Label(col, row + 11, "", police[29]);
        Label cellBR = new Label(col + 5, row + 11, "", police[30]);
        sheet.addCell(cellTR);sheet.addCell(cellBL);sheet.addCell(cellBR);
        for (i=1;i<10;i++){
            if (i != 4 && i != 6 && i != 8) {
                Label cellL = new Label(col, row + i, "", police[23]);
                sheet.addCell(cellL);
            }
            if (i != 6) {
                Label cellR = new Label(col + 5, row + i, "", police[24]);
                sheet.addCell(cellR);
            }
        }
        sheet.mergeCells(col,row,col + 1,row); //Fusionne les cellules pour le titre !
        
        
        return workbook;
    }
    
    private WritableWorkbook header(WritableWorkbook workbook, WritableCellFormat[] policeCellFormat, int col, int row) throws WriteException {
        WritableCellFormat [] police = policeCellFormat;
        WritableSheet sheet = workbook.getSheet("Sheet1");
        int i;
        
        //Ecriture du tableau d'informations générales
        Label label1 = new Label(col, row, "FAPECAFES", police[0]);
        Label label2 = new Label(col + 4, row, "Adresse :", police[2]);
        Label label3 = new Label(col + 5, row + 1, "FAPECAFES", police[2]);
        Label label4 = new Label(col + 5, row + 2, "Avenido Santiago de las Montañas 06-60", police[2]);
        Label label5 = new Label(col + 5, row + 3, "Segundo Piso", police[2]);
        Label label6 = new Label(col + 5, row + 4, "LOJA - ECUADOR", police[2]);
        Label label7 = new Label(col, row + 2, "", police[3]);
        
        sheet.addCell(label1);sheet.addCell(label2);sheet.addCell(label3);sheet.addCell(label4);sheet.addCell(label5);sheet.addCell(label6);sheet.addCell(label7);
        sheet.mergeCells(col,row,col + 1,row); //Fusionne les cellules pour le titre !
        sheet.mergeCells(col,row + 2,col + 2,row + 5); //Fusionne les cellules pour le titre !
        
        return workbook;
    }
    
}
