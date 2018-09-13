<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" 
    exclude-result-prefixes="xs" version="2.0" 
    xpath-default-namespace="http://www.tei-c.org/ns/1.0">
    
    <xsl:output method="html"
        doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
    
    <xsl:template match="TEI">
        <html>
            <head>
                <link rel = "stylesheet" type = "text/css" href = "_css/style.css" />
            </head>
            <body>
                <header>
                    <div class="title">
                        <h1>Madame de Sévigné</h1>
                    </div>
                </header>
                <div class="sidebar">
                    <ul>Navigation</ul>
                    <li><a href="../_web/index.html">Accueil</a></li>
                    <li><a href="../_web/bibliography.html">Bibliographie</a></li>
                    <li><a href="../_web/news.html">Actualités</a></li>
                    <li><a href="../_web/links.html">Liens</a></li>
                    <li><a href="../_web/people.html">Équipe</a></li>
                </div>
                <div class="content">
                    <div class="TEIsource">
                        <a href="../TEI/HN_Sevigne_people.xml" target="_blank">afficher la source en TEI</a>
                    </div>
                    <xsl:apply-templates/>
                </div>
                <footer>
                    <img class="logo" src="HN_Sevigne_Images/Images_logos/Logo_unine.gif"/>
                    <img class="logo" src="HN_Sevigne_Images/Images_logos/Logo_uga.png"/>
                    <img class="logo" src="HN_Sevigne_Images/Images_logos/Logo_openData.png"/>
                </footer>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="teiHeader"/>
    
    <xsl:template match="listPerson">
        <ol>
            <xsl:for-each select="person">
                <xsl:sort order="descending" select="persName/@xml:id"/>
                <div class="item">
                <h2><xsl:value-of select="persName/surname"/><xsl:text>, </xsl:text><xsl:value-of select="persName/forename"/></h2>
                    <img class="entryImage" src="{@facs}"/>
                    <div class="entry">
                        <xsl:apply-templates/>
                    </div>
                </div>
            </xsl:for-each>
        </ol>
    </xsl:template>
    
    <xsl:template match="head[parent::body]">
        <h1><xsl:apply-templates/></h1>
    </xsl:template>
    
    <xsl:template match="occupation">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="affiliation">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="roleName">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="orgName">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="ref">
        <a href="{@target}" target="_blank"><xsl:apply-templates/></a>
    </xsl:template>
    
    <xsl:template match="bibl">
        <p><xsl:apply-templates/></p>
    </xsl:template>
    
    <xsl:template match="note[@type='resp']">
        <p><xsl:apply-templates/></p>
    </xsl:template>
    
    <!-- In case bold or italics are needed -->
    
    <xsl:template match="hi[@rend='italics']">
        <i><xsl:apply-templates/></i>
    </xsl:template>
    
    <xsl:template match="hi[@rend='bold']">
        <b><xsl:apply-templates/></b>
    </xsl:template>
    
    <xsl:template match="persName"/>
    
</xsl:stylesheet>