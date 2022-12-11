package com.example.gigacontrol_g2;
import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.pdmodel.PDPage;
import org.apache.pdfbox.pdmodel.PDPageContentStream;
import org.apache.pdfbox.pdmodel.common.PDRectangle;
import org.apache.pdfbox.pdmodel.font.PDFont;
import org.apache.pdfbox.pdmodel.font.PDType1Font;
import org.apache.pdfbox.pdmodel.graphics.image.PDImageXObject;

import javax.imageio.ImageIO;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.IOException;

public class JavaPDF {

    public byte[] pdfFuncionTable(String text, String titulo) throws IOException {

        //DOCUMENTO PDF
        int marginTop = 20; // Margen que yo quiera

        PDDocument document= new PDDocument(); //Creamos un documento
        PDPage page= new PDPage(PDRectangle.A4); //Creamos una pagina tipo A4
        document.addPage(page); //Añadimos una pagina al documento

        PDPageContentStream contentStream= new PDPageContentStream(document,page);

        PDRectangle mediaBox= page.getMediaBox();//Para obtener dimensiones de la pagina


        //Título
        PDFont font= PDType1Font.HELVETICA_BOLD;
        int fontsize=16;
        centrar(font, marginTop,fontsize,titulo, mediaBox,contentStream, Color.BLACK, 0, true);

        //Listamos
        String[] operadores=text.split("\n");//Obtenemos las filas
        int cantColumnas= operadores[0].split("%").length;

        String[][] tablaOperadores= new String[operadores.length][cantColumnas];
        int x=0;

        for(String fila: operadores){
            String [] columnas= fila.split("%");
            int y=0;
            for(String columna: columnas){
                tablaOperadores[x][y]=columna;
                y++;
            }
            x++;
        }

        //Diseño de letra
        font=PDType1Font.TIMES_ROMAN;
        fontsize=12;
        contentStream.setStrokingColor(Color.DARK_GRAY);
        contentStream.setLineWidth(1);

        //Diseño de tabla
        int cellWidth, cellHeight=30;//Dimensiones de las tablas
        int colCount= cantColumnas;//Numero de columnas
        int rowCount= operadores.length;//Numero de filas
        float init_x=marginTop,init_y=mediaBox.getHeight()-3*marginTop;//dos veces margintop para el título

        String lineaDirec="";
        int cant_Saltos, minLogintudSalto=23;
        int cellWidthHoraInicio=100, cellWidthPpT=100, cellWidthNum=30, cellWidthNomPeli=150;
        int cellHeightDinamic;

        //Centrar tabla
        x=70+cellWidthHoraInicio+cellWidthPpT+cellWidthNum+cellWidthNomPeli;
        float center_x=(mediaBox.getWidth() - x)/2;
        init_x= center_x;

        //Creamos la tabla
        for(int i=0;i<rowCount;i++){
            cant_Saltos= hallarSaltos(tablaOperadores[i][1],font,fontsize,cellWidthNomPeli);
            cellHeightDinamic=cellHeight*(cant_Saltos+1);

            for(int j=0;j<colCount;j++){
                cellWidth=70;
                if(j==4){
                    cellWidth= cellWidthHoraInicio;
                }if(j==2){
                    cellWidth= cellWidthPpT;
                }if(j==0){
                    cellWidth= cellWidthNum;
                }if(j==1){
                    cellWidth= cellWidthNomPeli;
                }
                contentStream.addRect(init_x,init_y, cellWidth,-cellHeightDinamic);

                if(j==1){
                    String[] deletro=tablaOperadores[i][j].split("");
                    int salto=0;
                    for(int n=0;n<(cant_Saltos+1);n++){
                        //Formo línea
                        lineaDirec="";
                        int m=salto;
                        while(true){
                            if(m<deletro.length){
                                //Me aseguro de nunca pasar el tamaño de la lista
                                if(m>minLogintudSalto*(n+1)){
                                    //Caundo pasamos el minimo de salto, buscamos un espacio
                                    if(!deletro[m].equals(" ")){
                                        lineaDirec+=deletro[m];
                                    }else{
                                        //Volveremos a la posición despues del salto
                                        salto=m+1;
                                        break;
                                    }
                                }else{
                                    lineaDirec+=deletro[m];
                                }
                            }else{
                                break;
                            }
                            m++;
                        }
                        contentStream.beginText();
                        contentStream.setFont(font,fontsize);
                        contentStream.newLineAtOffset(init_x+10, init_y-(cellHeight*(n+1))+10);
                        contentStream.showText(lineaDirec);
                        contentStream.endText();
                    }
                }else{
                    contentStream.beginText();
                    contentStream.setFont(font,fontsize);
                    contentStream.newLineAtOffset(init_x+10, init_y-cellHeight+10);
                    contentStream.showText(tablaOperadores[i][j]);
                    contentStream.endText();
                }

                init_x+=cellWidth;
            }
            init_x=center_x;//Volvemos al lado izquierdo del A4
            init_y-=cellHeightDinamic;//Bajamos de columna
        }
        contentStream.stroke();
        contentStream.close();

        ByteArrayOutputStream baos1= new ByteArrayOutputStream();
        document.save(baos1);
        document.close();
        return baos1.toByteArray();
    }

    private void centrar(PDFont font, int marginTop, int fontsize, String text, PDRectangle mediaBox, PDPageContentStream cs, Color color, int ajuste, boolean arriba) throws IOException {

        float x= getTextWidth(font, text, fontsize);
        float y= getTextHeight(font, fontsize);

        float center_x=(mediaBox.getWidth() - x)/2;
        float center_y;
        if(arriba){
            center_y=mediaBox.getHeight()-marginTop-y-ajuste;
        }else{
            center_y=marginTop+y+ajuste;
        }
        cs.beginText();
        cs.setFont(font,fontsize);
        cs.newLineAtOffset(center_x,center_y);//centramos
        cs.setNonStrokingColor(color);
        cs.showText(text);
        cs.endText();

    }

    private int hallarSaltos(String text,PDFont font, int fontsize ,int cellWidth) throws IOException {
        float tamanoLetra=getTextWidth(font,text, fontsize);
        return ((int)tamanoLetra/cellWidth);
    }
    private float getTextWidth(PDFont font, String text, int fontsize) throws IOException {
        return (font.getStringWidth(text)/1000)*fontsize;
    }
    private float getTextHeight(PDFont font, int fontsize){
        return (font.getFontDescriptor().getFontBoundingBox().getHeight()/1000) *fontsize;
    }


}
