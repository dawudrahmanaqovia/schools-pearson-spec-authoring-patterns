<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions">

	<!-- Meta data section -->
	<xsl:template match="meta">
	
	
	  <div class="panel panel-danger">
		<div class="panel-heading">    
			<span class="panel-title" >		
			<i class="icon-collapse accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseMeta"/><xsl:text> </xsl:text>
			  Meta-data 
		  </span>
       		   
		</div>
		<div id="collapseMeta" class="panel-collapse collapse in">
		  <div class="panel-body">
		  
			<form class="form-inline" role="form">
				<div class="form-group">
				
  					<div class="row">
  					
						<xsl:apply-templates select="unit_title"/>
  					
					</div>				
					
  					<div class="row">
  					
						<xsl:apply-templates select="number | level | type | guided_learning_hours | assessment_type"/>
  					
					</div>
					
				</div>
			</form>
				
		  </div>
		</div>
	  </div>	

	</xsl:template>
	<!-- End Meta data section -->
	
  <xsl:template match="unit_title">
						<div class="col-xs-12">
							<label for="{local-name(.)}" class="control-label">Title: </label>
							<div class="form-control"><xsl:apply-templates select="text()"/>
								<i class="icon-question-sign pull-right" data-toggle="popover" title="" data-content="The title should reflect the learning aims/assessment criteria" data-original-title="Title"/>					
							</div>
						</div>
						
<!--		<div class="showMenuButton">
         <button 
	   class="menuButton" 
	   type="button" 
           onclick="insert_menu(this, node)" 
	   align="left">Add</button>
       </div>-->



  </xsl:template>
  
  
   <xsl:template match="number">
						<div class="col-xs-2">
							<label for="{local-name(.)}" class="control-label">Unit No: </label>
							<div class="form-control"><xsl:apply-templates select="text()"/></div>
						</div>
<!--						<button onclick="node.openAttributesEditor();">edit</button>
						<button onclick="lookup('{name()}',node);">edit2</button>-->
  </xsl:template>	

   <xsl:template match="level">
						<div class="col-xs-2">
							<label for="{local-name(.)}" class="control-label">Level </label>

      <select onchange="node.setTextContent(this.value)" class="form-control">
        <option>
          <xsl:if test="(. = '') or (. = 'select')">
            <xsl:attribute name="selected">true</xsl:attribute>
          </xsl:if> select </option>
        <option value="1">
          <xsl:if test=". = '1'">
            <xsl:attribute name="selected">true</xsl:attribute>
          </xsl:if> 1 </option>
        <option value="2">
          <xsl:if test=". = '2'">
            <xsl:attribute name="selected">true</xsl:attribute>
          </xsl:if> 2 </option>
        <option value="1 and 2">
          <xsl:if test=". = '1 and 2'">
            <xsl:attribute name="selected">true</xsl:attribute>
          </xsl:if> 1 and 2 </option>
      </select>								
							
							
						</div>
  </xsl:template>

   <xsl:template match="type">
						<div class="col-xs-2">
							<label for="{local-name(.)}" class="control-label">Unit Type: </label>
							
      <select onchange="node.setTextContent(this.value)" class="form-control">
        <option>
          <xsl:if test="(. = '') or (. = 'select')">
            <xsl:attribute name="selected">true</xsl:attribute>
          </xsl:if> select </option>
        <option value="Core/Mandatory">
          <xsl:if test=". = 'Core/Mandatory'">
            <xsl:attribute name="selected">true</xsl:attribute>
          </xsl:if> Core/Mandatory </option>
        <option value="Core">
          <xsl:if test=". = 'Core'">
            <xsl:attribute name="selected">true</xsl:attribute>
          </xsl:if> Core </option>
        <option value="Mandatory">
          <xsl:if test=". = 'Mandatory'">
            <xsl:attribute name="selected">true</xsl:attribute>
          </xsl:if> Mandatory </option>
        <option value="Optional specialist">
          <xsl:if test=". = 'Optional specialist'">
            <xsl:attribute name="selected">true</xsl:attribute>
          </xsl:if> Optional specialist </option>
      </select>					
							
						</div>
  </xsl:template>
  
     <xsl:template match="guided_learning_hours">
						<div class="col-xs-3">
							<label for="{local-name(.)}" class="control-label">Guided Learning Hours: </label>
							<div class="form-control"><xsl:apply-templates select="text()"/></div>
						</div>
  </xsl:template>
  
  <xsl:param name="xopus">false</xsl:param>
   <xsl:template match="assessment_type">
						<div class="col-xs-3">
							<label for="{local-name(.)}" class="control-label">Assessment Type: </label>		

      <select onchange="node.setTextContent(this.value)" class="form-control">
        <option>
          <xsl:if test="(. = '') or (. = 'select')">
            <xsl:attribute name="selected">true</xsl:attribute>
          </xsl:if> select </option>
        <option value="Internal">
          <xsl:if test=". = 'Internal'">
            <xsl:attribute name="selected">true</xsl:attribute>
          </xsl:if> Internal </option>
        <option value="External">
          <xsl:if test=". = 'External'">
            <xsl:attribute name="selected">true</xsl:attribute>
          </xsl:if> External </option>
      </select>
					
						</div>
  </xsl:template>
   
</xsl:stylesheet>
