<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="xml" version="1.0" encoding="UTF-8"  indent="yes"/>

    <xsl:template match="/">
        <xsl:element name="GwiazdkaReport">

            <xsl:apply-templates select="Gwiazdka/gwiazdy"/>
            <xsl:apply-templates select="Gwiazdka/gwiazdozbiory"/>

            <xsl:element name="Podsumowanie">
                <xsl:element name="liczbaGwiazd">
                    <xsl:value-of select="count(Gwiazdka/gwiazdy/gwiazda)"/>
                </xsl:element>
                <xsl:element name="liczbaKonstelacji">
                    <xsl:value-of select="count(Gwiazdka/gwiazdozbiory/konstelacja)"/>
                </xsl:element>
                <xsl:element name="liczbaKarłów">
                    <xsl:value-of select="count(Gwiazdka/gwiazdy/gwiazda[rodzaj='Karzeł'])"/>
                </xsl:element>
                <xsl:element name="liczbaOlbrzymów">
                    <xsl:value-of select="count(Gwiazdka/gwiazdy/gwiazda[rodzaj='Olbrzym'])"/>
                </xsl:element>
                <xsl:element name="liczbaPodolbrzymów">
                    <xsl:value-of select="count(Gwiazdka/gwiazdy/gwiazda[rodzaj='Nadolbrzym'])"/>
                </xsl:element>
                <xsl:element name="liczbaNadolbrzymów">
                    <xsl:value-of select="count(Gwiazdka/gwiazdy/gwiazda[rodzaj='Podolbrzym'])"/>
                </xsl:element>
                <xsl:element name="dataWygenerowaniaRaportu">
                    <xsl:value-of select="format-dateTime(current-dateTime(),'[D01]/[M01]/[Y0001]')" />
                </xsl:element>
            </xsl:element>
        </xsl:element>
    </xsl:template>

    <xsl:template match="Gwiazdka/gwiazdy">
        <xsl:for-each select="gwiazda">
            <xsl:element name="Gwiazda">
                <xsl:attribute name="Nazwa" select="nazwa"/>
                <xsl:attribute name="Rodzaj" select="rodzaj"/>
                <xsl:attribute name="Odległość_od_Ziemi" select="odległość_od_z"/>
                <xsl:attribute name="Masa" select="masa"/>
                <xsl:attribute name="Promień" select="promień"/>
                <xsl:attribute name="Data_odkrycia" select="data_odkrycia"/>
                <xsl:attribute name="Wiek" select="wiek"/>
                <xsl:attribute name="Temp" select="temp"/>
                <xsl:choose>
                    <xsl:when test="string(@gwiazdozbiór) = ''">
                        <xsl:attribute name="Gwiazdozbiór">Układ Słoneczny</xsl:attribute>
                    </xsl:when>
                    <xsl:when test="string(@gwiazdozbiór) = 'Wielki_Pies'">
                        <xsl:attribute name="Gwiazdozbiór">Wielki Pies</xsl:attribute>
                    </xsl:when>
                    <xsl:when test="string(@gwiazdozbiór) = 'Kil'">
                        <xsl:attribute name="Gwiazdozbiór">Kil</xsl:attribute>
                    </xsl:when>
                    <xsl:when test="string(@gwiazdozbiór) = 'Wolarz'">
                        <xsl:attribute name="Gwiazdozbiór">Wolarz</xsl:attribute>
                    </xsl:when>
                    <xsl:when test="string(@gwiazdozbiór) = 'Centaur'">
                        <xsl:attribute name="Gwiazdozbiór">Centaur</xsl:attribute>
                    </xsl:when>
                    <xsl:when test="string(@gwiazdozbiór) = 'Lutnia'">
                        <xsl:attribute name="Gwiazdozbiór">Lutnia</xsl:attribute>
                    </xsl:when>
                    <xsl:when test="string(@gwiazdozbiór) = 'Orion'">
                        <xsl:attribute name="Gwiazdozbiór">Orion</xsl:attribute>
                    </xsl:when>
                    <xsl:when test="string(@gwiazdozbiór) = 'Mały_Pies'">
                        <xsl:attribute name="Gwiazdozbiór">Mały Pies</xsl:attribute>
                    </xsl:when>
                    <xsl:when test="string(@gwiazdozbiór) = 'Erydan'">
                        <xsl:attribute name="Gwiazdozbiór">Erydan</xsl:attribute>
                    </xsl:when>
                    <xsl:when test="string(@gwiazdozbiór) = 'Woźnica'">
                        <xsl:attribute name="Gwiazdozbiór">Woźnica</xsl:attribute>
                    </xsl:when>
                    <xsl:when test="string(@gwiazdozbiór) = 'Orzeł'">
                        <xsl:attribute name="Gwiazdozbiór">Orzeł</xsl:attribute>
                    </xsl:when>
                    <xsl:when test="string(@gwiazdozbiór) = 'Byk'">
                        <xsl:attribute name="Gwiazdozbiór">Byk</xsl:attribute>
                    </xsl:when>
                    <xsl:when test="string(@gwiazdozbiór) = 'Panna'">
                        <xsl:attribute name="Gwiazdozbiór">Panna</xsl:attribute>
                    </xsl:when>
                    <xsl:when test="string(@gwiazdozbiór) = 'Skorpion'">
                        <xsl:attribute name="Gwiazdozbiór">Skorpion</xsl:attribute>
                    </xsl:when>
                    <xsl:when test="string(@gwiazdozbiór) = 'Bliźnięta'">
                        <xsl:attribute name="Gwiazdozbiór">Bliźnięta</xsl:attribute>
                    </xsl:when>
                    <xsl:when test="string(@gwiazdozbiór) = 'Ryba_Południowa'">
                        <xsl:attribute name="Gwiazdozbiór">Ryba Południowa</xsl:attribute>
                    </xsl:when>
                </xsl:choose>
            </xsl:element>
        </xsl:for-each>
    </xsl:template>

    <xsl:template match="Gwiazdka/gwiazdozbiory">
        <xsl:for-each select="konstelacja">
            <xsl:element name="Konstelacja">
                <xsl:attribute name="Nazwa" select="nazwa"/>
                <xsl:attribute name="Łacińska_nazwa" select="łacina"/>
                <xsl:attribute name="Rektascensja" select="rektascensja"/>
                <xsl:attribute name="Deklinacja" select="deklinacja"/>
                <xsl:attribute name="Powierzchnia" select="powierzchnia"/>
            </xsl:element>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>