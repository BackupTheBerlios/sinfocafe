package generate;

import display.bean.tabDetail;
import display.form.displayForm;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import jxl.*;
import jxl.biff.formula.FormulaException;
import jxl.format.Border;
import jxl.format.BorderLineStyle;
import jxl.format.*;
import jxl.format.VerticalAlignment;
import jxl.write.Number;
import jxl.write.*;



public class display {
    
    displayForm bean;
    public display(displayForm bean) throws IOException, WriteException {
        this.bean = bean;
        ecriture(bean);
    }
    
    public display() throws IOException, WriteException {
        ecriture(bean);
    }
    
    private void ecriture(displayForm bean) throws IOException, WriteException {
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
        
        int Y = 0, size, i = 0, typeOne = 0, typeTwo = 0, row = 23;
        ArrayList tab;
        
        //Parametre de la page
        SheetSettings sheets = new SheetSettings(sheet);
        sheets.setFitWidth(1);//Mise en page impression : 1 seule page (nb de page dans la parenthese)
        
        WritableCellFormat [] police = policeInitialization();
        
        workbook = header(workbook, police, 0, 0);
        workbook = inform(workbook, police, 0, 8, bean);
        
        size = ((ArrayList)bean.getTab()).size();
        
        while (i != size) {
            if (((tabDetail)bean.getTab().get(i)).getFirstTest().equals("true")) typeOne = 1;
            if (((tabDetail)bean.getTab().get(i)).getSecondTest().equals("true")) typeTwo = 1;
            i++;
        }
        i = 0;
        
        if (typeOne == 1 && typeTwo == 1) {
            workbook = firstTabsHeader(workbook, police, 0, row);
            workbook = secondTabsHeader(workbook, police, 8, row);
            while (i != size) {
                if (((tabDetail)bean.getTab().get(i)).getFirstTest().equals("true") && ((tabDetail)bean.getTab().get(i)).getSecondTest().equals("true")) {
                    workbook = firstTabs(workbook, police, 0, row, bean, i);
                    workbook = secondTab(workbook, police, 8, row, bean, i);
                    row += 5;
                    i++;
                } else {
                    workbook = firstTabsBoth(workbook, police, 0, row, bean, i);
                    workbook = secondTabBoth(workbook, police, 0, row, bean, i);
                    row += 5;
                    i++;
                }
            }
        } else if (typeOne == 1) {
            workbook = firstTabsHeader(workbook, police, 0, row);
            while (i != size) {
                workbook = firstTabs(workbook, police, 0, row, bean, i);
                row += 5;
                i++;
            }
        } else if (typeTwo == 1) {
            workbook = secondTabsHeaderOnly(workbook, police, 0, row);
            while (i != size) {
                workbook = secondTabOnly(workbook, police, 0, row, bean, i);
                row++;
                i++;
            }
        }
        
        if (size != 1) {
            if (typeOne == 1 && typeTwo == 1) {
                Y = bean.getTab().size() * 5 + 23;
                workbook = firstResults(workbook, police, 0, Y, bean);
                workbook = secondResult(workbook, police, 8, Y, bean);
            } else if (typeTwo == 1) {
                Y = bean.getTab().size() + 23;
                System.out.println("Y = " + Y);
                workbook = secondResultOnly(workbook, police, 0, Y, bean);
            } else if (typeOne == 1) {
                Y = bean.getTab().size() * 5 + 23;
                workbook = firstResults(workbook, police, 0, Y, bean);
            }
        }
        
        //Initialisation de la taille des colonnes à risques!
        sheet.setColumnView(0,18);
        sheet.setColumnView(2,14);
        sheet.setColumnView(3,14);
        sheet.setColumnView(4,16);
        sheet.setColumnView(5,13);
        
        workbook.write();
        workbook.close();
    }
    
