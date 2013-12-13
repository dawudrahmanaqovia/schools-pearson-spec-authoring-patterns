<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions">
	<!-- COMPONENT SECTIONS TO IMPORT -->
	<!-- Unit data section -->
	<xsl:import href="btec_unit.xsl"/>	
	<!-- Meta data section -->
	<xsl:import href="btec_meta.xsl"/>
	<!-- Introduction data section -->	
	<xsl:import href="btec_introduction.xsl"/>
	<!-- Learning Aim data section -->	
	<xsl:import href="btec_learning_objective.xsl"/>
	<!-- Content data section -->	
	<xsl:import href="btec_content.xsl"/>
	<!-- Assessment Criteria data section -->
	<xsl:import href="btec_assessment_criteria.xsl"/>
	<!-- Suggested Assignment data section -->
	<xsl:import href="btec_suggested_assignment.xsl"/>
	<!-- Teacher Guidance data section -->
	<xsl:import href="btec_teacher_guidance.xsl"/>
								
	<!-- Root node -->
	<xsl:template match="/">
		<html>
			<head>
				<title>Pearson Content</title>

                <!-- Stylesheet section -->
                <link rel="stylesheet" href="/api/objects/css/btec_bootstrap.min.css" type="text/css"/><!-- Bootstrap -->
                <!--<link rel="stylesheet" type="text/css" href="/api/objects/css/btec_bootstrap-dropdown-checkbox.css"/>-->
                <link rel="stylesheet" href="/api/objects/css/font-awesome.css" type="text/css"/><!-- Font awesome font based icons  -->
                <link rel="stylesheet" href="/api/objects/css/btec_common.css" type="text/css"/>

                <!-- JavaScript section -->
                <!-- Scripts should be declared last for optimisation  -->
				<script type="text/javascript" src="/api/objects/js/btec_jquery.min.js"/><!-- jQuery 2.0 -->
				<script type="text/javascript" src="/api/objects/js/btec_bootstrap.min.js"/>
				<script type="text/javascript" src="/api/objects/js/btec_initialize.js"/>
                <!--<script type="text/javascript" src="/api/objects/js/btec_navigation.js"/>-->
				<script type="text/javascript" src="/api/objects/js/btec_meta.js"/>
                <script type="text/javascript" src="/api/objects/js/btec_pattern.main.js"></script>
                <script type="text/javascript">
                    console.log('script running');
                </script>

				
			</head>
			<body>
    <div id="category_options" onclick="event.cancelBubble = true; ;return false;">
      <div class="boxside-left"></div>
      <div class="boxside-right"></div>
    </div>                        
                                <!-- Unit section -->
                                <xsl:apply-templates select="unit"/>
                        </body>



                </html>
        </xsl:template>

        
        
        
        <!-- Prepend each section title with an autoincrementing number. -->
        <xsl:template match="section/title">
                <h2>
                        <xsl:number count="article|section" from="/article" level="multiple" format="1"/>. <xsl:apply-templates select="node()"/>
                </h2>
        </xsl:template>
        <xsl:template match="section">
                <div class="section">
                        <xsl:apply-templates select="node()"/>
                </div>
        </xsl:template>
        <xsl:template match="footer">
                <div class="footer">
                        <xsl:apply-templates select="node()"/>
                </div>
        </xsl:template>
        <xsl:template match="paragraph">
                <p>
                        <xsl:apply-templates select="@*|node()"/>
                </p>
        </xsl:template>
        <!-- Render inline elements -->
        <xsl:template match="strong">
                <b>
                        <xsl:apply-templates select="node()"/>
                </b>
        </xsl:template>
        <xsl:template match="emphasis">
                <i>
                        <xsl:apply-templates select="node()"/>
                </i>
        </xsl:template>
        <xsl:template match="underline">
                <u>
                        <xsl:apply-templates select="node()"/>
                </u>
        </xsl:template>
        <xsl:template match="subscript">
                <sub>
                        <xsl:apply-templates select="node()"/>
                </sub>
        </xsl:template>
        <xsl:template match="superscript">
                <sup>
                        <xsl:apply-templates select="node()"/>
                </sup>
        </xsl:template>
        <xsl:template match="linebreak">
                <br/>
        </xsl:template>
        <xsl:template match="link">
                <a>
                        <xsl:apply-templates select="@*|node()"/>
                </a>
        </xsl:template>
        <xsl:template match="image">
                <img src="{@src}">
                        <xsl:if test="@width">
                                <xsl:attribute name="width"><xsl:value-of select="@width"/></xsl:attribute>
                        </xsl:if>
                        <xsl:if test="@height">
                                <xsl:attribute name="height"><xsl:value-of select="@height"/></xsl:attribute>
                        </xsl:if>
                        <xsl:if test="@halign and @halign!='none'">
                                <xsl:attribute name="align"><xsl:value-of select="@halign"/></xsl:attribute>
                                <xsl:attribute name="class">align-<xsl:value-of select="@halign"/></xsl:attribute>
                        </xsl:if>
                </img>
        </xsl:template>
        <!-- Render lists -->
        <xsl:template match="unorderedlist">
                <ul>
                        <xsl:apply-templates select="item"/>
                </ul>
        </xsl:template>
        <xsl:template match="orderedlist">
                <ol>
                        <xsl:apply-templates select="item"/>
                </ol>
        </xsl:template>
        <xsl:template match="item">
                <li>
                        <xsl:apply-templates select="*"/>
                </li>
        </xsl:template>
        <!-- Render table -->
        <xsl:template match="table">
                <div align="center">
                        <table border="0">
                                <xsl:copy-of select="@cellpadding"/>
                                <xsl:attribute name="width"><!-- literal width on table elm fails in Firefox xslt --><xsl:value-of select="@width"/><xsl:text>%</xsl:text></xsl:attribute>
                                <xsl:attribute name="class"><xsl:choose><xsl:when test="@color">color_<xsl:value-of select="@color"/></xsl:when><xsl:otherwise>color_grey</xsl:otherwise></xsl:choose><xsl:choose><xsl:when test="@border"> border_<xsl:value-of select="@border"/></xsl:when><xsl:otherwise> border_no</xsl:otherwise></xsl:choose></xsl:attribute>
                                <!-- Default the cellpadding attribute to 0. -->
                                <xsl:choose>
                                        <xsl:when test="@cellspacing">
                                                <xsl:copy-of select="@cellspacing"/>
                                        </xsl:when>
                                        <xsl:otherwise>
                                                <xsl:attribute name="cellspacing">0</xsl:attribute>
                                        </xsl:otherwise>
                                </xsl:choose>
                                <xsl:apply-templates select="tbody"/>
                        </table>
                        <xsl:apply-templates select="caption"/>
                </div>
        </xsl:template>
        <xsl:template match="caption">
                <div class="caption">
                        <xsl:apply-templates select="node()"/>
                </div>
        </xsl:template>
        <xsl:template match="tbody">
                <tbody>
                        <xsl:attribute name="class"><xsl:text>rowcoloring_</xsl:text><xsl:choose><xsl:when test="../@alternaterowcolor='true' or ../@alternaterowcolor='1'">alternate</xsl:when><xsl:otherwise>normal</xsl:otherwise></xsl:choose></xsl:attribute>
                        <xsl:apply-templates select="tr"/>
                </tbody>
        </xsl:template>
        <xsl:template match="tr">
                <tr>
                        <!-- Add an even or odd class to each row so we can alternate the row colors. -->
                        <xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">evenorodd_odd</xsl:when><xsl:otherwise>evenorodd_even</xsl:otherwise></xsl:choose></xsl:attribute>
                        <xsl:apply-templates select="td|th"/>
                </tr>
        </xsl:template>
        <xsl:template match="td|th">
                <xsl:element name="{local-name()}">
                        <xsl:copy-of select="@rowspan"/>
                        <xsl:copy-of select="@colspan"/>
                        <xsl:copy-of select="@bgcolor"/>
                        <xsl:attribute name="valign">top</xsl:attribute>
                        <xsl:apply-templates select="node()"/>
                </xsl:element>
        </xsl:template>
        <!-- other -->
        <!-- Copy attributes by default -->
        <xsl:template match="@*">
                <xsl:copy-of select="."/>
        </xsl:template>
        <xsl:template match="@align">
                <xsl:attribute name="class"><xsl:text>align-</xsl:text><xsl:value-of select="."/></xsl:attribute>
        </xsl:template>
</xsl:stylesheet>
