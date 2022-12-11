package com.example.gigacontrol_g2.Servlets;
import com.example.gigacontrol_g2.beans.Incidencia;
import jakarta.servlet.ServletOutputStream;
import jakarta.servlet.http.HttpServletResponse;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.xssf.usermodel.XSSFFont;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import java.io.IOException;
import java.util.ArrayList;

import static org.apache.poi.ss.util.CellUtil.FONT;
import static org.apache.poi.ss.util.CellUtil.createCell;
//ExcelExportUtils name class
public class SeguridadEXCEL {
    private XSSFWorkbook workbook;
    private XSSFSheet sheet;
    private ArrayList<Incidencia> incidenciaList;

    public SeguridadEXCEL(ArrayList<Incidencia> incidenciaList) {
        this.incidenciaList = incidenciaList;
        workbook = new XSSFWorkbook();
    }

    private void createCells(Row row, int columnCount, Object value, CellStyle style){

        sheet.autoSizeColumn(columnCount);
        Cell cell = row.createCell(columnCount);
        if (value instanceof Integer) {
            cell.setCellValue((Integer)value);
        }else if(value instanceof Double){
            cell.setCellValue((Double)value);
        }else if(value instanceof Boolean){
            cell.setCellValue((Boolean)value);
        }else if(value instanceof Long){
            cell.setCellValue((Long)value);
        }else{
            cell.setCellValue((String) value);
        }
        cell.setCellStyle(style);
    }

    private void createHeaderRow(){
        sheet = workbook.createSheet("Incidencias");
        Row row = sheet.createRow(0); //Titulo
        CellStyle style = workbook.createCellStyle();
        XSSFFont font = workbook.createFont();
        font.setBold(true);
        font.setFontHeight(20); //puede variar
        style.setFont(font);

        style.setAlignment(HorizontalAlignment.CENTER);
        createCells(row,0,"Incidencias",style);
        sheet.addMergedRegion(new CellRangeAddress(0,0,0,8));
        font.setFontHeightInPoints((short) 10);

        row = sheet.createRow(1); //cabecera
        font.setBold(true);
        font.setFontHeight(16);//puede variar
        style.setFont(font);
        createCell(row, 0,"Código",style);
        createCell(row, 1,"Nombre",style);
        createCell(row, 2,"Estado",style);
        createCell(row, 3,"Nivel De Urgencia",style);
        createCell(row, 4,"Tipo de Incidencia",style);

    }
    private void writeCustomerData(){

        int rowCount = 2;
        CellStyle style = workbook.createCellStyle();
        XSSFFont font = workbook.createFont();
        font.setFontHeight(14);
        style.setFont(font);

        for(Incidencia incidencia: incidenciaList){

            Row row = sheet.createRow(rowCount++);
            int columnCount = 0;
            createCells(row,columnCount++,incidencia.getUsuario().getCodigo(), style);
            createCells(row,columnCount++,incidencia.getUsuario().getNombre(), style);
            createCells(row,columnCount++,incidencia.getEstado().getNombre(), style);
            createCells(row,columnCount++,incidencia.getNivelDeUrgencia().getNombre(), style);
            createCells(row,columnCount++,incidencia.getTipoDeIncidencia().getNombre(), style);
        }
    }

    private void exportDataToExcel(HttpServletResponse response) throws IOException {
        createHeaderRow();
        writeCustomerData();
        ServletOutputStream outputStream = response.getOutputStream();
        workbook.write(outputStream);
        workbook.close();
        outputStream.close();
    }
}