    private WritableCellFormat[] policeInitialization() throws WriteException {
        WritableFont fontTitle = new WritableFont(WritableFont.createFont("Copperplate Gothic Light"),12,WritableFont.BOLD,false,UnderlineStyle.SINGLE);
        WritableFont fontLabel = new WritableFont(WritableFont.createFont("Copperplate Gothic Light"),10,WritableFont.NO_BOLD,false,UnderlineStyle.NO_UNDERLINE);
        WritableFont fontResult = new WritableFont(WritableFont.createFont("Copperplate Gothic Light"),9,WritableFont.NO_BOLD,false,UnderlineStyle.NO_UNDERLINE);
        WritableFont fontComment = new WritableFont(WritableFont.createFont("Copperplate Gothic Light"),8,WritableFont.NO_BOLD,true,UnderlineStyle.NO_UNDERLINE);
        WritableFont fontSubTitle = new WritableFont(WritableFont.createFont("Copperplate Gothic Light"),10,WritableFont.BOLD,false,UnderlineStyle.SINGLE);
        WritableFont fontBigResult = new WritableFont(WritableFont.createFont("Copperplate Gothic Light"),10,WritableFont.BOLD,false,UnderlineStyle.NO_UNDERLINE);
        WritableFont fontTitleComment = new WritableFont(WritableFont.ARIAL,14,WritableFont.BOLD,false,UnderlineStyle.SINGLE);
        WritableFont fontBigComment = new WritableFont(WritableFont.ARIAL,12,WritableFont.BOLD,false,UnderlineStyle.NO_UNDERLINE);
        
        WritableCellFormat [] police = new WritableCellFormat[50];
        
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
        police[42] = new WritableCellFormat(fontLabel);
        police[42].setBorder(Border.ALL, BorderLineStyle.SLANTED_DASH_DOT);
        police[42].setAlignment(jxl.format.Alignment.CENTRE);
        police[42].setVerticalAlignment(jxl.format.VerticalAlignment.CENTRE);
        police[43] = new WritableCellFormat(fontLabel);
        police[43].setBorder(Border.LEFT, BorderLineStyle.SLANTED_DASH_DOT);
        police[43].setBorder(Border.BOTTOM, BorderLineStyle.SLANTED_DASH_DOT);
        police[43].setAlignment(jxl.format.Alignment.CENTRE);
        police[43].setVerticalAlignment(jxl.format.VerticalAlignment.CENTRE);
        police[44] = new WritableCellFormat(fontResult);
        police[44].setBorder(Border.LEFT, BorderLineStyle.THIN);
        police[44].setBorder(Border.BOTTOM, BorderLineStyle.SLANTED_DASH_DOT);
        police[44].setAlignment(jxl.format.Alignment.CENTRE);
        police[44].setVerticalAlignment(jxl.format.VerticalAlignment.CENTRE);
        police[45] = new WritableCellFormat(fontLabel);
        police[45].setBorder(Border.LEFT, BorderLineStyle.SLANTED_DASH_DOT);
        police[45].setBorder(Border.RIGHT, BorderLineStyle.THIN);
        police[45].setAlignment(jxl.format.Alignment.CENTRE);
        police[46] = new WritableCellFormat(fontLabel);
        police[46].setBorder(Border.LEFT, BorderLineStyle.SLANTED_DASH_DOT);
        police[46].setBorder(Border.BOTTOM, BorderLineStyle.SLANTED_DASH_DOT);
        police[46].setBorder(Border.RIGHT, BorderLineStyle.THIN);
        police[47] = new WritableCellFormat(fontResult);
        police[47].setBorder(Border.BOTTOM, BorderLineStyle.SLANTED_DASH_DOT);
        police[47].setBorder(Border.RIGHT, BorderLineStyle.SLANTED_DASH_DOT);
        police[48] = new WritableCellFormat(fontLabel);
        police[48].setBorder(Border.BOTTOM, BorderLineStyle.SLANTED_DASH_DOT);
        police[48].setBorder(Border.RIGHT, BorderLineStyle.SLANTED_DASH_DOT);
        police[48].setBorder(Border.LEFT, BorderLineStyle.THIN);
        police[48].setAlignment(jxl.format.Alignment.CENTRE);
        police[48].setVerticalAlignment(jxl.format.VerticalAlignment.CENTRE);
        police[49] = new WritableCellFormat(fontResult);
        police[49].setAlignment(jxl.format.Alignment.CENTRE);
        
        
        return police;
    }
    
