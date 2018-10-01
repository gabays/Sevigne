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
                    <li><a href="../_web/HN_Sevigne_bib1.html">Bibliographie primaire</a></li>
                    <li><a href="../_web/HN_Sevigne_bib2.html">Bibliographie secondaire</a></li>
                    <li><a href="../_web/news.html">Actualités</a></li>
                    <li><a href="../_web/links.html">Liens</a></li>
                    <li><a href="../_web/people.html">Équipe</a></li>
                </div>
                <div class="content">
                    <div class="TEIsource">
                        <a href="../TEI/HN_Sevigne_bib.xml" target="_blank">afficher la source en TEI</a>
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

    <xsl:template match="listBibl">
        <ol><xsl:apply-templates/></ol>
    </xsl:template>

    <xsl:template match="bibl[parent::listBibl]">
        <li class="biblEntry"><xsl:apply-templates/></li>
    </xsl:template>

    <xsl:template match="author">

        <xsl:choose>
            <xsl:when test="@role = 'dir'">
                <span class="dir"><xsl:apply-templates/></span>
            </xsl:when>
            <xsl:otherwise>
            
            <span class="author"><xsl:apply-templates/></span>
            </xsl:otherwise>
            
        </xsl:choose>

    </xsl:template>
    
    <xsl:template match="forename">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="persName">
        <xsl:choose>
            <xsl:when test="@role = 'sup'">
                <span class="sup"><xsl:apply-templates/></span>
            </xsl:when>
            
            <xsl:otherwise/>
        </xsl:choose>
        
    </xsl:template>
    
    <xsl:template match="surname">
        <b><xsl:apply-templates/></b>
    </xsl:template>
    
    <xsl:template match="nameLink">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="title">
        <xsl:choose>
            <xsl:when test="@level = 'u'">
                <span class="u"><xsl:apply-templates/></span>
            </xsl:when>

            <xsl:when test="@level = 'a'">
                <span class="a"><xsl:apply-templates/></span>
            </xsl:when>
            
            <xsl:when test="@level = 'm'">
                <span class="m"><xsl:apply-templates/></span>
            </xsl:when>
            
            <xsl:when test="@level = 'j'">
                <span class="j"><xsl:apply-templates/></span>
            </xsl:when>
            
            <xsl:otherwise/>

        </xsl:choose>
        
    </xsl:template>
    
    <xsl:template match="date">
        <span class="date"><xsl:apply-templates/></span>
    </xsl:template>
    
    <xsl:template match="editor">
        <span class="ed"><xsl:apply-templates/></span>
    </xsl:template>
    
    <xsl:template match="note[@type='comm']">
        <span class="comm"><xsl:text>Commentaire: </xsl:text><xsl:apply-templates/></span>
    </xsl:template>
    
    <xsl:template match="bibl[parent::bibl]">
        <div class="biblDigitised"> <xsl:text>Disponible en ligne: </xsl:text><xsl:apply-templates/></div>
    </xsl:template>
    
    <xsl:template match="ref[parent::bibl[@type='digitised']]">
        [<a href="{@target}" target="_blank"><xsl:apply-templates/></a>]
    </xsl:template>
    
    
    <!-- In case bold or italics are needed -->
    
    <xsl:template match="hi[@rend='italics']">
        <i><xsl:apply-templates/></i>
    </xsl:template>
    
    <xsl:template match="hi[@rend='bold']">
        <b><xsl:apply-templates/></b>
    </xsl:template>
    
</xsl:stylesheet>