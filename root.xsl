<?xml version="1.0" encoding="UTF-16"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" />

    <xsl:template match="root">
        <div class="h">
            <xsl:text>Slovo: </xsl:text>
            <xsl:value-of select="h"/>
        </div>
        <p class="gram">
            <xsl:text>Rod: </xsl:text>
            <xsl:value-of select="gram"/>
        </p>
        <xsl:apply-templates select="sens"/>
    </xsl:template>

    <xsl:template match="sens">
        <div class="num">
            <xsl:text>Poradi: </xsl:text>
            <xsl:value-of select="num"/>
            <xsl:text>Vyznam: </xsl:text>
            <xsl:value-of select="exp"/>
            <xsl:for-each select="ref">
                <xsl:value-of select="ref"/>
                <xsl:text> Kategorie: </xsl:text>
                <xsl:value-of select="refcateg"/>
            </xsl:for-each>
        </div>
    </xsl:template>
</xsl:stylesheet>