    private WritableWorkbook firstTabs(WritableWorkbook workbook, WritableCellFormat[] policeCellFormat, int col, int row, displayForm bean, int i) throws WriteException {
        WritableSheet sheet = workbook.getSheet("Sheet1");
        WritableCellFormat [] police = policeCellFormat;
        
        ArrayList tab = bean.getTab();
        
        try {
            tabDetail tmp = (tabDetail) tab.get(i);
            Label cell1 = new Label(col, row + 1, "Número del test :", police[43]);
            Number cell2 = new Number(col + 1, row + 1, Integer.parseInt(tmp.getTestNum()), police[44]);
            Label cell3 = new Label(col + 2, row + 1, "Humedad :", police[45]);
            Label cell4 = new Label(col + 3, row + 1, tmp.getHumidity().concat(" %"), police[7]);
            Label cell5 = new Label(col + 2, row + 2, "Color :", police[45]);
            Label cell6 = new Label(col + 3, row + 2, tmp.getColor(), police[7]);
            Label cell7 = new Label(col + 2, row + 3, "Odor :", police[45]);
            Label cell8 = new Label(col + 3, row + 3, tmp.getSmell(), police[7]);
            Label cell9 = new Label(col + 2, row + 4, "Densidad :", police[45]);
            Label cell10 = new Label(col + 3, row + 4, tmp.getDenseness().concat(" g"), police[7]);
            Label cell11 = new Label(col + 2, row + 5, "Uniformidad :", police[46]);
            Label cell12 = new Label(col + 3, row + 5, tmp.getUniformity(), police[47]);
            Label cell13 = new Label(col + 4, row + 1, "", police[45]);
            Label cell14 = new Label(col + 5, row + 5, "", police[47]);
            Label cell23 = new Label(col + 4, row + 5, "", police[46]);
            Number cell15 = new Number(col + 4, row + 2, Integer.parseInt(tmp.getBigGrain()), police[45]);
            Label cell16 = new Label(col + 5, row + 2, tmp.getFirstGrain().concat(" %"), police[49]);
            Number cell17 = new Number(col + 4, row + 3, Integer.parseInt(tmp.getMediumGrain()), police[45]);
            Label cell18 = new Label(col + 5, row + 3, tmp.getSecondGrain().concat(" %"), police[49]);
            Number cell19 = new Number(col + 4, row + 4, Integer.parseInt(tmp.getSmallGrain()), police[45]);
            Label cell20 = new Label(col + 5, row + 4, tmp.getThirdGrain().concat(" %"), police[49]);
            Label cell21 = new Label(col + 6, row + 1, "Nota :", police[43]);
            Number cell22 = new Number(col + 7, row + 1, Integer.parseInt(tmp.getFlawMark()), police[48]);
            sheet.addCell(cell1);sheet.addCell(cell2);sheet.addCell(cell3);sheet.addCell(cell4);sheet.addCell(cell5);sheet.addCell(cell6);sheet.addCell(cell7);sheet.addCell(cell8);sheet.addCell(cell9);sheet.addCell(cell10);sheet.addCell(cell13);sheet.addCell(cell23);
            sheet.addCell(cell15);sheet.addCell(cell16);sheet.addCell(cell17);sheet.addCell(cell18);sheet.addCell(cell19);sheet.addCell(cell20);sheet.addCell(cell21);sheet.addCell(cell22);sheet.addCell(cell11);sheet.addCell(cell12);sheet.addCell(cell14);
            sheet.mergeCells(col, row + 1, col, row + 5);
            sheet.mergeCells(col + 1, row + 1, col + 1, row + 5);
            sheet.mergeCells(col + 7, row + 1, col + 7, row + 5);
            sheet.mergeCells(col + 6, row + 1, col + 6, row + 5);
        } catch (Exception e) {return workbook;}
        
        
        return workbook;
    }
    
    private WritableWorkbook secondTabOnly(WritableWorkbook workbook, WritableCellFormat[] policeCellFormat, int col, int row, displayForm bean, int i) throws WriteException {
        WritableSheet sheet = workbook.getSheet("Sheet1");
        WritableCellFormat [] police = policeCellFormat;
        
        try {
            tabDetail tmp = (tabDetail) bean.getTab().get(i);
            Label cell = new Label(col, row + 1, "Número del test :", police[43]);
            Number cell1 = new Number(col + 1, row + 1, Integer.parseInt(tmp.getTestNum()), police[44]);
            Label cell2 = new Label(col + 2, row + 1, "Nota :", police[43]);
            Number cell3 = new Number(col + 3, row + 1, Integer.parseInt(tmp.getTastingMark()), police[48]);
            sheet.addCell(cell);sheet.addCell(cell1);sheet.addCell(cell2);sheet.addCell(cell3);
        } catch (Exception e) {return workbook;}
        
        return workbook;
    }
    
