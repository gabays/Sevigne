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
                        <a href="../TEI/HN_Sevigne_index.xml" target="_blank">afficher la source en TEI</a>
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
    
    <xsl:template match="head[parent::body]">
        <h1><xsl:apply-templates/></h1>
    </xsl:template>
    
    <xsl:template match="p">
        <p><xsl:apply-templates/></p>
    </xsl:template>
    
    <xsl:template match="figure">
        <img class="welcomeImage" src="{@facs}"/>
    </xsl:template>
    
    <!-- In case bold or italics are needed -->
    
    <xsl:template match="hi[@rend='italics']">
        <i><xsl:apply-templates/></i>
    </xsl:template>
    
    <xsl:template match="hi[@rend='bold']">
        <b><xsl:apply-templates/></b>
    </xsl:template>
    
</xsl:stylesheet>