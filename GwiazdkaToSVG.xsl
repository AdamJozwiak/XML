<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="2.0">

    <xsl:template match="GwiazdkaReport">
        <svg width="101.6cm" height="49.6cm"  xmlns="http://www.w3.org/2000/svg">
            <rect width="100%" height="100%" fill="#8D8D8D"/>

            <script type="text/ecmascript"> <![CDATA[
            window.onload = function(){
              var theDelay = 2;
              var timer = setTimeout("showText()",theDelay*1000)
            }
            function showText(){
              document.getElementById("temp").style.visibility = "visible";
            }
		    function kolorek(evt) {
		      	var rect = evt.target;
		      	var currentFill = rect.getAttribute("fill");
		      	if (currentFill=="#E9CD30")
		        	rect.setAttribute("fill", "#3184DF");
		      	else
		        	rect.setAttribute("fill", "#E9CD30");
		   		}
	  		]]> </script>

            <text x="1300" y="150" font-family="Tahoma" font-size="100" fill="#21C929"> Powierzchnia Konstelacji </text>

            <xsl:for-each select="Konstelacja">
                <xsl:variable name="powierzchnia" select="number(substring(@Powierzchnia, 1, 4))"/>
                <xsl:variable name="stopnie" select="@Powierzchnia"/>
                <xsl:variable name="pozycja" select="position()*60"/>
                <text x="85" y="{$pozycja+200}" font-family="Tahoma" font-size="35" fill="#F1541F" text-decoration="underline"> <xsl:value-of select="@Nazwa"/> </text>
                <rect onclick="kolorek(evt)" x="450" y="{$pozycja+170}" height="30" width="0" fill="#E9CD30" stroke="black" stroke-width="2">
                    <animate attributeType="XML" attributeName="width" from="0" to="{$powierzchnia}" dur="2s" fill="freeze"/>
                </rect>
                <text id="temp" x="{460+$powierzchnia}" y="{$pozycja+196}" font-family="Arial" font-size="36" fill="#2175CA" style="visibility:hidden">
                    <xsl:value-of select="$stopnie"/>
                </text>
            </xsl:for-each>

            <xsl:variable name="karzel" select="Podsumowanie/liczbaKarłów"/>
            <xsl:variable name="olbrzym" select="Podsumowanie/liczbaOlbrzymów"/>
            <xsl:variable name="podolbrzym" select="Podsumowanie/liczbaPodolbrzymów"/>
            <xsl:variable name="nadolbrzym" select="Podsumowanie/liczbaNadolbrzymów"/>

            <text x="85" y="1250" font-family="Tahoma" font-size="35" fill="black"> Ilość Karłów </text>
            <rect onclick="kolorek(evt)" x="450" y="1215" height="40" width="0" fill="orange" stroke="black" stroke-width="2">
                <animate attributeType="XML" attributeName="width" from="0" to="{$karzel * 100}"
                         dur="3s" fill="freeze"/>
            </rect>
            <text x="1360" y="1250" font-family="Arial" font-size="36" fill="#2175CA">
                <xsl:value-of select="$karzel"/>
            </text>

            <text x="85" y="1350" font-family="Tahoma" font-size="35" fill="black"> Ilość Olbrzymów </text>
            <rect onclick="kolorek(evt)" x="450" y="1315" height="40" width="0" fill="orange" stroke="black" stroke-width="2">
                <animate attributeType="XML" attributeName="width" from="0" to="{$olbrzym * 100}"
                         dur="3s" fill="freeze"/>
            </rect>
            <text x="1060" y="1350" font-family="Arial" font-size="36" fill="#2175CA">
                <xsl:value-of select="$olbrzym"/>
            </text>

            <text x="85" y="1450" font-family="Tahoma" font-size="35" fill="black"> Ilość Podolbrzymów </text>
            <rect onclick="kolorek(evt)" x="450" y="1415" height="40" width="0" fill="orange" stroke="black" stroke-width="2">
                <animate attributeType="XML" attributeName="width" from="0" to="{$podolbrzym * 100}"
                         dur="3s" fill="freeze"/>
            </rect>
            <text x="760" y="1450" font-family="Arial" font-size="36" fill="#2175CA">
                <xsl:value-of select="$podolbrzym"/>
            </text>

            <text x="85" y="1550" font-family="Tahoma" font-size="35" fill="black"> Ilość Nadolbrzymów </text>
            <rect onclick="kolorek(evt)" x="450" y="1515" height="40" width="0" fill="orange" stroke="black" stroke-width="2">
                <animate attributeType="XML" attributeName="width" from="0" to="{$nadolbrzym * 100}"
                         dur="3s" fill="freeze"/>
            </rect>
            <text x="660" y="1550" font-family="Arial" font-size="36" fill="#2175CA">
                <xsl:value-of select="$nadolbrzym"/>
            </text>

            <text x="1700" y="1450" font-family="Tahoma" font-size="100" fill="black"> Podsumowanie </text>


        </svg>
    </xsl:template>
</xsl:stylesheet>