    private WritableWorkbook secondTab(WritableWorkbook workbook, WritableCellFormat[] policeCellFormat, int col, int row, displayForm bean, int i) throws WriteException {
        WritableSheet sheet = workbook.getSheet("Sheet1");
        WritableCellFormat [] police = policeCellFormat;
        
        try {
            tabDetail tmp = (tabDetail) bean.getTab().get(i);
            Label cell = new Label(col, row + 1, "Nota :", police[43]);
            Number cell1 = new Number(col + 1, row + 1, Integer.parseInt(tmp.getTastingMark()), police[48]);
            sheet.addCell(cell);sheet.addCell(cell1);
            sheet.mergeCells(col, row + 1, col, row + 5);
            sheet.mergeCells(col + 1, row + 1, col + 1, row + 5);
        } catch (Exception e) {return workbook;}
        
        return workbook;
    }
    
    private WritableWorkbook firstResults(WritableWorkbook workbook, WritableCellFormat[] policeCellFormat, int col, int row, displayForm bean) throws WriteException {
        WritableSheet sheet = workbook.getSheet("Sheet1");
        WritableCellFormat [] police = policeCellFormat;
        
        ArrayList result = bean.getResult();
        try {
            tabDetail tmp = (tabDetail) result.get(0);
            Label cell1 = new Label(col, row + 1, "Media :", police[42]);
            Label cell3 = new Label(col + 2, row + 1, "Humedad :", police[45]);
            Label cell4 = new Label(col + 3, row + 1, tmp.getHumidity().concat(" %"), police[7]);
            Label cell5 = new Label(col + 2, row + 2, "Color :", police[45]);
            Label cell6 = new Label(col + 3, row + 2, tmp.getColor(), police[7]);
            Label cell7 = new Label(col + 2, row + 3, "Odor :", police[45]);
            Label cell8 = new Label(col + 3, row + 3, tmp.getSmell(), police[7]);
            Label cell9 = new Label(col + 2, row + 4, "Densidad :", police[45]);
            Label cell10 = new Label(col + 3, row + 4, tmp.getDenseness().concat(" g"), police[7]);
            Label cell11 = new Label(col + 2, row + 5, "Uniformidad :", police[46]);
            Label cell12 = new Label(col + 3, row + 5, tmp.getUniformity(), police[47]);
            Label cell13 = new Label(col + 4, row + 1, "", police[45]);
            Label cell14 = new Label(col + 5, row + 5, "", police[47]);
            Label cell23 = new Label(col + 4, row + 5, "", police[46]);
            Number cell15 = new Number(col + 4, row + 2, Integer.parseInt(tmp.getBigGrain()), police[45]);
            Label cell16 = new Label(col + 5, row + 2, tmp.getFirstGrain().concat(" %"), police[49]);
            Number cell17 = new Number(col + 4, row + 3, Integer.parseInt(tmp.getMediumGrain()), police[45]);
            Label cell18 = new Label(col + 5, row + 3, tmp.getSecondGrain().concat(" %"), police[49]);
            Number cell19 = new Number(col + 4, row + 4, Integer.parseInt(tmp.getSmallGrain()), police[45]);
            Label cell20 = new Label(col + 5, row + 4, tmp.getThirdGrain().concat(" %"), police[49]);
            Label cell21 = new Label(col + 6, row + 1, "Media :", police[43]);
            Number cell22 = new Number(col + 7, row + 1, Integer.parseInt(tmp.getFlawMark()), police[48]);
            sheet.addCell(cell1);sheet.addCell(cell3);sheet.addCell(cell4);sheet.addCell(cell5);sheet.addCell(cell6);sheet.addCell(cell7);sheet.addCell(cell8);sheet.addCell(cell9);sheet.addCell(cell10);sheet.addCell(cell13);sheet.addCell(cell23);
            sheet.addCell(cell15);sheet.addCell(cell16);sheet.addCell(cell17);sheet.addCell(cell18);sheet.addCell(cell19);sheet.addCell(cell20);sheet.addCell(cell21);sheet.addCell(cell22);sheet.addCell(cell11);sheet.addCell(cell12);sheet.addCell(cell14);
            sheet.mergeCells(col, row + 1, col + 1, row + 5);
            sheet.mergeCells(col + 7, row + 1, col + 7, row + 5);
            sheet.mergeCells(col + 6, row + 1, col + 6, row + 5);
        } catch (Exception e) {return workbook;}
        return workbook;
    }
    
