<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="3.0">
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>

    <xsl:template match="/">
        <fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">
            <fo:layout-master-set>
                <fo:simple-page-master master-name="Gwiazdy" page-height="5in" page-width="12in" font-family="tahoma">
                    <fo:region-body region-name="only_region" background-color="#699CFC"/>
                </fo:simple-page-master>
                <fo:simple-page-master master-name="Konstelacje" page-height="5in" page-width="12in" font-family="tahoma">
                    <fo:region-body region-name="only_region" background-color="#699CFC"/>
                </fo:simple-page-master>
                <fo:simple-page-master master-name="Podsumowanie" page-height="5in" page-width="12in" font-family="tahoma">
                    <fo:region-body region-name="only_region" background-color="#699CFC"/>
                </fo:simple-page-master>
            </fo:layout-master-set>

            <fo:page-sequence master-reference="Gwiazdy">
                <fo:flow flow-name="only_region">
                    <fo:block text-align="center" font-weight="bold" font-family="Arial" font-size="20"> Gwiazdy </fo:block>
                         <fo:table border="solid 2pt black">
                            <fo:table-header>
                                <fo:table-row>
                                    <fo:table-cell>
                                        <fo:block text-align="center" font-weight="bold" border-bottom="solid 1pt black" border-right="solid 1pt black">Nazwa</fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell>
                                        <fo:block text-align="center" font-weight="bold" border-bottom="solid 1pt black" border-right="solid 1pt black">Rodzaj</fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell>
                                        <fo:block text-align="center" font-weight="bold" border-bottom="solid 1pt black" border-right="solid 1pt black">Masa</fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell>
                                        <fo:block text-align="center" font-weight="bold" border-bottom="solid 1pt black" border-right="solid 1pt black">Promień</fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell>
                                        <fo:block text-align="center" font-weight="bold" border-bottom="solid 1pt black" border-right="solid 1pt black">Temperatura</fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell>
                                        <fo:block text-align="center" font-weight="bold" border-bottom="solid 1pt black" border-right="solid 1pt black">Gwiazdozbiór</fo:block>
                                    </fo:table-cell>
                                </fo:table-row>
                            </fo:table-header>
                             <xsl:for-each select="GwiazdkaReport/Gwiazda">
                                 <fo:table-body>
                                     <fo:table-row>
                                         <fo:table-cell>
                                             <fo:block text-align="center" border-bottom="solid 1pt black" border-right="solid 1pt blackn"><xsl:value-of select="@Nazwa"/></fo:block>
                                         </fo:table-cell>
                                         <fo:table-cell>
                                             <fo:block text-align="center" border-bottom="solid 1pt black" border-right="solid 1pt black"><xsl:value-of select="@Rodzaj"/></fo:block>
                                         </fo:table-cell>
                                         <fo:table-cell>
                                             <fo:block text-align="center" border-bottom="solid 1pt black" border-right="solid 1pt black"><xsl:value-of select="@Masa"/></fo:block>
                                         </fo:table-cell>
                                         <fo:table-cell>
                                             <fo:block text-align="center" border-bottom="solid 1pt black" border-right="solid 1pt black"><xsl:value-of select="@Promień"/></fo:block>
                                         </fo:table-cell>
                                         <fo:table-cell>
                                             <fo:block text-align="center" border-bottom="solid 1pt black" border-right="solid 1pt black"><xsl:value-of select="@Temp"/></fo:block>
                                         </fo:table-cell>
                                         <fo:table-cell>
                                             <fo:block text-align="center" border-bottom="solid 1pt black" border-right="solid 1pt black"><xsl:value-of select="@Gwiazdozbiór"/></fo:block>
                                         </fo:table-cell>
                                     </fo:table-row>
                                 </fo:table-body>
                             </xsl:for-each>
                         </fo:table>
                </fo:flow>
            </fo:page-sequence>

            <fo:page-sequence master-reference="Konstelacje">
                <fo:flow flow-name="only_region">
                    <fo:block text-align="center" font-weight="bold" font-family="Arial" font-size="20"> Konstelacje </fo:block>
                        <fo:table border="solid 2pt black">
                            <fo:table-header>
                                <fo:table-row>
                                    <fo:table-cell>
                                        <fo:block text-align="center" font-weight="bold" border-bottom="solid 1pt black" border-right="solid 1pt black">Nazwa</fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell>
                                        <fo:block text-align="center" font-weight="bold" border-bottom="solid 1pt black" border-right="solid 1pt black">Łacińska nazwa</fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell>
                                        <fo:block text-align="center" font-weight="bold" border-bottom="solid 1pt black" border-right="solid 1pt black">Rektascensja</fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell>
                                        <fo:block text-align="center" font-weight="bold" border-bottom="solid 1pt black" border-right="solid 1pt black">Deklinacja</fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell>
                                        <fo:block text-align="center" font-weight="bold" border-bottom="solid 1pt black" border-right="solid 1pt black">Powierzchnia</fo:block>
                                    </fo:table-cell>
                                </fo:table-row>
                            </fo:table-header>
                            <xsl:for-each select="GwiazdkaReport/Konstelacja">
                                <fo:table-body>
                                    <fo:table-row>
                                        <fo:table-cell>
                                            <fo:block text-align="center" border-bottom="solid 1pt black" border-right="solid 1pt black"><xsl:value-of select="@Nazwa"/></fo:block>
                                        </fo:table-cell>
                                        <fo:table-cell>
                                            <fo:block text-align="center" border-bottom="solid 1pt black" border-right="solid 1pt black"><xsl:value-of select="@Łacińska_nazwa"/></fo:block>
                                        </fo:table-cell>
                                        <fo:table-cell>
                                            <fo:block text-align="center" border-bottom="solid 1pt black" border-right="solid 1pt black"><xsl:value-of select="@Rektascensja"/></fo:block>
                                        </fo:table-cell>
                                        <fo:table-cell>
                                            <fo:block text-align="center" border-bottom="solid 1pt black" border-right="solid 1pt black"><xsl:value-of select="@Deklinacja"/></fo:block>
                                        </fo:table-cell>
                                        <fo:table-cell>
                                            <fo:block text-align="center" border-bottom="solid 1pt black" border-right="solid 1pt black"><xsl:value-of select="@Powierzchnia"/></fo:block>
                                        </fo:table-cell>
                                    </fo:table-row>
                                </fo:table-body>
                            </xsl:for-each>
                        </fo:table>
                </fo:flow>
            </fo:page-sequence>

            <fo:page-sequence master-reference="Podsumowanie">
                <fo:flow flow-name="only_region">
                    <fo:block text-align="center" font-weight="bold" font-size="20">Podsumowanie</fo:block>
                    <fo:list-block>
                        <fo:list-item>
                            <fo:list-item-label>
                                <fo:block margin-left="3in">Liczba Gwiazd: </fo:block>
                            </fo:list-item-label>
                            <fo:list-item-body>
                                <fo:block margin-left="7in"><xsl:value-of select="GwiazdkaReport/Podsumowanie/liczbaGwiazd"/></fo:block>
                            </fo:list-item-body>
                        </fo:list-item>
                    </fo:list-block>
                    <fo:list-block>
                        <fo:list-item>
                            <fo:list-item-label>
                                <fo:block margin-left="3in">Liczba Konstelacji: </fo:block>
                            </fo:list-item-label>
                            <fo:list-item-body>
                                <fo:block margin-left="7in"><xsl:value-of select="GwiazdkaReport/Podsumowanie/liczbaKonstelacji"/></fo:block>
                            </fo:list-item-body>
                        </fo:list-item>
                        <fo:list-item>
                            <fo:list-item-label>
                                <fo:block margin-left="3in">Liczba Karłów: </fo:block>
                            </fo:list-item-label>
                            <fo:list-item-body>
                                <fo:block margin-left="7in"><xsl:value-of select="GwiazdkaReport/Podsumowanie/liczbaKarłów"/></fo:block>
                            </fo:list-item-body>
                        </fo:list-item>
                    </fo:list-block>
                    <fo:list-block>
                        <fo:list-item>
                            <fo:list-item-label>
                                <fo:block margin-left="3in">Liczba Olbrzymów: </fo:block>
                            </fo:list-item-label>
                            <fo:list-item-body>
                                <fo:block margin-left="7in"><xsl:value-of select="GwiazdkaReport/Podsumowanie/liczbaOlbrzymów"/></fo:block>
                            </fo:list-item-body>
                        </fo:list-item>
                    </fo:list-block>
                    <fo:list-block>
                        <fo:list-item>
                            <fo:list-item-label>
                                <fo:block margin-left="3in">Liczba Podolbrzymów: </fo:block>
                            </fo:list-item-label>
                            <fo:list-item-body>
                                <fo:block margin-left="7in"><xsl:value-of select="GwiazdkaReport/Podsumowanie/liczbaPodolbrzymów"/></fo:block>
                            </fo:list-item-body>
                        </fo:list-item>
                    </fo:list-block>
                    <fo:list-block>
                        <fo:list-item>
                            <fo:list-item-label>
                                <fo:block margin-left="3in">Liczba Nadolbrzymów: </fo:block>
                            </fo:list-item-label>
                            <fo:list-item-body>
                                <fo:block margin-left="7in"><xsl:value-of select="GwiazdkaReport/Podsumowanie/liczbaNadolbrzymów"/></fo:block>
                            </fo:list-item-body>
                        </fo:list-item>
                    </fo:list-block>
                    <fo:list-block>
                        <fo:list-item>
                            <fo:list-item-label>
                                <fo:block margin-left="3in">Data Wygenerowania Raportu: </fo:block>
                            </fo:list-item-label>
                            <fo:list-item-body>
                                <fo:block margin-left="7in"><xsl:value-of select="GwiazdkaReport/Podsumowanie/dataWygenerowaniaRaportu"/></fo:block>
                            </fo:list-item-body>
                        </fo:list-item>
                    </fo:list-block>
                </fo:flow>
            </fo:page-sequence>
        </fo:root>
    </xsl:template>
</xsl:stylesheet>