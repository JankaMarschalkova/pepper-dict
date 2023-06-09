<?xml version="1.0" encoding="UTF-16"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" />
    <xsl:include href="root.xsl" />

    <xsl:template match="/">
        <xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text>
        <html lang="en">
            <head>
                <!-- metadata and fonts/styles linking -->

            </head>
            <body>
                <div class="container">
                    <div class="search">
                        <div class="text">
                            Slovník spisovné češtiny
                        </div>
                        <div class="input">
                            <label>
                                <input type="search" class="form-control" placeholder="Zadejte slovo, které chcete vyhledat" id="value">
                            </label>
                            <span class="input-text">
                                <a href="https://deb.fi.muni.cz/api/debdict.php?dict=ssc&action=list_starts_with&id=" class="icon">
                                    <img src="search-icon.svg" alt="search"/>
                                </a>
                            </span>
                        </div>
                    </div>
                </div>

                <div>
                <!-- our app -->
                <main class="application">
                    <xsl:apply-templates select="root"/>
                </main>
                </div>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>