    private WritableWorkbook secondResultOnly(WritableWorkbook workbook, WritableCellFormat[] policeCellFormat, int col, int row, displayForm bean) throws WriteException {
        WritableSheet sheet = workbook.getSheet("Sheet1");
        WritableCellFormat [] police = policeCellFormat;
        
        ArrayList result = bean.getResult();
        try {
            tabDetail tmp = (tabDetail) result.get(0);
            Label cell2 = new Label(col, row + 1, "Media :", police[42]);
            Label cell = new Label(col + 2, row + 1, "Media :", police[43]);
            Number cell1 = new Number(col + 3, row + 1, Integer.parseInt(tmp.getTastingMark()), police[48]);
            sheet.addCell(cell);sheet.addCell(cell1);sheet.addCell(cell2);
            sheet.mergeCells(col, row + 1, col + 1, row + 1);
        } catch (Exception e) {return workbook;}
        return workbook;
    }
    
    private WritableWorkbook secondResult(WritableWorkbook workbook, WritableCellFormat[] policeCellFormat, int col, int row, displayForm bean) throws WriteException {
        WritableSheet sheet = workbook.getSheet("Sheet1");
        WritableCellFormat [] police = policeCellFormat;
        
        ArrayList result = bean.getResult();
        try {
            tabDetail tmp = (tabDetail) result.get(0);
            Label cell = new Label(col, row + 1, "Media :", police[43]);
            Number cell1 = new Number(col + 1, row + 1, Integer.parseInt(tmp.getTastingMark()), police[48]);
            sheet.addCell(cell);sheet.addCell(cell1);
            sheet.mergeCells(col, row + 1, col, row + 5);
            sheet.mergeCells(col + 1, row + 1, col + 1, row + 5);
        } catch (Exception e) {return workbook;}
        return workbook;
    }
    
