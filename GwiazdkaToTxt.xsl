<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="text" version="1.0" encoding="UTF-8" indent="yes"/>

    <xsl:variable name="spacja" select="'                   '"/>

    <xsl:template match="/">
    Nazwa    |  Rodzaj   |       Masa       |        Promień        | Temp | Gwiazdozbiór
        <xsl:text>&#xA;</xsl:text>
        <xsl:apply-templates select="GwiazdkaReport/Gwiazda"/>
        <xsl:text>&#xA;</xsl:text>
    Nazwa      |     Łacina      | Rektascensja | Deklinacja | Powierzchnia
        <xsl:text>&#xA;</xsl:text>
        <xsl:apply-templates select="GwiazdkaReport/Konstelacja"/>
        <xsl:text>&#xA;</xsl:text>
Liczba Gwiazd | Liczba Konstelacji | Liczba Karłów | Liczba Olbrzymów | Liczba Podolbrzymów | Liczba Nadolbrzymów
        <xsl:text>&#xA;</xsl:text>
        <xsl:apply-templates select="GwiazdkaReport/Podsumowanie"/>
    </xsl:template>

    <xsl:template match="GwiazdkaReport/Gwiazda">
        <xsl:value-of select="concat(
        @Nazwa, substring($spacja, 1, 13 - string-length(@Nazwa)), '|', substring($spacja, 1, 1),
        @Rodzaj, substring($spacja, 1, 10 - string-length(@Rodzaj)), '|', substring($spacja, 1, 1),
        @Masa, substring($spacja, 1, 17 - string-length(@Masa)), '|', substring($spacja, 1, 1),
        @Promień, substring($spacja, 1, 22 - string-length(@Promień)), '|', substring($spacja, 1, 1),
        @Temp, substring($spacja, 1, 5 - string-length(@Temp)), '|', substring($spacja, 1, 1),
        @Gwiazdozbiór)"/>
        <xsl:text>&#xA;</xsl:text>
    </xsl:template>

    <xsl:template match="GwiazdkaReport/Konstelacja">
        <xsl:value-of select="concat(
        @Nazwa, substring($spacja, 1, 15 - string-length(@Nazwa)), '|', substring($spacja, 1, 1),
        @Łacińska_nazwa, substring($spacja, 1, 16 - string-length(@Łacińska_nazwa)), '|', substring($spacja, 1, 1),
        @Rektascensja, substring($spacja, 1, 13 - string-length(@Rektascensja)), '|', substring($spacja, 1, 1),
        @Deklinacja, substring($spacja, 1, 11 - string-length(@Deklinacja)), '|', substring($spacja, 1, 1),
        @Powierzchnia)"/>
        <xsl:text>&#xA;</xsl:text>
    </xsl:template>

    <xsl:template match="GwiazdkaReport/Podsumowanie">
        <xsl:value-of select="concat(substring($spacja, 1, 5),
        liczbaGwiazd, substring($spacja, 1, 9 - string-length(liczbaGwiazd)), '|', substring($spacja, 1, 8),
        liczbaKonstelacji, substring($spacja, 1, 12 - string-length(liczbaKonstelacji)), '|', substring($spacja, 1, 6),
        liczbaKarłów, substring($spacja, 1, 9 - string-length(liczbaKarłów)), '|', substring($spacja, 1, 8),
        liczbaOlbrzymów, substring($spacja, 1, 10 - string-length(liczbaOlbrzymów)), '|', substring($spacja, 1, 9),
        liczbaPodolbrzymów, substring($spacja, 1, 12 - string-length(liczbaPodolbrzymów)), '|', substring($spacja, 1, 7),
        liczbaNadolbrzymów)"/>
        <xsl:text>&#xA;</xsl:text>
        <xsl:text>&#xA;</xsl:text>
        <xsl:text>Data wygenerowania raportu:</xsl:text>
        <xsl:value-of select="dataWygenerowaniaRaportu"/>
    </xsl:template>

</xsl:stylesheet>