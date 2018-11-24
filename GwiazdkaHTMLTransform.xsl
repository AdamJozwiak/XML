<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output method="xml"
            doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"
            doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" indent="yes"/>

    <xsl:template match="/">
        <html xmlns="http://www.w3.org/1999/xhtml" xml:lang="pl" lang="pl">
            <head>
                <title>Gwiazdy i Ich Konstelacje</title>
            </head>
                <body>
                    <h2>Gwiazdy i Ich Konstelacje</h2>
                    <table border="2">
                        <caption><b>Gwiazdy</b></caption>
                        <tr>
                            <th>Nazwa</th>
                            <th>Rodzaj</th>
                            <th>Odległość_od_Ziemi</th>
                            <th>Masa</th>
                            <th>Promień</th>
                            <th>Data_odkrycia</th>
                            <th>Wiek</th>
                            <th>Temp</th>
                        </tr>
                            <xsl:for-each select="GwiazdkaReport/Gwiazda">
                                    <tr>
                                        <td><xsl:value-of select="@Nazwa"/></td>
                                        <td><xsl:value-of select="@Rodzaj"/></td>
                                        <td><xsl:value-of select="@Odległość_od_Ziemi"/></td>
                                        <td><xsl:value-of select="@Masa"/></td>
                                        <td><xsl:value-of select="@Promień"/></td>
                                        <td><xsl:value-of select="@Data_odkrycia"/></td>
                                        <td><xsl:value-of select="@Wiek"/></td>
                                        <td><xsl:value-of select="@Temp"/></td>
                                    </tr>
                            </xsl:for-each>
                    </table>
                    <br />
                    <table border="2">
                        <caption><b>Konstelacje</b></caption>
                        <tr>
                            <th>Nazwa</th>
                            <th>Łacińska_nazwa</th>
                            <th>Rektascensja</th>
                            <th>Deklinacja</th>
                            <th>Powierzchnia</th>
                        </tr>
                        <xsl:for-each select="GwiazdkaReport/Konstelacja">
                                <tr>
                                    <td><xsl:value-of select="@Nazwa"/></td>
                                    <td><xsl:value-of select="@Łacińska_nazwa"/></td>
                                    <td><xsl:value-of select="@Rektascensja"/></td>
                                    <td><xsl:value-of select="@Deklinacja"/></td>
                                    <td><xsl:value-of select="@Powierzchnia"/></td>
                                </tr>
                        </xsl:for-each>
                    </table>
                    <br />
                    <table border="3">
                        <caption><b>Podsumowanie</b></caption>
                        <tr>
                            <th>Liczba Gwiazd</th>
                            <th>Liczba Konstelacji</th>
                            <th>Liczba Karłów</th>
                            <th>Liczba Olbrzymów</th>
                            <th>Liczba Podolbrzymów</th>
                            <th>Liczba Nadolbrzymów</th>
                            <th>Czas wygenerowania dokumentu</th>
                        </tr>
                        <tr>
                            <td><xsl:value-of select="GwiazdkaReport/Podsumowanie/liczbaGwiazd"/></td>
                            <td><xsl:value-of select="GwiazdkaReport/Podsumowanie/liczbaKonstelacji"/></td>
                            <td><xsl:value-of select="GwiazdkaReport/Podsumowanie/liczbaKarłów"/></td>
                            <td><xsl:value-of select="GwiazdkaReport/Podsumowanie/liczbaOlbrzymów"/></td>
                            <td><xsl:value-of select="GwiazdkaReport/Podsumowanie/liczbaPodolbrzymów"/></td>
                            <td><xsl:value-of select="GwiazdkaReport/Podsumowanie/liczbaNadolbrzymów"/></td>
                            <td><xsl:value-of select="GwiazdkaReport/Podsumowanie/dataWygenerowaniaRaportu"/></td>
                        </tr>
                    </table>

                </body>
        </html>
    </xsl:template>
</xsl:stylesheet>