    private WritableWorkbook inform(WritableWorkbook workbook, WritableCellFormat[] policeCellFormat, int col, int row, displayForm bean) throws WriteException {
        WritableSheet sheet = workbook.getSheet("Sheet1");
        WritableCellFormat [] police = policeCellFormat;
        int i;
        
        String beginDate = bean.getBeginDate(), endDate = bean.getEndDate();
        
        if(endDate != ""){
            String tmp = "De  ".concat(beginDate).concat("  a  ").concat(endDate);
            Label label2 = new Label(col + 2, row + 2, "Fecha", police[2]);
            Label label3 = new Label(col + 3, row + 2, tmp , police[7]);
            sheet.addCell(label2);sheet.addCell(label3);
        }else {
            Label label2 = new Label(col + 2, row + 2, "Fecha", police[2]);
            Label label3 = new Label(col + 3, row + 2, beginDate , police[7]);
            sheet.addCell(label2);sheet.addCell(label3);
        }
        
        //Ecriture du tableau d'informations générales
        Label label1 = new Label(col, row, "Generali Informacion", police[1]);
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
        
        sheet.addCell(label1);sheet.addCell(label4);sheet.addCell(label5);sheet.addCell(label6);sheet.addCell(label7);
        sheet.addCell(label8);sheet.addCell(label9);sheet.addCell(label10);sheet.addCell(label11);sheet.addCell(label12);sheet.addCell(label13);sheet.addCell(label14);
        sheet.addCell(label15);
        
        //Construction des bordures !
        for (i=1;i<5;i++) {
            Label cellT = new Label(col + i, row, "", police[21]);
            Label cellB = new Label(col + i, row + 11, "", police[22]);
            sheet.addCell(cellT);sheet.addCell(cellB);
        }
        Label cellTR = new Label(col + 5, row + 0, "", police[31]);
        Label cellBL = new Label(col + 0, row + 11, "", police[29]);
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
        sheet.mergeCells(col,row,col + 2,row); //Fusionne les cellules pour le titre !
        
        
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
    
    private WritableWorkbook firstTabsHeader(WritableWorkbook workbook, WritableCellFormat[] policeCellFormat, int col, int row) throws WriteException {
        WritableSheet sheet = workbook.getSheet("Sheet1");
        WritableCellFormat [] police = policeCellFormat;
        
        Label Label = new Label(col, row, "Identificación del test", police[42]);
        Label Label1 = new Label(col + 2, row, "Café verde", police[42]);
        Label Label2 = new Label(col + 4, row, "Tamaño", police[42]);
        Label Label3 = new Label(col + 6, row, "Defectos", police[42]);
        sheet.addCell(Label);sheet.addCell(Label1);sheet.addCell(Label2);sheet.addCell(Label3);
        sheet.mergeCells(col,row,col + 1,row);
        sheet.mergeCells(col + 2,row,col + 3,row);
        sheet.mergeCells(col + 4,row,col + 5,row);
        sheet.mergeCells(col + 6,row,col + 7,row);
        
        
        return workbook;
    }
    
    private WritableWorkbook secondTabsHeader(WritableWorkbook workbook, WritableCellFormat[] policeCellFormat, int col, int row) throws WriteException {
        WritableSheet sheet = workbook.getSheet("Sheet1");
        WritableCellFormat [] police = policeCellFormat;
        
        Label Label = new Label(col, row, "Catacion", police[42]);
        sheet.mergeCells(col,row,col + 1,row);
        sheet.addCell(Label);
        
        return workbook;
    }
    
    private WritableWorkbook secondTabsHeaderOnly(WritableWorkbook workbook, WritableCellFormat[] policeCellFormat, int col, int row) throws WriteException {
        WritableSheet sheet = workbook.getSheet("Sheet1");
        WritableCellFormat [] police = policeCellFormat;
        
        Label Label2 = new Label(col, row, "Identificación del test", police[42]);
        Label Label = new Label(col + 2, row, "Catacion", police[42]);
        sheet.mergeCells(col,row,col + 1,row);
        sheet.mergeCells(col + 2,row,col + 3,row);
        sheet.addCell(Label);sheet.addCell(Label2);
        
        return workbook;
    }

    private WritableWorkbook firstTabsBoth(WritableWorkbook workbook, WritableCellFormat[] policeCellFormat, int col, int row, displayForm bean, int i) {
        WritableSheet sheet = workbook.getSheet("Sheet1");
        WritableCellFormat [] police = policeCellFormat;
        
        ArrayList tab = bean.getTab();
        
        try {
            tabDetail tmp = (tabDetail) tab.get(i);
            Label cell1 = new Label(col, row + 1, "Número del test :", police[43]);
            Number cell2 = new Number(col + 1, row + 1, Integer.parseInt(tmp.getTestNum()), police[44]);
            Label cell3 = new Label(col + 2, row + 1, "Humedad :", police[45]);
            Label cell4 = new Label(col + 3, row + 1, tmp.getHumidity().concat(" %"), police[7]);
            Label cell5 = new Label(col + 2, row + 2, "Color :", police[45]);
            Label cell6 = new Label(col + 3, row + 2, tmp.getColor(), police[7]);
            Label cell7 = new Label(col + 2, row + 3, "Odor :", police[45]);
            Label cell8 = new Label(col + 3, row + 3, tmp.getSmell(), police[7]);
            Label cell9 = new Label(col + 2, row + 4, "Densidad :", police[45]);
            Label cell10 = new Label(col + 3, row + 4, tmp.getDenseness().concat(" g"), police[7]);
            Label cell11 = new Label(col + 2, row + 5, "Uniformidad :", police[46]);
            Label cell12 = new Label(col + 3, row + 5, tmp.getUniformity(), police[47]);
            Label cell13 = new Label(col + 4, row + 1, "", police[45]);
            Label cell14 = new Label(col + 5, row + 5, "", police[47]);
            Label cell23 = new Label(col + 4, row + 5, "", police[46]);
            Number cell15 = new Number(col + 4, row + 2, Integer.parseInt(tmp.getBigGrain()), police[45]);
            Label cell16 = new Label(col + 5, row + 2, tmp.getFirstGrain().concat(" %"), police[49]);
            Number cell17 = new Number(col + 4, row + 3, Integer.parseInt(tmp.getMediumGrain()), police[45]);
            Label cell18 = new Label(col + 5, row + 3, tmp.getSecondGrain().concat(" %"), police[49]);
            Number cell19 = new Number(col + 4, row + 4, Integer.parseInt(tmp.getSmallGrain()), police[45]);
            Label cell20 = new Label(col + 5, row + 4, tmp.getThirdGrain().concat(" %"), police[49]);
            Label cell21 = new Label(col + 6, row + 1, "Nota :", police[43]);
            Number cell22 = new Number(col + 7, row + 1, Integer.parseInt(tmp.getFlawMark()), police[48]);
            Label cell24 = new Label(col + 8, row + 1, "", police[42]);
            sheet.addCell(cell1);sheet.addCell(cell2);sheet.addCell(cell3);sheet.addCell(cell4);sheet.addCell(cell5);sheet.addCell(cell6);sheet.addCell(cell7);sheet.addCell(cell8);sheet.addCell(cell9);sheet.addCell(cell10);sheet.addCell(cell13);sheet.addCell(cell23);
            sheet.addCell(cell15);sheet.addCell(cell16);sheet.addCell(cell17);sheet.addCell(cell18);sheet.addCell(cell19);sheet.addCell(cell20);sheet.addCell(cell21);sheet.addCell(cell22);sheet.addCell(cell11);sheet.addCell(cell12);sheet.addCell(cell14);
            sheet.addCell(cell24);
            sheet.mergeCells(col + 8, row + 1, col + 9, row + 5);
            sheet.mergeCells(col, row + 1, col, row + 5);
            sheet.mergeCells(col + 1, row + 1, col + 1, row + 5);
            sheet.mergeCells(col + 7, row + 1, col + 7, row + 5);
            sheet.mergeCells(col + 6, row + 1, col + 6, row + 5);
        } catch (Exception e) {return workbook;}
        
        
        return workbook;
    }

    private WritableWorkbook secondTabBoth(WritableWorkbook workbook, WritableCellFormat[] policeCellFormat, int col, int row, displayForm bean, int i) {
        WritableSheet sheet = workbook.getSheet("Sheet1");
        WritableCellFormat [] police = policeCellFormat;
        
        try {
            tabDetail tmp = (tabDetail) bean.getTab().get(i);
            Label cell3 = new Label(col, row + 1, "Número del test :", police[43]);
            Number cell4 = new Number(col + 1, row + 1, Integer.parseInt(tmp.getTestNum()), police[44]);
            Label cell = new Label(col + 8, row + 1, "Nota :", police[43]);
            Number cell1 = new Number(col + 9, row + 1, Integer.parseInt(tmp.getTastingMark()), police[48]);
            Label cell5 = new Label(col + 2, row + 1, "", police[43]);
            Label cell6 = new Label(col + 4, row + 1, "", police[43]);
            Label cell7 = new Label(col + 6, row + 1, "", police[43]);
            sheet.addCell(cell);sheet.addCell(cell1);sheet.addCell(cell3);sheet.addCell(cell4);sheet.addCell(cell5);sheet.addCell(cell6);sheet.addCell(cell7);
            
            sheet.mergeCells(col, row + 1, col, row + 5);
            sheet.mergeCells(col + 1, row + 1, col + 1, row + 5);
            sheet.mergeCells(col + 8, row + 1, col + 8, row + 5);
            sheet.mergeCells(col + 9, row + 1, col + 9, row + 5);
            sheet.mergeCells(col + 2, row + 1, col + 3, row + 5);
            sheet.mergeCells(col + 4, row + 1, col + 5, row + 5);
            sheet.mergeCells(col + 6, row + 1, col + 7, row + 5);
        } catch (Exception e) {return workbook;}
        
        return workbook;
    }
}