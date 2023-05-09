<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output encoding="utf-8" method="xml"
  doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
  doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
  />

<xsl:variable name="freq"/>
<xsl:template match="root">
    <html>
        <head>
            <title>SSČ: <xsl:value-of select="h"/></title>
            <style type="text/css">
                body {
                    background: #ffffff;
                    color: #000000;
                    font-size: 130%;
                    line-height: 250%;
                }
                .lightblue {
                    color: #d0d5f9;
                }
                .darkblue {
                    color: #35428e;
                }
                .head {
                    font-size: 200%;
                }
                .button {
                    cursor: pointer;
                    background-color: #d0d5f9;
                    color: #35428e;
                    font-family: Arial, serif;
                    font-weight: bold;
                    padding: 0.7rem;
                    border-radius: 5px;
                    margin-right: 10px;
                    margin-left: 10px;
                }
                #examples {
                    display: none;
                    cursor: pointer;
                    background-color: #dee2ff;
                    color: #35428e;
                    margin-left: 40px;
                    padding-left: 0.8rem;
                    padding-right: 0.8rem;
                    border-radius: 5px;
                    font-family: Arial, serif;
                    font-size: 95%;
                }
            </style>
        </head>
        <body>
            <p><xsl:apply-templates/></p>
        </body>
    </html>

</xsl:template>

    <xsl:template match="h"><b class="darkblue head"><xsl:value-of select="text()"/></b>
        <xsl:if test="$freq!=''">
            <xsl:text> (frekvence v korpusu: </xsl:text><xsl:value-of select="$freq"/>)
        </xsl:if>
        <br/>
    </xsl:template>

    <xsl:template match="root/gram"><span class="blue"><xsl:value-of select="text()"/></span></xsl:template>

    <xsl:template match="sens">
        <div id="sense{num}">
            <xsl:choose>
                <xsl:when test="exp">
                    <xsl:value-of select="num" />
                    <span class="button" onclick="this.nextSibling.style.display='inline-block'">
                        <xsl:for-each select="exp[1]">
                            <xsl:value-of select="translate(text(), '[0123456789$~@#^]', '')"/>
                        </xsl:for-each>
                        <br/>
                    </span>
                    <xsl:if test="exm/t">
                        <span id="examples" onclick="this.style.display='none'">
                            <xsl:for-each select="exm/t">
                                <div>
                                    <xsl:value-of select="translate(text(), '[0123456789$~@#^]', '')"/>
                                </div>
                            </xsl:for-each>
                        </span>
                    </xsl:if>
                </xsl:when>

                <xsl:when test="ref">
                    <xsl:value-of select="num" />
                    <span class="button" onclick="this.nextSibling.style.display='inline-block'">
                        <xsl:value-of select="dom" />
                        <xsl:for-each select="ref[1]">
                            <xsl:value-of select="translate(text(), '[0123456789$~@#^]', '')"/>
                        </xsl:for-each>
                        <br/>
                    </span>
                    <span id="examples" onclick="this.style.display='none'">
                        <xsl:if test="exm/t">
                            <span id="examples" onclick="this.style.display='none'">
                                <xsl:for-each select="exm/t">
                                    <div>
                                        <xsl:value-of select="translate(text(), '[0123456789$~@#^]', '')"/>
                                    </div>
                                </xsl:for-each>
                            </span>
                        </xsl:if>
                    </span>
                </xsl:when>
            </xsl:choose>
        </div>
    </xsl:template>

    <xsl:template match="exp[1]">
        <div id="sense{num}">
            <xsl:choose>
                <xsl:when test="num">
                    <xsl:value-of select="num"/>
                </xsl:when>
                <xsl:otherwise>
                    1
                </xsl:otherwise>
            </xsl:choose>

            <span class="button" onclick="this.nextSibling.style.display='inline-block'">
                <xsl:value-of select="translate(text(), '[0123456789$~@#^]', '')"/>
                <br/>
            </span>
            <span id="examples" onclick="this.style.display='none'">
                <xsl:if test="../exm/t">
                    <xsl:for-each select="../exm/t">
                        <div>
                            <xsl:value-of select="translate(text(), '[0123456789$~@#^]', '')"/>
                        </div>
                    </xsl:for-each>
                </xsl:if>
            </span>
        </div>
    </xsl:template>

    <xsl:template match="ref">
        <div id="sense{num}">
            <xsl:choose>
                <xsl:when test="num">
                    <xsl:value-of select="num"/>
                </xsl:when>
                <xsl:otherwise>
                    1
                </xsl:otherwise>
            </xsl:choose>

            <span class="button" onclick="this.nextSibling.style.display='inline-block'">
                <xsl:value-of select="translate(text(), '[0123456789$~@#^]', '')"/>
                <br/>
            </span>
            <span id="examples" onclick="this.style.display='none'">
                <xsl:if test="../exm/t">
                    <xsl:for-each select="../exm/t">
                        <div>
                            <xsl:value-of select="translate(text(), '[0123456789$~@#^]', '')"/>
                        </div>
                    </xsl:for-each>
                </xsl:if>
            </span>
        </div>
    </xsl:template>

    <xsl:template match="dom"> </xsl:template>
    <xsl:template match="other/t"> </xsl:template>
    <xsl:template match="exm/t"> </xsl:template>
    <xsl:template match="gram"> </xsl:template>
    <xsl:template match="ref"> </xsl:template>
    <xsl:template match="phra"> </xsl:template>
    <xsl:template match="other"> </xsl:template>
    <xsl:template match="pron"> </xsl:template>

</xsl:stylesheet>

